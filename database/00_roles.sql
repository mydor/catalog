--
-- PostgreSQL database cluster dump
--

\restrict V3Qwvpkkq1SLMlE39GOJmTBgk1rcMpoHNCFTlWoS8EqL7KGkdPX6Idfoj0FE9N1

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE monitor_system_stats;
ALTER ROLE monitor_system_stats WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB NOLOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE msmith;
ALTER ROLE msmith WITH NOSUPERUSER INHERIT NOCREATEROLE CREATEDB LOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;

--
-- User Configurations
--


--
-- Role memberships
--

GRANT pg_read_all_data TO msmith WITH INHERIT TRUE GRANTED BY postgres;
GRANT pg_write_all_data TO msmith WITH INHERIT TRUE GRANTED BY postgres;




\unrestrict V3Qwvpkkq1SLMlE39GOJmTBgk1rcMpoHNCFTlWoS8EqL7KGkdPX6Idfoj0FE9N1

--
-- PostgreSQL database cluster dump complete
--

