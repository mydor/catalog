--
-- PostgreSQL database dump
--

\restrict QH4f1vtowCkEJt4Fxrlk0xNujXQHHOuMJHYMSlbRLzSgF07SheTUAHcE3lgAdDo

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
-- Name: audit; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA audit;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: audit_log; Type: TABLE; Schema: audit; Owner: -
--

CREATE TABLE audit.audit_log (
    audit_log_id bigint NOT NULL,
    schema_name character varying(100),
    table_name character varying(100),
    record_id bigint,
    operation character varying(20),
    changed_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    changed_by bigint,
    old_data jsonb,
    new_data jsonb
);


--
-- Name: audit_log_audit_log_id_seq; Type: SEQUENCE; Schema: audit; Owner: -
--

ALTER TABLE audit.audit_log ALTER COLUMN audit_log_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME audit.audit_log_audit_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: domain_event; Type: TABLE; Schema: audit; Owner: -
--

CREATE TABLE audit.domain_event (
    domain_event_id bigint NOT NULL,
    aggregate_type character varying(100) NOT NULL,
    aggregate_id bigint NOT NULL,
    event_type character varying(100) NOT NULL,
    event_timestamp timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    event_payload jsonb
);


--
-- Name: domain_event_domain_event_id_seq; Type: SEQUENCE; Schema: audit; Owner: -
--

ALTER TABLE audit.domain_event ALTER COLUMN domain_event_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME audit.domain_event_domain_event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: user_activity; Type: TABLE; Schema: audit; Owner: -
--

CREATE TABLE audit.user_activity (
    user_activity_id bigint NOT NULL,
    user_id bigint NOT NULL,
    activity_type character varying(100),
    activity_timestamp timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    activity_data jsonb
);


--
-- Name: user_activity_user_activity_id_seq; Type: SEQUENCE; Schema: audit; Owner: -
--

ALTER TABLE audit.user_activity ALTER COLUMN user_activity_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME audit.user_activity_user_activity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- PostgreSQL database dump complete
--

\unrestrict QH4f1vtowCkEJt4Fxrlk0xNujXQHHOuMJHYMSlbRLzSgF07SheTUAHcE3lgAdDo

