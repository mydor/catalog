--
-- PostgreSQL database dump
--

\restrict XtSA2cYVS3xpg4P5vpMJsNblnlDzGW8adZ6WlfKi2hEIEzQetNDAqsTRUQ4rLgu

-- Dumped from database version 18.4
-- Dumped by pg_dump version 18.6 (Ubuntu 18.6-0ubuntu0.26.04.1)

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
-- Name: storage; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA storage;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: copy_location; Type: TABLE; Schema: storage; Owner: -
--

CREATE TABLE storage.copy_location (
    copy_id bigint NOT NULL,
    location_id bigint NOT NULL
);


--
-- Name: location_type; Type: TABLE; Schema: storage; Owner: -
--

CREATE TABLE storage.location_type (
    location_type_id bigint NOT NULL,
    location_type_code character varying(50),
    location_type_name character varying(150)
);


--
-- Name: location_type_location_type_id_seq; Type: SEQUENCE; Schema: storage; Owner: -
--

ALTER TABLE storage.location_type ALTER COLUMN location_type_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME storage.location_type_location_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: storage_location; Type: TABLE; Schema: storage; Owner: -
--

CREATE TABLE storage.storage_location (
    location_id bigint NOT NULL,
    user_id bigint NOT NULL,
    parent_location_id bigint,
    location_type_id bigint NOT NULL,
    location_code character varying(50) NOT NULL,
    location_name character varying(150) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: storage_location_location_id_seq; Type: SEQUENCE; Schema: storage; Owner: -
--

ALTER TABLE storage.storage_location ALTER COLUMN location_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME storage.storage_location_location_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- PostgreSQL database dump complete
--

\unrestrict XtSA2cYVS3xpg4P5vpMJsNblnlDzGW8adZ6WlfKi2hEIEzQetNDAqsTRUQ4rLgu

