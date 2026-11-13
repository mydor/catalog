--
-- PostgreSQL database dump
--

\restrict esvEyvVTlZ3KnT3J7fDkKibFSavVNv60lkafOEV4Q5tvMPjxDt5njUKzJUQSi53

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
-- Name: users; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA users;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: app_user; Type: TABLE; Schema: users; Owner: -
--

CREATE TABLE users.app_user (
    user_id bigint NOT NULL,
    user_uuid uuid DEFAULT uuidv7() NOT NULL,
    username public.citext NOT NULL,
    email public.citext NOT NULL,
    display_name character varying(255),
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: app_user_user_id_seq; Type: SEQUENCE; Schema: users; Owner: -
--

ALTER TABLE users.app_user ALTER COLUMN user_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME users.app_user_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: user_preference; Type: TABLE; Schema: users; Owner: -
--

CREATE TABLE users.user_preference (
    user_preference_id bigint NOT NULL,
    user_id bigint NOT NULL,
    preference_key character varying(100) NOT NULL,
    preference_value text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: user_preference_user_preference_id_seq; Type: SEQUENCE; Schema: users; Owner: -
--

ALTER TABLE users.user_preference ALTER COLUMN user_preference_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME users.user_preference_user_preference_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: user_profile; Type: TABLE; Schema: users; Owner: -
--

CREATE TABLE users.user_profile (
    user_id bigint NOT NULL,
    first_name character varying(100),
    last_name character varying(100),
    timezone_name character varying(100),
    locale_code character varying(20),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: user_role; Type: TABLE; Schema: users; Owner: -
--

CREATE TABLE users.user_role (
    user_role_id bigint NOT NULL,
    role_code character varying(50) NOT NULL,
    role_name character varying(255) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: user_role_assignment; Type: TABLE; Schema: users; Owner: -
--

CREATE TABLE users.user_role_assignment (
    user_id bigint NOT NULL,
    user_role_id bigint NOT NULL,
    assigned_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: user_role_user_role_id_seq; Type: SEQUENCE; Schema: users; Owner: -
--

ALTER TABLE users.user_role ALTER COLUMN user_role_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME users.user_role_user_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: user_session; Type: TABLE; Schema: users; Owner: -
--

CREATE TABLE users.user_session (
    session_id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    expires_at timestamp with time zone NOT NULL,
    ip_address inet,
    user_agent text
);


--
-- PostgreSQL database dump complete
--

\unrestrict esvEyvVTlZ3KnT3J7fDkKibFSavVNv60lkafOEV4Q5tvMPjxDt5njUKzJUQSi53

