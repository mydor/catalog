#!/bin/env python

import csv
import io
import json
import numpy as np
import os
import pandas as pd
import socket
import sqlalchemy
import sys
import warnings

from functools import wraps, lru_cache, cache
from hashlib import sha256 as hashfunc
from pprint import pprint
from sqlalchemy import create_engine, ForeignKey, String, Integer, BigInteger, MetaData, select, inspect, func
from sqlalchemy.ext.asyncio import create_async_engine, async_sessionmaker
from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import DeclarativeBase, Mapped, Session, mapped_column, relationship
from sqlalchemy.dialects.postgresql import insert
from sqlalchemy.dialects.postgresql.base import ischema_names
from pgvector.sqlalchemy import Vector


warnings.filterwarnings('ignore', category=UserWarning, module='openpyxl')

ischema_names['vector'] = Vector

DATABASE_HOST = os.environ['DB_HOST'] or '127.0.0.1'
DATABASE_NAME = os.environ['DB_NAME'] or 'catalog'
DATABASE_USER = os.environ['DB_USER'] or 'user'
DATABASE_PASS = os.environ['DB_PASS'] or 'pass'
DATABASE_URL  = f'postgresql+psycopg://{DATABASE_USER}:{DATABASE_PASS}@{DATABASE_HOST}/{DATABASE_NAME}'
SYNC_ENGINE   = create_engine(DATABASE_URL.replace('+asyncpg', ''), echo=False)
PICKLE_DIR    = 'cache/'
EXCEL_FILE    = os.environ['EXCEL_FILE'] or '/mnt/drobo/Public/Books.xlsm'

DB_ENGINE = create_async_engine(DATABASE_URL, pool_size=20, max_overflow=20, echo=True, isolation_level='REPATABLE READ')
### AsyncSessionLocal = async_sessionmaker(bind=DB_ENGINE, expire_on_commit=False)

# Load ORM from the actual schema/tables
Base = automap_base()
for s in ('ai', 'assets', 'catalog', 'circulation', 'integration', 'inventory', 'staging', 'storage', 'users'):
    Base.metadata.reflect(bind = SYNC_ENGINE, schema=s)

Base.prepare()

AppUser = Base.classes.app_user

db_session = Session(SYNC_ENGINE)

@lru_cache(maxsize=128)
def in_to_mm(length):
    return length * 25.4

@lru_cache(maxsize=128)
def mm_to_in(length):
    return length / 25.4

@lru_cache(maxsize=128)
def oz_to_g(weight):
    return weight * 28.349523125

@lru_cache(maxsize=128)
def g_to_oz(weight):
    return weight / 28.349523125

def find_header_row(df, idx_col_name='#'):
    row = (df.iloc[:, 0] == idx_col_name).idxmax()
    return row

def normalize_headers(headers):
    return [x.replace(' ', '_').replace('_#', '_Num').replace('Qty.', 'Qty') for x in headers]

def get_real_dataframe(df, idx_col_name='#', nan_col_check='Title', last_col_name='Added', keep_cols=None):
    # Find and set the column headers
    header_row = find_header_row(df, idx_col_name)

    headers = df.iloc[header_row].fillna('').astype(str).tolist()
    # Book header fix
    if 'Author' in headers:
        author_idx = headers.index('Author')
        for x in range(author_idx+1, len(headers)):
            # If the column already has a name, abort
            if headers[x] != '':
                break

            # If the previous column was 'Author', set the new, blank, column to 'Author'
            if headers[x-1] == 'Author':
                headers[x] = 'Author'
        # Now, set the first one to plural Authors
        headers[author_idx] = 'Authors'

    # Replace spaces in header name with _
    # Replace _# in header with _Num, since # causes pandas problems
    # Replace Qty. with Qty, since pandas columns ending with . causes problems
    headers = normalize_headers(headers)

    df = pd.DataFrame(df.iloc[header_row+1:].values, columns=headers)

    if keep_cols:
        df = df.drop(columns=df.columns.difference(normalize_headers(keep_cols)))

    # Drop columns without headers
    df = df.loc[:, ~df.columns.str.strip().isin([''])]

    # Drop any empty rows
    df = df.dropna(subset=[nan_col_check])

    # Set the dataframe index column
    df = df.set_index(idx_col_name)

    # Convert NaN to blanks
    df = df.fillna('').astype(str)

    return df

def load_df(workbook=None, sheet=None, last_col_name=None, keep_cols=None, nan_col_check=None, idx_col_name=None):
    print('-'*50)
    print(f"Loading {sheet}")

    if idx_col_name is None:
        idx_col_name = '#'

    raw_file = f'{PICKLE_DIR}{sheet}-raw.pkl'
    if workbook is not None:
        df = workbook[sheet]
        print(f'Saving RAW to {raw_file}')
        df.to_pickle(raw_file)
    else:
        ### TODO:
        ### if os.path.getmtime(excel) > os.path.getmtime(raw_file):
        ###     load excel
        ### else
        ###     load raw pickle file
        print(f'Loading RAW from {raw_file}')
        df = pd.read_pickle(raw_file)

    df = get_real_dataframe(df,
            idx_col_name=idx_col_name,
            nan_col_check=nan_col_check,
            last_col_name=last_col_name,
            keep_cols=keep_cols)


    cleaned_file = f'{PICKLE_DIR}{sheet}.pkl'
    print(f'Saving "cleaned" data to {cleaned_file}')
    df.to_pickle(cleaned_file)

    return df

