--
-- PostgreSQL database dump
--

\restrict UAYDsghj6XvNc8lymjhiA5tKWWu6xIbSgDLnRhV9tJ2Lu1VhkUBM0FGOmaiE4w1

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
-- Name: catalog; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA catalog;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: age_rating; Type: TABLE; Schema: catalog; Owner: -
--

CREATE TABLE catalog.age_rating (
    age_rating_id bigint NOT NULL,
    rating_system character varying(50) NOT NULL,
    rating_code character varying(50) NOT NULL,
    rating_name character varying(255),
    description text,
    minimum_age integer
);


--
-- Name: age_rating_age_rating_id_seq; Type: SEQUENCE; Schema: catalog; Owner: -
--

ALTER TABLE catalog.age_rating ALTER COLUMN age_rating_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME catalog.age_rating_age_rating_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: book_release; Type: TABLE; Schema: catalog; Owner: -
--

CREATE TABLE catalog.book_release (
    release_id bigint NOT NULL,
    book_format_id bigint
);


--
-- Name: content_item; Type: TABLE; Schema: catalog; Owner: -
--

CREATE TABLE catalog.content_item (
    content_item_id bigint NOT NULL,
    work_id bigint,
    title character varying(500),
    content_type character varying(50),
    page_count integer,
    runtime_minutes integer,
    sequence_number integer,
    notes text,
    CONSTRAINT content_item_length_check CHECK ((num_nonnulls(page_count, runtime_minutes) = 1))
);


--
-- Name: content_item_content_item_id_seq; Type: SEQUENCE; Schema: catalog; Owner: -
--

ALTER TABLE catalog.content_item ALTER COLUMN content_item_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME catalog.content_item_content_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: game_release; Type: TABLE; Schema: catalog; Owner: -
--

CREATE TABLE catalog.game_release (
    release_id bigint NOT NULL,
    game_type_id bigint,
    players_min integer,
    players_max integer,
    play_time_min integer,
    play_time_max integer
);


--
-- Name: genre; Type: TABLE; Schema: catalog; Owner: -
--

CREATE TABLE catalog.genre (
    genre_id bigint NOT NULL,
    parent_genre_id bigint,
    genre_name character varying(255) NOT NULL,
    description text
);


--
-- Name: genre_genre_id_seq; Type: SEQUENCE; Schema: catalog; Owner: -
--

ALTER TABLE catalog.genre ALTER COLUMN genre_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME catalog.genre_genre_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: identifier_type; Type: TABLE; Schema: catalog; Owner: -
--

CREATE TABLE catalog.identifier_type (
    identifier_type_id bigint NOT NULL,
    identifier_code character varying(50) NOT NULL,
    identifier_name character varying(255) NOT NULL,
    validation_regex text
);


--
-- Name: identifier_type_identifier_type_id_seq; Type: SEQUENCE; Schema: catalog; Owner: -
--

ALTER TABLE catalog.identifier_type ALTER COLUMN identifier_type_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME catalog.identifier_type_identifier_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: lookup_table; Type: TABLE; Schema: catalog; Owner: -
--

CREATE TABLE catalog.lookup_table (
    lookup_id bigint NOT NULL,
    code character varying(50) NOT NULL,
    name character varying(255) NOT NULL,
    description text
);


--
-- Name: TABLE lookup_table; Type: COMMENT; Schema: catalog; Owner: -
--

COMMENT ON TABLE catalog.lookup_table IS 'Should consolidate the following lookup tables.  Will require some changes to the tables that reference these tables.

inventory.item_condition
catalog.media_format
catalog.game_type
catalog.book_format
catalog.screen_format
catalog.age_rating';


--
-- Name: lookup_table_lookup_id_seq; Type: SEQUENCE; Schema: catalog; Owner: -
--

ALTER TABLE catalog.lookup_table ALTER COLUMN lookup_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME catalog.lookup_table_lookup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: media_format; Type: TABLE; Schema: catalog; Owner: -
--

CREATE TABLE catalog.media_format (
    media_format_id bigint NOT NULL,
    media_category character varying(50) NOT NULL,
    format_code character varying(100) NOT NULL,
    format_name character varying(255) NOT NULL,
    description text
);


--
-- Name: media_format_media_format_id_seq; Type: SEQUENCE; Schema: catalog; Owner: -
--

ALTER TABLE catalog.media_format ALTER COLUMN media_format_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME catalog.media_format_media_format_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: movie_release; Type: TABLE; Schema: catalog; Owner: -
--

CREATE TABLE catalog.movie_release (
    release_id bigint NOT NULL,
    screen_format_id bigint,
    movie_format_id bigint NOT NULL
);


--
-- Name: music_release; Type: TABLE; Schema: catalog; Owner: -
--

CREATE TABLE catalog.music_release (
    release_id bigint NOT NULL,
    release_year integer,
    disc_count integer,
    music_format_id bigint NOT NULL
);


