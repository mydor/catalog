--
-- PostgreSQL database dump
--

\restrict MDIkDPZzuy2ezJv5SnlFUF9u2gJktBuSpQuZYfl1mZQwsTeapVVDUJanKO5Fh49

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
-- Name: assets; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA assets;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: media_asset; Type: TABLE; Schema: assets; Owner: -
--

CREATE TABLE assets.media_asset (
    media_asset_id bigint NOT NULL,
    user_id bigint NOT NULL,
    copy_id bigint,
    release_id bigint,
    media_asset_type_id bigint,
    asset_name character varying(255),
    description text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: media_asset_media_asset_id_seq; Type: SEQUENCE; Schema: assets; Owner: -
--

ALTER TABLE assets.media_asset ALTER COLUMN media_asset_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME assets.media_asset_media_asset_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: media_asset_ocr; Type: TABLE; Schema: assets; Owner: -
--

CREATE TABLE assets.media_asset_ocr (
    media_asset_ocr_id bigint NOT NULL,
    media_asset_version_id bigint NOT NULL,
    extraction_engine character varying(255),
    extraction_date timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    extracted_text text
);


--
-- Name: media_asset_ocr_media_asset_ocr_id_seq; Type: SEQUENCE; Schema: assets; Owner: -
--

ALTER TABLE assets.media_asset_ocr ALTER COLUMN media_asset_ocr_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME assets.media_asset_ocr_media_asset_ocr_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: media_asset_tag; Type: TABLE; Schema: assets; Owner: -
--

CREATE TABLE assets.media_asset_tag (
    media_asset_id bigint NOT NULL,
    collection_tag_id bigint NOT NULL
);


--
-- Name: media_asset_type; Type: TABLE; Schema: assets; Owner: -
--

CREATE TABLE assets.media_asset_type (
    media_asset_type_id bigint NOT NULL,
    type_code character varying(50) NOT NULL,
    type_name character varying(255) NOT NULL,
    description text
);


--
-- Name: media_asset_type_media_asset_type_id_seq; Type: SEQUENCE; Schema: assets; Owner: -
--

ALTER TABLE assets.media_asset_type ALTER COLUMN media_asset_type_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME assets.media_asset_type_media_asset_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: media_asset_version; Type: TABLE; Schema: assets; Owner: -
--

CREATE TABLE assets.media_asset_version (
    media_asset_version_id bigint NOT NULL,
    media_asset_id bigint NOT NULL,
    version_number integer NOT NULL,
    file_name character varying(500),
    mime_type character varying(255),
    file_size_bytes bigint,
    storage_uri text NOT NULL,
    checksum_sha256 character varying(64),
    uploaded_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: media_asset_version_media_asset_version_id_seq; Type: SEQUENCE; Schema: assets; Owner: -
--

ALTER TABLE assets.media_asset_version ALTER COLUMN media_asset_version_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME assets.media_asset_version_media_asset_version_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- PostgreSQL database dump complete
--

\unrestrict MDIkDPZzuy2ezJv5SnlFUF9u2gJktBuSpQuZYfl1mZQwsTeapVVDUJanKO5Fh49