### TODO: don't use 'func' here, confusion with sqlalchemy 'func'
def showit(func):
    @wraps(func)
    def wrapper(*args, **kwargs):
        result = func(*args, **kwargs)

        #print(result.iloc[:1])
        #print(result.iloc[:1].to_json())

        return result
    return wrapper

@lru_cache(maxsize=128)
def staging_batch(sheet = None, user=None):
    if sheet is None:
        raise ValueError('Excel sheet name cannot be None')

    if user is None:
        raise ValueError('Excel user cannot be None')

    uri = f'file://{EXCEL_FILE}#{sheet}'

    import_batch = Base.classes.import_batch

    statement = select(import_batch).where(import_batch.source_filename == uri)

    source_host = get_primary_fqdn()
    source_ip = get_primary_ip()

    batch = db_session.scalars(statement).first()
    if batch is None:
        batch = import_batch(
                user_id = user,
                source_host = source_host,
                source_ip = source_ip,
                source_filename = uri,
                import_started_at = func.now()
            )
        db_session.add(batch)
        print('Add batch')
        db_session.commit()

    else:
        batch.source_host = source_host
        batch.source_ip = source_ip
        batch.import_started_at = func.now()

    return batch

def row_to_dict(row):
    raw = row.copy()
    raw['idx'] = raw.name

    return raw.to_dict()

def store_staging1(df, sheet=None, user=None, orm=None, mapping=None):
    batch = staging_batch(sheet = sheet, user = user)

    for idx, row in df.iterrows():
        record = orm()

        for src_attr, dst_attr in mapping.items():
            setattr(record, dst_attr, getattr(row, src_attr, ''))
    
        record.import_batch_id = batch.import_batch_id
        record.source_row_number = row.name
        record.raw_record = row_to_dict(row)
    
        db_session.add(record)
    
        # the ORM class model does not support ON CONFLICT
        # so with throw an Integrity Error on duplicates
        try:
            db_session.commit()
        except sqlalchemy.exc.IntegrityError:
            #print(f'Duplicate row: {row}')
            db_session.rollback()

def store_staging2(df, sheet=None, user=None, orm=None, mapping=None):
    batch = staging_batch(sheet = sheet, user = user)

    for idx, row in df.iterrows():
        record = {
                'import_batch_id': batch.import_batch_id,
                'source_row_number': row.name,
                'raw_record': row_to_dict(row)
                }

        for src_attr, dst_attr in mapping.items():
            data = getattr(row, src_attr, '')
            if isinstance(data, list):
                fh = io.StringIO()
                writer = csv.writer(fh, quoting=csv.QUOTE_NONNUMERIC)
                writer.writerow(data)
                data = fh.getvalue().strip()
            record[dst_attr] = data

        ### pprint(record)
        ### raise RuntimeError

        insert_stmt = insert(orm).values(record)
        insert_stmt = insert_stmt.on_conflict_do_nothing()

        db_session.execute(insert_stmt)

    db_session.commit()

STORE_STAGING = store_staging2

@showit
def load_books(workbook=None, sheet='Books', last_col_name='d'):
    idx_col_name = '#'
    nan_col_check = 'Title'
    keep_cols = (
            '#',
            'Title',
            'Series',
            'Edition',
            'Year',
            'Length',
            'Measure',
            'Barcode',
            'ISBN',
            'Type',
            'Publisher',
            'Authors',
            'Author',
            'Box',
            'Added',
            'Updated',
            'Weight_g',
            )

    df = load_df(
            workbook=workbook,
            sheet=sheet,
            last_col_name=last_col_name,
            keep_cols=keep_cols,
            nan_col_check=nan_col_check,
            idx_col_name=idx_col_name)

    mapping = {
            'Title': 'title',
            'Series': 'series',
            'Edition': 'edition',
            'Year': 'publication_year',
            'Length': 'page_count',
            'Barcode': 'barcode',
            'ISBN': 'isbn',
            'Type': 'format',
            'Publisher': 'publisher',
            'Authors': 'authors',
            'w': 'width',
            'h': 'height',
            'd': 'depth',
            'Weight_g': 'weight',
            'Added': 'added_on',
            'Updated': 'updated_on',
        }

    # Rename the first Author column to Authors
    author_idx = df.columns.to_list().index('Authors')

    # Can't use a simple .tolist(), since we need to exclude nan and blanks
    df['Authors'] = df.filter(regex = '^Author').apply( lambda row: [str(x).replace('\r', '').replace('\n', '').strip() for x in row if pd.notna(x) and x.strip() != ''], axis=1)

    # Drop the singular Author columns, since we have our list now in Authors
    df = df.drop(columns = df.filter(regex = '^Author$').columns)
    
    STORE_STAGING(df, sheet=sheet, user=1, orm=Base.classes.stg_books, mapping=mapping)

    return df

