--
-- PostgreSQL database dump
--

\restrict go4VlMKt8SkhtfleppIXicjM48JooCQ1PMeozrU2vp8z0ryfBUereh8QnWsemM5

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
-- Name: alias alias_pkey; Type: CONSTRAINT; Schema: authority; Owner: -
--

ALTER TABLE ONLY authority.alias
    ADD CONSTRAINT alias_pkey PRIMARY KEY (alias_id);


--
-- Name: contributor contributor_pkey; Type: CONSTRAINT; Schema: authority; Owner: -
--

ALTER TABLE ONLY authority.contributor
    ADD CONSTRAINT contributor_pkey PRIMARY KEY (contributor_id);


--
-- Name: role contributor_role_pkey; Type: CONSTRAINT; Schema: authority; Owner: -
--

ALTER TABLE ONLY authority.role
    ADD CONSTRAINT contributor_role_pkey PRIMARY KEY (role_id);


--
-- Name: organization organization_pkey; Type: CONSTRAINT; Schema: authority; Owner: -
--

ALTER TABLE ONLY authority.organization
    ADD CONSTRAINT organization_pkey PRIMARY KEY (organization_id);


--
-- Name: person person_pkey; Type: CONSTRAINT; Schema: authority; Owner: -
--

ALTER TABLE ONLY authority.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (person_id);


--
-- Name: role uq_contributor_role_code; Type: CONSTRAINT; Schema: authority; Owner: -
--

ALTER TABLE ONLY authority.role
    ADD CONSTRAINT uq_contributor_role_code UNIQUE (role_code);


--
-- Name: ix_catalog_alias_alias_name; Type: INDEX; Schema: authority; Owner: -
--

CREATE INDEX ix_catalog_alias_alias_name ON authority.alias USING btree (alias_name);


--
-- Name: ix_organization_name; Type: INDEX; Schema: authority; Owner: -
--

CREATE INDEX ix_organization_name ON authority.organization USING btree (organization_name);


--
-- Name: ix_person_normalized_name; Type: INDEX; Schema: authority; Owner: -
--

CREATE INDEX ix_person_normalized_name ON authority.person USING btree (normalized_name);


--
-- Name: uq_person_normalized_name; Type: INDEX; Schema: authority; Owner: -
--

CREATE UNIQUE INDEX uq_person_normalized_name ON authority.person USING btree (normalized_name, name_sequence);


--
-- Name: alias alias_contributor_id_fkey; Type: FK CONSTRAINT; Schema: authority; Owner: -
--

ALTER TABLE ONLY authority.alias
    ADD CONSTRAINT alias_contributor_id_fkey FOREIGN KEY (contributor_id) REFERENCES authority.contributor(contributor_id) ON DELETE CASCADE;


--
-- Name: contributor contributor_organization_id_fkey; Type: FK CONSTRAINT; Schema: authority; Owner: -
--

ALTER TABLE ONLY authority.contributor
    ADD CONSTRAINT contributor_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES authority.organization(organization_id);


--
-- Name: contributor contributor_person_id_fkey; Type: FK CONSTRAINT; Schema: authority; Owner: -
--

ALTER TABLE ONLY authority.contributor
    ADD CONSTRAINT contributor_person_id_fkey FOREIGN KEY (person_id) REFERENCES authority.person(person_id);


--
-- PostgreSQL database dump complete
--

\unrestrict go4VlMKt8SkhtfleppIXicjM48JooCQ1PMeozrU2vp8z0ryfBUereh8QnWsemM5

