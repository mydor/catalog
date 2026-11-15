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
-- Name: integration; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA integration;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: barcode_lookup_cache; Type: TABLE; Schema: integration; Owner: -
--

CREATE TABLE integration.barcode_lookup_cache (
    barcode_lookup_cache_id bigint NOT NULL,
    barcode_value character varying(255) NOT NULL,
    metadata_provider_id bigint,
    cached_response jsonb NOT NULL,
    cached_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    expires_at timestamp with time zone
);


--
-- Name: barcode_lookup_cache_barcode_lookup_cache_id_seq; Type: SEQUENCE; Schema: integration; Owner: -
--

ALTER TABLE integration.barcode_lookup_cache ALTER COLUMN barcode_lookup_cache_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME integration.barcode_lookup_cache_barcode_lookup_cache_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: external_metadata_mapping; Type: TABLE; Schema: integration; Owner: -
--

CREATE TABLE integration.external_metadata_mapping (
    external_metadata_mapping_id bigint NOT NULL,
    metadata_provider_id bigint NOT NULL,
    release_id bigint,
    work_id bigint,
    external_identifier character varying(255) NOT NULL,
    metadata_url text,
    last_sync_at timestamp with time zone
);


--
-- Name: external_metadata_mapping_external_metadata_mapping_id_seq; Type: SEQUENCE; Schema: integration; Owner: -
--

ALTER TABLE integration.external_metadata_mapping ALTER COLUMN external_metadata_mapping_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME integration.external_metadata_mapping_external_metadata_mapping_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: import_mapping; Type: TABLE; Schema: integration; Owner: -
--

CREATE TABLE integration.import_mapping (
    import_mapping_id bigint NOT NULL,
    source_system character varying(100),
    source_record_id character varying(255),
    release_id bigint,
    copy_id bigint,
    imported_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: import_mapping_import_mapping_id_seq; Type: SEQUENCE; Schema: integration; Owner: -
--

ALTER TABLE integration.import_mapping ALTER COLUMN import_mapping_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME integration.import_mapping_import_mapping_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: metadata_provider; Type: TABLE; Schema: integration; Owner: -
--

CREATE TABLE integration.metadata_provider (
    metadata_provider_id bigint NOT NULL,
    provider_code character varying(50) NOT NULL,
    provider_name character varying(255) NOT NULL,
    provider_url text,
    is_active boolean DEFAULT true NOT NULL
);


--
-- Name: metadata_provider_metadata_provider_id_seq; Type: SEQUENCE; Schema: integration; Owner: -
--

ALTER TABLE integration.metadata_provider ALTER COLUMN metadata_provider_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME integration.metadata_provider_metadata_provider_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: sync_job; Type: TABLE; Schema: integration; Owner: -
--

CREATE TABLE integration.sync_job (
    sync_job_id bigint NOT NULL,
    metadata_provider_id bigint,
    started_at timestamp with time zone NOT NULL,
    completed_at timestamp with time zone,
    status character varying(30) NOT NULL,
    records_processed integer,
    records_updated integer,
    error_count integer
);


--
-- Name: sync_job_sync_job_id_seq; Type: SEQUENCE; Schema: integration; Owner: -
--

ALTER TABLE integration.sync_job ALTER COLUMN sync_job_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME integration.sync_job_sync_job_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: sync_log; Type: TABLE; Schema: integration; Owner: -
--

CREATE TABLE integration.sync_log (
    sync_log_id bigint NOT NULL,
    sync_job_id bigint NOT NULL,
    log_timestamp timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    severity character varying(20),
    message text NOT NULL
);


--
-- Name: sync_log_sync_log_id_seq; Type: SEQUENCE; Schema: integration; Owner: -
--

ALTER TABLE integration.sync_log ALTER COLUMN sync_log_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME integration.sync_log_sync_log_id_seq
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