#@showit
def load_games(workbook=None, sheet='Games', last_col_name='Added'):
    idx_col_name = '#'
    nan_col_check = 'Title'
    keep_cols = (
            '#',
            'Type',
            'Title',
            'Sort Title',
            'Part #',
            'Publisher',
            'Series',
            'Players',
            'Barcode',
            'ISBN',
            'Serial #',
            'Edition',
            'Box',
            'Rating',
            'Min',
            'Max',
            'W',
            'H',
            'D',
            'Weight_oz',
            'Rack',
            'Shelf',
            'Qty.',
            'Updated',
            'Added',
            'Weight_g',
            )

    mapping = {
            'Type': 'game_type',
            'Title': 'title',
            'Sort_Title': 'sort_title',
            'Part_Num': 'part_number',
            'Publisher': 'publisher',
            'Series': 'series',
            'Players': 'players',
            'Barcode': 'barcode',
            'ISBN': 'isbn',
            'Serial_Num': 'serial_number',
            'Edition': 'edition',
            'Box': 'box',
            'Rating': 'age_rating',
            'Min': 'minimum_time',
            'Max': 'maximum_time',
            'W': 'width',
            'H': 'height',
            'D': 'depth',
            'Weight_g': 'weight',
            'Added': 'added_on',
            'Updated': 'updated_on',
        }

    df = load_df(
            workbook=workbook,
            sheet=sheet,
            last_col_name=last_col_name,
            keep_cols=keep_cols,
            nan_col_check=nan_col_check,
            idx_col_name=idx_col_name)

    STORE_STAGING(df, sheet=sheet, user=1, orm=Base.classes.stg_games, mapping=mapping)

    return df

#@showit
def load_movies(workbook=None, sheet='Movies', last_col_name='Updated'):
    idx_col_name = '#'
    nan_col_check = 'Title'
    keep_cols = ('#',
                 'Media',
                 'Title',
                 'Sort Title',
                 'Rating',
                 'Barcode',
                 'ISBN',
                 'Time',
                 'Year',
                 'Discs',
                 'Format',
                 'Edition',
                 'Private',
                 'Set',
                 'Box',
                 'Added',
                 'Updated',
                 )

    mapping = {
            'Media': 'media_format',
            'Title': 'title',
            'Sort_Title': 'sort_title',
            'Rating': 'age_rating',
            'Barcode': 'barcode',
            'ISBN': 'isbn',
            'Time': 'runtime_minutes',
            'Year': 'release_year',
            'Discs': 'discs',
            'Format': 'screen_format',
            'Edition': 'edition',
            'Private': 'private',
            'Box': 'box',
            'Added': 'added_on',
            'Updated': 'updated_on',
        }

    df = load_df(
            workbook=workbook,
            sheet=sheet,
            last_col_name=last_col_name,
            keep_cols=keep_cols,
            nan_col_check=nan_col_check,
            idx_col_name=idx_col_name)

    STORE_STAGING(df, sheet=sheet, user=1, orm=Base.classes.stg_movies, mapping=mapping)

    return df

#@showit
def load_music(workbook=None, sheet='Music', last_col_name='Updated'):
    idx_col_name = '#'
    nan_col_check = 'Album'
    keep_cols = ('#',
                 'Media',
                 'Artist',
                 'Album',
                 'Year',
                 'Edition',
                 'Discs',
                 'Barcode',
                 'Box',
                 'Added',
                 'Updated',
                 )

    mapping = {
            'Media': 'media_type',
            'Artist': 'artist',
            'Album': 'album_title',
            'Year': 'release_year',
            'Edition': 'edition',
            'Discs': 'discs',
            'Barcode': 'barcode',
            'Box': 'box',
            'Added': 'added_on',
            'Updated': 'updated_on',
        }

    df = load_df(
            workbook=workbook,
            sheet=sheet,
            last_col_name=last_col_name,
            keep_cols=keep_cols,
            nan_col_check=nan_col_check,
            idx_col_name=idx_col_name)

    STORE_STAGING(df, sheet=sheet, user=1, orm=Base.classes.stg_music, mapping=mapping)

    return df

@lru_cache(maxsize=5)
def get_primary_fqdn():
    return socket.getfqdn(get_primary_ip())

@lru_cache(maxsize=5)
def get_primary_ip():
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    try:
        # Doesn't need to be reachable, just triggers the routing interface
        s.connect(('10.254.254.254', 1))
        ip = s.getsockname()[0]
    except Exception:
        ip = '127.0.0.1'
    finally:
        s.close()
    return ip

def main():
    pd.set_option('display.max_rows', None)
    pd.set_option('display.max_columns', None)
    pd.set_option('display.max_colwidth', None)

    wb = None
    #wb = pd.read_excel(EXCEL_FILE, sheet_name=None, header=None, index_col=None, dtype=str)

    load_books(wb)
    load_games(wb)
    load_movies(wb)
    load_music(wb)

if __name__ == '__main__':
    main()

