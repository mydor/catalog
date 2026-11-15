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
-- Name: circulation; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA circulation;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: borrower; Type: TABLE; Schema: circulation; Owner: -
--

CREATE TABLE circulation.borrower (
    borrower_id bigint NOT NULL,
    user_id bigint NOT NULL,
    borrower_name character varying(255) NOT NULL,
    email_address character varying(255),
    phone_number character varying(50),
    notes text,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: borrower_borrower_id_seq; Type: SEQUENCE; Schema: circulation; Owner: -
--

ALTER TABLE circulation.borrower ALTER COLUMN borrower_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME circulation.borrower_borrower_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: loan; Type: TABLE; Schema: circulation; Owner: -
--

CREATE TABLE circulation.loan (
    loan_id bigint NOT NULL,
    copy_id bigint NOT NULL,
    borrower_id bigint NOT NULL,
    loan_date date NOT NULL,
    due_date date,
    returned_date date,
    loan_notes text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: loan_event; Type: TABLE; Schema: circulation; Owner: -
--

CREATE TABLE circulation.loan_event (
    loan_event_id bigint NOT NULL,
    loan_id bigint NOT NULL,
    event_type character varying(50) NOT NULL,
    event_timestamp timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    event_details text
);


--
-- Name: loan_event_loan_event_id_seq; Type: SEQUENCE; Schema: circulation; Owner: -
--

ALTER TABLE circulation.loan_event ALTER COLUMN loan_event_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME circulation.loan_event_loan_event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: loan_loan_id_seq; Type: SEQUENCE; Schema: circulation; Owner: -
--

ALTER TABLE circulation.loan ALTER COLUMN loan_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME circulation.loan_loan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: reservation; Type: TABLE; Schema: circulation; Owner: -
--

CREATE TABLE circulation.reservation (
    reservation_id bigint NOT NULL,
    copy_id bigint NOT NULL,
    borrower_id bigint NOT NULL,
    reservation_date timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    expiration_date timestamp with time zone,
    fulfilled_date timestamp with time zone,
    status character varying(30) DEFAULT 'ACTIVE'::character varying NOT NULL
);


--
-- Name: reservation_reservation_id_seq; Type: SEQUENCE; Schema: circulation; Owner: -
--

ALTER TABLE circulation.reservation ALTER COLUMN reservation_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME circulation.reservation_reservation_id_seq
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

