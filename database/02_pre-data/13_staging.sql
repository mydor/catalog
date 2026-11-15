--
-- PostgreSQL database dump
--

\restrict DisableCodeExecution

-- Dumped from database version 18.4
-- Dumped by pg_dump version 18.7 (Ubuntu 18.7-1.pgdg24.04+2)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: staging; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA staging;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: duplicate_candidate; Type: TABLE; Schema: staging; Owner: -
--

CREATE TABLE staging.duplicate_candidate (
    duplicate_candidate_id bigint NOT NULL,
    source_table character varying(100),
    source_record_id bigint,
    release_id bigint,
    match_score numeric(5,4),
    resolution_status character varying(50),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: duplicate_candidate_duplicate_candidate_id_seq; Type: SEQUENCE; Schema: staging; Owner: -
--

ALTER TABLE staging.duplicate_candidate ALTER COLUMN duplicate_candidate_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME staging.duplicate_candidate_duplicate_candidate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: etl_job; Type: TABLE; Schema: staging; Owner: -
--

CREATE TABLE staging.etl_job (
    etl_job_id bigint NOT NULL,
    import_batch_id bigint,
    job_name character varying(255),
    started_at timestamp with time zone,
    completed_at timestamp with time zone,
    status character varying(50),
    rows_processed integer,
    rows_loaded integer,
    rows_failed integer
);


--
-- Name: etl_job_etl_job_id_seq; Type: SEQUENCE; Schema: staging; Owner: -
--

ALTER TABLE staging.etl_job ALTER COLUMN etl_job_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME staging.etl_job_etl_job_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: import_batch; Type: TABLE; Schema: staging; Owner: -
--

CREATE TABLE staging.import_batch (
    import_batch_id bigint NOT NULL,
    user_id bigint,
    source_host character varying(253),
    source_ip inet,
    source_filename character varying(500),
    import_started_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    import_completed_at timestamp with time zone,
    status character varying(50)
);


--
-- Name: import_batch_import_batch_id_seq; Type: SEQUENCE; Schema: staging; Owner: -
--

ALTER TABLE staging.import_batch ALTER COLUMN import_batch_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME staging.import_batch_import_batch_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: stg_books; Type: TABLE; Schema: staging; Owner: -
--

CREATE TABLE staging.stg_books (
    stg_book_id bigint NOT NULL,
    import_batch_id bigint NOT NULL,
    source_row_number integer,
    title text,
    series text,
    edition text,
    publication_year text,
    page_count text,
    barcode text,
    isbn text,
    format text,
    publisher text,
    authors text,
    width text,
    height text,
    depth text,
    weight text,
    added_on text,
    updated_on text,
    raw_record jsonb
);


--
-- Name: stg_books_stg_book_id_seq; Type: SEQUENCE; Schema: staging; Owner: -
--

ALTER TABLE staging.stg_books ALTER COLUMN stg_book_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME staging.stg_books_stg_book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: stg_games; Type: TABLE; Schema: staging; Owner: -
--

CREATE TABLE staging.stg_games (
    stg_game_id bigint NOT NULL,
    import_batch_id bigint NOT NULL,
    source_row_number integer,
    game_type text,
    title text,
    sort_title text,
    part_number text,
    publisher text,
    series text,
    players text,
    barcode text,
    isbn text,
    serial_number text,
    edition text,
    age_rating text,
    minimum_time text,
    maximum_time text,
    width text,
    height text,
    depth text,
    weight text,
    box text,
    added_on text,
    updated_on text,
    raw_record jsonb
);


--
-- Name: stg_games_stg_game_id_seq; Type: SEQUENCE; Schema: staging; Owner: -
--

ALTER TABLE staging.stg_games ALTER COLUMN stg_game_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME staging.stg_games_stg_game_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: stg_movies; Type: TABLE; Schema: staging; Owner: -
--

CREATE TABLE staging.stg_movies (
    stg_movie_id bigint NOT NULL,
    import_batch_id bigint NOT NULL,
    source_row_number integer,
    media_format text,
    title text,
    sort_title text,
    age_rating text,
    barcode text,
    isbn text,
    runtime_minutes text,
    release_year text,
    discs text,
    screen_format text,
    edition text,
    private text,
    box text,
    added_on text,
    updated_on text,
    raw_record jsonb
);


--
-- Name: stg_movies_stg_movie_id_seq; Type: SEQUENCE; Schema: staging; Owner: -
--

ALTER TABLE staging.stg_movies ALTER COLUMN stg_movie_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME staging.stg_movies_stg_movie_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: stg_music; Type: TABLE; Schema: staging; Owner: -
--

CREATE TABLE staging.stg_music (
    stg_music_id bigint NOT NULL,
    import_batch_id bigint NOT NULL,
    source_row_number integer,
    media_type text,
    artist text,
    album_title text,
    release_year text,
    edition text,
    discs text,
    barcode text,
    box text,
    added_on text,
    updated_on text,
    raw_record jsonb
);


--
-- Name: stg_music_stg_music_id_seq; Type: SEQUENCE; Schema: staging; Owner: -
--

ALTER TABLE staging.stg_music ALTER COLUMN stg_music_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME staging.stg_music_stg_music_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: validation_error; Type: TABLE; Schema: staging; Owner: -
--

CREATE TABLE staging.validation_error (
    validation_error_id bigint NOT NULL,
    import_batch_id bigint,
    source_table character varying(100),
    source_record_id bigint,
    error_code character varying(100),
    error_message text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: validation_error_validation_error_id_seq; Type: SEQUENCE; Schema: staging; Owner: -
--

ALTER TABLE staging.validation_error ALTER COLUMN validation_error_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME staging.validation_error_validation_error_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- PostgreSQL database dump complete
--

\unrestrict DisableCodeExecution

