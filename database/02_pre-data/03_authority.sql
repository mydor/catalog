--
-- PostgreSQL database dump
--

\restrict tn2V6bCDkYodbPjf3cBRH06CwN4tTIFabx4V0sfE1OvYMhCVclAGURkikTxbrXi

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
-- Name: authority; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA authority;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: alias; Type: TABLE; Schema: authority; Owner: -
--

CREATE TABLE authority.alias (
    alias_id bigint NOT NULL,
    contributor_id bigint NOT NULL,
    alias_name character varying(500) NOT NULL,
    is_preferred boolean DEFAULT false NOT NULL
);


--
-- Name: alias_alias_id_seq; Type: SEQUENCE; Schema: authority; Owner: -
--

ALTER TABLE authority.alias ALTER COLUMN alias_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME authority.alias_alias_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: contributor; Type: TABLE; Schema: authority; Owner: -
--

CREATE TABLE authority.contributor (
    contributor_id bigint NOT NULL,
    person_id bigint,
    organization_id bigint,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT contributor_type_check CHECK ((num_nonnulls(person_id, organization_id) = 1))
);


--
-- Name: contributor_contributor_id_seq; Type: SEQUENCE; Schema: authority; Owner: -
--

ALTER TABLE authority.contributor ALTER COLUMN contributor_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME authority.contributor_contributor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: organization; Type: TABLE; Schema: authority; Owner: -
--

CREATE TABLE authority.organization (
    organization_id bigint NOT NULL,
    organization_name character varying(500) NOT NULL,
    normalized_name character varying(500),
    formed_date date,
    dissolved_date date,
    website_url text,
    notes text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: organization_organization_id_seq; Type: SEQUENCE; Schema: authority; Owner: -
--

ALTER TABLE authority.organization ALTER COLUMN organization_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME authority.organization_organization_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: person; Type: TABLE; Schema: authority; Owner: -
--

CREATE TABLE authority.person (
    person_id bigint NOT NULL,
    primary_name character varying(255) NOT NULL,
    normalized_name character varying(255) NOT NULL,
    name_sequence integer DEFAULT 0 NOT NULL,
    birth_date date,
    death_date date,
    biography text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT ck_person_name_sequence CHECK ((name_sequence >= 0))
);


--
-- Name: person_person_id_seq; Type: SEQUENCE; Schema: authority; Owner: -
--

ALTER TABLE authority.person ALTER COLUMN person_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME authority.person_person_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: person_v; Type: VIEW; Schema: authority; Owner: -
--

CREATE VIEW authority.person_v AS
 SELECT person_id,
    primary_name,
    name_sequence,
    birth_date,
    death_date,
    biography,
    created_at,
    updated_at,
        CASE
            WHEN (name_sequence = 0) THEN (primary_name)::text
            ELSE concat_ws(' '::text, primary_name, '(', upper(to_char(name_sequence, 'RN'::text)), ')')
        END AS display_name
   FROM authority.person p;


--
-- Name: role; Type: TABLE; Schema: authority; Owner: -
--

CREATE TABLE authority.role (
    role_id bigint NOT NULL,
    role_code character varying(100) NOT NULL,
    role_name character varying(255) NOT NULL,
    description text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP CONSTRAINT contributor_role_created_at_not_null NOT NULL
);


--
-- Name: role_role_id_seq; Type: SEQUENCE; Schema: authority; Owner: -
--

ALTER TABLE authority.role ALTER COLUMN role_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME authority.role_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- PostgreSQL database dump complete
--

\unrestrict tn2V6bCDkYodbPjf3cBRH06CwN4tTIFabx4V0sfE1OvYMhCVclAGURkikTxbrXi

