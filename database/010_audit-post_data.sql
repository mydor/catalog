--
-- PostgreSQL database dump
--

\restrict gqRsdln9vGeskQOSbcpigipKqgLn3rxFH0f8w4BcfsgnFeSeArRCiozlm0chO7s

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

SET default_tablespace = '';

--
-- Name: audit_log audit_log_pkey; Type: CONSTRAINT; Schema: audit; Owner: -
--

ALTER TABLE ONLY audit.audit_log
    ADD CONSTRAINT audit_log_pkey PRIMARY KEY (audit_log_id);


--
-- Name: domain_event domain_event_pkey; Type: CONSTRAINT; Schema: audit; Owner: -
--

ALTER TABLE ONLY audit.domain_event
    ADD CONSTRAINT domain_event_pkey PRIMARY KEY (domain_event_id);


--
-- Name: user_activity user_activity_pkey; Type: CONSTRAINT; Schema: audit; Owner: -
--

ALTER TABLE ONLY audit.user_activity
    ADD CONSTRAINT user_activity_pkey PRIMARY KEY (user_activity_id);


--
-- Name: ix_audit_log_table; Type: INDEX; Schema: audit; Owner: -
--

CREATE INDEX ix_audit_log_table ON audit.audit_log USING btree (schema_name, table_name);


--
-- Name: ix_domain_event_aggregate; Type: INDEX; Schema: audit; Owner: -
--

CREATE INDEX ix_domain_event_aggregate ON audit.domain_event USING btree (aggregate_type, aggregate_id);


--
-- Name: ix_user_activity_user; Type: INDEX; Schema: audit; Owner: -
--

CREATE INDEX ix_user_activity_user ON audit.user_activity USING btree (user_id);


--
-- Name: audit_log audit_log_changed_by_fkey; Type: FK CONSTRAINT; Schema: audit; Owner: -
--

ALTER TABLE ONLY audit.audit_log
    ADD CONSTRAINT audit_log_changed_by_fkey FOREIGN KEY (changed_by) REFERENCES users.app_user(user_id);


--
-- Name: user_activity user_activity_user_id_fkey; Type: FK CONSTRAINT; Schema: audit; Owner: -
--

ALTER TABLE ONLY audit.user_activity
    ADD CONSTRAINT user_activity_user_id_fkey FOREIGN KEY (user_id) REFERENCES users.app_user(user_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict gqRsdln9vGeskQOSbcpigipKqgLn3rxFH0f8w4BcfsgnFeSeArRCiozlm0chO7s

