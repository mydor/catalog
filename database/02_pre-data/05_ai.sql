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
-- Name: ai; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA ai;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: ai_enrichment; Type: TABLE; Schema: ai; Owner: -
--

CREATE TABLE ai.ai_enrichment (
    ai_enrichment_id bigint NOT NULL,
    release_id bigint NOT NULL,
    enrichment_type character varying(50) NOT NULL,
    enrichment_text text NOT NULL,
    model_name character varying(255),
    confidence_score numeric(5,4),
    generated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: ai_enrichment_ai_enrichment_id_seq; Type: SEQUENCE; Schema: ai; Owner: -
--

ALTER TABLE ai.ai_enrichment ALTER COLUMN ai_enrichment_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME ai.ai_enrichment_ai_enrichment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: recommendation_cache; Type: TABLE; Schema: ai; Owner: -
--

CREATE TABLE ai.recommendation_cache (
    recommendation_cache_id bigint NOT NULL,
    recommendation_model_id bigint NOT NULL,
    source_release_id bigint NOT NULL,
    recommended_release_id bigint NOT NULL,
    recommendation_score numeric(10,6),
    generated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: recommendation_cache_recommendation_cache_id_seq; Type: SEQUENCE; Schema: ai; Owner: -
--

ALTER TABLE ai.recommendation_cache ALTER COLUMN recommendation_cache_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME ai.recommendation_cache_recommendation_cache_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: recommendation_model; Type: TABLE; Schema: ai; Owner: -
--

CREATE TABLE ai.recommendation_model (
    recommendation_model_id bigint NOT NULL,
    model_code character varying(100) NOT NULL,
    model_name character varying(255) NOT NULL,
    model_version character varying(100),
    description text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: recommendation_model_recommendation_model_id_seq; Type: SEQUENCE; Schema: ai; Owner: -
--

ALTER TABLE ai.recommendation_model ALTER COLUMN recommendation_model_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME ai.recommendation_model_recommendation_model_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: release_embedding; Type: TABLE; Schema: ai; Owner: -
--

CREATE TABLE ai.release_embedding (
    release_embedding_id bigint NOT NULL,
    release_id bigint NOT NULL,
    model_name character varying(255) NOT NULL,
    embedding public.vector(1536),
    generated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: release_embedding_release_embedding_id_seq; Type: SEQUENCE; Schema: ai; Owner: -
--

ALTER TABLE ai.release_embedding ALTER COLUMN release_embedding_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME ai.release_embedding_release_embedding_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: release_semantic_tag; Type: TABLE; Schema: ai; Owner: -
--

CREATE TABLE ai.release_semantic_tag (
    release_id bigint NOT NULL,
    semantic_tag_id bigint NOT NULL,
    confidence_score numeric(5,4)
);


--
-- Name: user_interaction_event; Type: TABLE; Schema: ai; Owner: -
--

CREATE TABLE ai.user_interaction_event (
    user_interaction_event_id bigint NOT NULL,
    user_id bigint NOT NULL,
    release_id bigint,
    copy_id bigint,
    event_type character varying(50) NOT NULL,
    event_timestamp timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    event_data jsonb
);


--
-- Name: user_interaction_event_user_interaction_event_id_seq; Type: SEQUENCE; Schema: ai; Owner: -
--

ALTER TABLE ai.user_interaction_event ALTER COLUMN user_interaction_event_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME ai.user_interaction_event_user_interaction_event_id_seq
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