--
-- Name: physical_dimension; Type: TABLE; Schema: catalog; Owner: -
--

CREATE TABLE catalog.physical_dimension (
    physical_dimension_id bigint NOT NULL,
    width_mm numeric(10,2),
    height_mm numeric(10,2),
    depth_mm numeric(10,2),
    weight_g numeric(12,2),
    CONSTRAINT catalog_physical_dimension_depth_mm_check CHECK (((depth_mm IS NULL) OR (depth_mm > (0)::numeric))),
    CONSTRAINT catalog_physical_dimension_height_mm_check CHECK (((height_mm IS NULL) OR (height_mm > (0)::numeric))),
    CONSTRAINT catalog_physical_dimension_weight_g_check CHECK (((weight_g IS NULL) OR (weight_g > (0)::numeric))),
    CONSTRAINT catalog_physical_dimension_width_mm_check CHECK (((width_mm IS NULL) OR (width_mm > (0)::numeric)))
);


--
-- Name: physical_dimension_physical_dimension_id_seq; Type: SEQUENCE; Schema: catalog; Owner: -
--

ALTER TABLE catalog.physical_dimension ALTER COLUMN physical_dimension_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME catalog.physical_dimension_physical_dimension_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: release; Type: TABLE; Schema: catalog; Owner: -
--

CREATE TABLE catalog.release (
    release_id bigint NOT NULL,
    work_id bigint,
    physical_dimension_id bigint,
    release_title character varying(500),
    edition character varying(255),
    release_year integer,
    age_rating_id bigint,
    release_notes text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    search_vector tsvector GENERATED ALWAYS AS (to_tsvector('english'::regconfig, (COALESCE(release_title, ''::character varying))::text)) STORED,
    release_type_id bigint
);


--
-- Name: TABLE release; Type: COMMENT; Schema: catalog; Owner: -
--

COMMENT ON TABLE catalog.release IS 'work_id nullable to make transition easier from excel that has no concept of "work"';


--
-- Name: release_component; Type: TABLE; Schema: catalog; Owner: -
--

CREATE TABLE catalog.release_component (
    release_component_id bigint NOT NULL,
    release_id bigint NOT NULL,
    media_format_id bigint NOT NULL,
    component_number integer,
    component_name character varying(255),
    quantity integer DEFAULT 1 NOT NULL,
    notes text
);


--
-- Name: release_component_release_component_id_seq; Type: SEQUENCE; Schema: catalog; Owner: -
--

ALTER TABLE catalog.release_component ALTER COLUMN release_component_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME catalog.release_component_release_component_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: release_content; Type: TABLE; Schema: catalog; Owner: -
--

CREATE TABLE catalog.release_content (
    release_component_id bigint CONSTRAINT release_component_content_release_component_id_not_null NOT NULL,
    content_item_id bigint CONSTRAINT release_component_content_content_item_id_not_null NOT NULL
);


--
-- Name: release_credit; Type: TABLE; Schema: catalog; Owner: -
--

CREATE TABLE catalog.release_credit (
    release_id bigint NOT NULL,
    contributor_id bigint NOT NULL,
    role_id bigint NOT NULL,
    credit_order integer,
    notes text
);


--
-- Name: release_genre; Type: TABLE; Schema: catalog; Owner: -
--

CREATE TABLE catalog.release_genre (
    release_id bigint NOT NULL,
    genre_id bigint NOT NULL
);


--
-- Name: release_identifier; Type: TABLE; Schema: catalog; Owner: -
--

CREATE TABLE catalog.release_identifier (
    release_identifier_id bigint NOT NULL,
    release_id bigint NOT NULL,
    identifier_type_id bigint NOT NULL,
    identifier_value character varying(255) NOT NULL,
    is_primary boolean DEFAULT false NOT NULL
);


--
-- Name: release_identifier_release_identifier_id_seq; Type: SEQUENCE; Schema: catalog; Owner: -
--

ALTER TABLE catalog.release_identifier ALTER COLUMN release_identifier_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME catalog.release_identifier_release_identifier_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: release_release_id_seq; Type: SEQUENCE; Schema: catalog; Owner: -
--

ALTER TABLE catalog.release ALTER COLUMN release_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME catalog.release_release_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: release_type; Type: TABLE; Schema: catalog; Owner: -
--

CREATE TABLE catalog.release_type (
    release_type_id bigint NOT NULL,
    release_type_code character varying(50) NOT NULL,
    release_type_name character varying(150) NOT NULL
);


--
-- Name: release_type_release_type_id_seq; Type: SEQUENCE; Schema: catalog; Owner: -
--

ALTER TABLE catalog.release_type ALTER COLUMN release_type_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME catalog.release_type_release_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: screen_format; Type: TABLE; Schema: catalog; Owner: -
--

