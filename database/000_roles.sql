--
-- PostgreSQL database cluster dump
--

\restrict aGhA5JdukgPJyLFZtOpqirx7jzNLUlxhotnzFqIaudTEtAYhPqkfsMHeaD2aEiA

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




\unrestrict aGhA5JdukgPJyLFZtOpqirx7jzNLUlxhotnzFqIaudTEtAYhPqkfsMHeaD2aEiA

--
-- PostgreSQL database cluster dump complete
--

