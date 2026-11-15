--
-- PostgreSQL database dump
--

\restrict U54mDXisGyzCsrRDmQXEKRYDMI1K8xTcbAtO5hTQmoAZvG8IWun5OVwdGddgRGs

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
-- Name: inventory; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA inventory;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: copy_tag; Type: TABLE; Schema: inventory; Owner: -
--

CREATE TABLE inventory.copy_tag (
    copy_id bigint NOT NULL,
    collection_tag_id bigint NOT NULL
);


--
-- Name: insurance_policy; Type: TABLE; Schema: inventory; Owner: -
--

CREATE TABLE inventory.insurance_policy (
    insurance_policy_id bigint NOT NULL,
    user_id bigint NOT NULL,
    policy_name character varying(255) NOT NULL,
    carrier_name character varying(255),
    policy_number character varying(100),
    effective_date date,
    expiration_date date,
    coverage_limit numeric(14,2),
    notes text
);


--
-- Name: insurance_policy_insurance_policy_id_seq; Type: SEQUENCE; Schema: inventory; Owner: -
--

ALTER TABLE inventory.insurance_policy ALTER COLUMN insurance_policy_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME inventory.insurance_policy_insurance_policy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: insured_item; Type: TABLE; Schema: inventory; Owner: -
--

CREATE TABLE inventory.insured_item (
    insured_item_id bigint NOT NULL,
    insurance_policy_id bigint NOT NULL,
    copy_id bigint NOT NULL,
    insured_value numeric(12,2),
    notes text
);


--
-- Name: insured_item_insured_item_id_seq; Type: SEQUENCE; Schema: inventory; Owner: -
--

ALTER TABLE inventory.insured_item ALTER COLUMN insured_item_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME inventory.insured_item_insured_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: inventory_copy; Type: TABLE; Schema: inventory; Owner: -
--

CREATE TABLE inventory.inventory_copy (
    copy_id bigint NOT NULL,
    user_id bigint NOT NULL,
    release_id bigint NOT NULL,
    item_condition_id bigint,
    acquisition_date date,
    acquisition_price numeric(12,2),
    acquisition_source character varying(255),
    ownership_notes text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: inventory_copy_copy_id_seq; Type: SEQUENCE; Schema: inventory; Owner: -
--

ALTER TABLE inventory.inventory_copy ALTER COLUMN copy_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME inventory.inventory_copy_copy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: inventory_valuation; Type: TABLE; Schema: inventory; Owner: -
--

CREATE TABLE inventory.inventory_valuation (
    inventory_valuation_id bigint NOT NULL,
    copy_id bigint NOT NULL,
    valuation_source_id bigint,
    valuation_type character varying(50) NOT NULL,
    valuation_amount numeric(12,2) NOT NULL,
    valuation_date date NOT NULL,
    notes text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: inventory_valuation_inventory_valuation_id_seq; Type: SEQUENCE; Schema: inventory; Owner: -
--

ALTER TABLE inventory.inventory_valuation ALTER COLUMN inventory_valuation_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME inventory.inventory_valuation_inventory_valuation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: item_condition; Type: TABLE; Schema: inventory; Owner: -
--

CREATE TABLE inventory.item_condition (
    item_condition_id bigint NOT NULL,
    condition_code character varying(50) NOT NULL,
    condition_name character varying(100) NOT NULL,
    description text,
    sort_order integer
);


--
-- Name: item_condition_item_condition_id_seq; Type: SEQUENCE; Schema: inventory; Owner: -
--

ALTER TABLE inventory.item_condition ALTER COLUMN item_condition_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME inventory.item_condition_item_condition_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: market_value_history; Type: TABLE; Schema: inventory; Owner: -
--

CREATE TABLE inventory.market_value_history (
    market_value_history_id bigint NOT NULL,
    copy_id bigint NOT NULL,
    valuation_source_id bigint,
    valuation_amount numeric(12,2) NOT NULL,
    valuation_date date NOT NULL,
    notes text
);


--
-- Name: market_value_history_market_value_history_id_seq; Type: SEQUENCE; Schema: inventory; Owner: -
--

ALTER TABLE inventory.market_value_history ALTER COLUMN market_value_history_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME inventory.market_value_history_market_value_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: valuation_source; Type: TABLE; Schema: inventory; Owner: -
--

CREATE TABLE inventory.valuation_source (
    valuation_source_id bigint NOT NULL,
    source_code character varying(50) NOT NULL,
    source_name character varying(255) NOT NULL,
    source_url text
);


--
-- Name: valuation_source_valuation_source_id_seq; Type: SEQUENCE; Schema: inventory; Owner: -
--

ALTER TABLE inventory.valuation_source ALTER COLUMN valuation_source_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME inventory.valuation_source_valuation_source_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: wishlist_item; Type: TABLE; Schema: inventory; Owner: -
--

CREATE TABLE inventory.wishlist_item (
    wishlist_item_id bigint NOT NULL,
    user_id bigint NOT NULL,
    release_id bigint,
    priority integer,
    desired_price numeric(12,2),
    notes text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: wishlist_item_wishlist_item_id_seq; Type: SEQUENCE; Schema: inventory; Owner: -
--

ALTER TABLE inventory.wishlist_item ALTER COLUMN wishlist_item_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME inventory.wishlist_item_wishlist_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- PostgreSQL database dump complete
--

\unrestrict U54mDXisGyzCsrRDmQXEKRYDMI1K8xTcbAtO5hTQmoAZvG8IWun5OVwdGddgRGs