CREATE TABLE catalog.screen_format (
    screen_format_id bigint NOT NULL,
    format_code character varying(50) NOT NULL,
    format_name character varying(100) NOT NULL
);


--
-- Name: screen_format_screen_format_id_seq; Type: SEQUENCE; Schema: catalog; Owner: -
--

ALTER TABLE catalog.screen_format ALTER COLUMN screen_format_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME catalog.screen_format_screen_format_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: series; Type: TABLE; Schema: catalog; Owner: -
--

CREATE TABLE catalog.series (
    series_id bigint NOT NULL,
    parent_series_id bigint,
    title character varying(500) NOT NULL,
    sort_title character varying(500),
    description text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: series_series_id_seq; Type: SEQUENCE; Schema: catalog; Owner: -
--

ALTER TABLE catalog.series ALTER COLUMN series_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME catalog.series_series_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: tag; Type: TABLE; Schema: catalog; Owner: -
--

CREATE TABLE catalog.tag (
    tag_id bigint NOT NULL,
    tag_type character varying(50) NOT NULL,
    tag_name character varying(100) NOT NULL
);


--
-- Name: TABLE tag; Type: COMMENT; Schema: catalog; Owner: -
--

COMMENT ON TABLE catalog.tag IS 'Still working on this';


--
-- Name: COLUMN tag.tag_type; Type: COMMENT; Schema: catalog; Owner: -
--

COMMENT ON COLUMN catalog.tag.tag_type IS 'Examples: USER, AI, GENRE, THEME';


--
-- Name: tag_tag_id_seq; Type: SEQUENCE; Schema: catalog; Owner: -
--

ALTER TABLE catalog.tag ALTER COLUMN tag_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME catalog.tag_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: taxonomy_node; Type: TABLE; Schema: catalog; Owner: -
--

CREATE TABLE catalog.taxonomy_node (
    taxonomy_node_id bigint NOT NULL,
    parent_node_id bigint,
    node_name character varying(255) NOT NULL,
    node_type character varying(100),
    description text
);


--
-- Name: taxonomy_node_taxonomy_node_id_seq; Type: SEQUENCE; Schema: catalog; Owner: -
--

ALTER TABLE catalog.taxonomy_node ALTER COLUMN taxonomy_node_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME catalog.taxonomy_node_taxonomy_node_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: work; Type: TABLE; Schema: catalog; Owner: -
--

CREATE TABLE catalog.work (
    work_id bigint NOT NULL,
    series_id bigint,
    title character varying(500) NOT NULL,
    sort_title character varying(500),
    part_number character varying(100),
    description text,
    original_year integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    search_vector tsvector GENERATED ALWAYS AS (to_tsvector('english'::regconfig, (COALESCE(title, ''::character varying))::text)) STORED
);


--
-- Name: work_credit; Type: TABLE; Schema: catalog; Owner: -
--

CREATE TABLE catalog.work_credit (
    work_id bigint NOT NULL,
    contributor_id bigint NOT NULL,
    role_id bigint NOT NULL,
    credit_order integer,
    notes text
);


--
-- Name: work_relationship; Type: TABLE; Schema: catalog; Owner: -
--

CREATE TABLE catalog.work_relationship (
    parent_work_id bigint NOT NULL,
    child_work_id bigint NOT NULL,
    work_relationship_type_id bigint NOT NULL,
    sequence_number integer
);


--
-- Name: work_relationship_type; Type: TABLE; Schema: catalog; Owner: -
--

CREATE TABLE catalog.work_relationship_type (
    work_relationship_type_id bigint NOT NULL,
    relationship_code character varying(50) NOT NULL,
    relationship_name character varying(255) NOT NULL
);


--
-- Name: work_relationship_type_work_relationship_type_id_seq; Type: SEQUENCE; Schema: catalog; Owner: -
--

ALTER TABLE catalog.work_relationship_type ALTER COLUMN work_relationship_type_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME catalog.work_relationship_type_work_relationship_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: work_type; Type: TABLE; Schema: catalog; Owner: -
--

CREATE TABLE catalog.work_type (
    work_type_id bigint NOT NULL,
    work_type_code character varying(50) NOT NULL,
    work_type_name character varying(150) NOT NULL
);


--
-- Name: work_type_work_type_id_seq; Type: SEQUENCE; Schema: catalog; Owner: -
--

ALTER TABLE catalog.work_type ALTER COLUMN work_type_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME catalog.work_type_work_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: work_work_id_seq; Type: SEQUENCE; Schema: catalog; Owner: -
--

ALTER TABLE catalog.work ALTER COLUMN work_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME catalog.work_work_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- PostgreSQL database dump complete
--

\unrestrict UAYDsghj6XvNc8lymjhiA5tKWWu6xIbSgDLnRhV9tJ2Lu1VhkUBM0FGOmaiE4w1

