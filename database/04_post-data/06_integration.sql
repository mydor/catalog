--
-- PostgreSQL database dump
--

\restrict iJgoUymHclq2g6rXQ95r0hUNPpBjMyUvacmJZzuJqQmheFelygFr6Y03G216mRo

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

SET default_tablespace = '';

--
-- Name: barcode_lookup_cache barcode_lookup_cache_pkey; Type: CONSTRAINT; Schema: integration; Owner: -
--

ALTER TABLE ONLY integration.barcode_lookup_cache
    ADD CONSTRAINT barcode_lookup_cache_pkey PRIMARY KEY (barcode_lookup_cache_id);


--
-- Name: external_metadata_mapping external_metadata_mapping_pkey; Type: CONSTRAINT; Schema: integration; Owner: -
--

ALTER TABLE ONLY integration.external_metadata_mapping
    ADD CONSTRAINT external_metadata_mapping_pkey PRIMARY KEY (external_metadata_mapping_id);


--
-- Name: import_mapping import_mapping_pkey; Type: CONSTRAINT; Schema: integration; Owner: -
--

ALTER TABLE ONLY integration.import_mapping
    ADD CONSTRAINT import_mapping_pkey PRIMARY KEY (import_mapping_id);


--
-- Name: external_metadata_mapping integration_external_metadata_mapping_provider_external_key; Type: CONSTRAINT; Schema: integration; Owner: -
--

ALTER TABLE ONLY integration.external_metadata_mapping
    ADD CONSTRAINT integration_external_metadata_mapping_provider_external_key UNIQUE (metadata_provider_id, external_identifier);


--
-- Name: metadata_provider metadata_provider_pkey; Type: CONSTRAINT; Schema: integration; Owner: -
--

ALTER TABLE ONLY integration.metadata_provider
    ADD CONSTRAINT metadata_provider_pkey PRIMARY KEY (metadata_provider_id);


--
-- Name: sync_job sync_job_pkey; Type: CONSTRAINT; Schema: integration; Owner: -
--

ALTER TABLE ONLY integration.sync_job
    ADD CONSTRAINT sync_job_pkey PRIMARY KEY (sync_job_id);


--
-- Name: sync_log sync_log_pkey; Type: CONSTRAINT; Schema: integration; Owner: -
--

ALTER TABLE ONLY integration.sync_log
    ADD CONSTRAINT sync_log_pkey PRIMARY KEY (sync_log_id);


--
-- Name: metadata_provider uq_metadata_provider; Type: CONSTRAINT; Schema: integration; Owner: -
--

ALTER TABLE ONLY integration.metadata_provider
    ADD CONSTRAINT uq_metadata_provider UNIQUE (provider_code);


--
-- Name: ix_external_mapping_release; Type: INDEX; Schema: integration; Owner: -
--

CREATE INDEX ix_external_mapping_release ON integration.external_metadata_mapping USING btree (release_id);


--
-- Name: ix_external_mapping_work; Type: INDEX; Schema: integration; Owner: -
--

CREATE INDEX ix_external_mapping_work ON integration.external_metadata_mapping USING btree (work_id);


--
-- Name: ix_sync_log_job; Type: INDEX; Schema: integration; Owner: -
--

CREATE INDEX ix_sync_log_job ON integration.sync_log USING btree (sync_job_id);


--
-- Name: uq_barcode_lookup; Type: INDEX; Schema: integration; Owner: -
--

CREATE UNIQUE INDEX uq_barcode_lookup ON integration.barcode_lookup_cache USING btree (metadata_provider_id, barcode_value);


--
-- Name: barcode_lookup_cache barcode_lookup_cache_metadata_provider_id_fkey; Type: FK CONSTRAINT; Schema: integration; Owner: -
--

ALTER TABLE ONLY integration.barcode_lookup_cache
    ADD CONSTRAINT barcode_lookup_cache_metadata_provider_id_fkey FOREIGN KEY (metadata_provider_id) REFERENCES integration.metadata_provider(metadata_provider_id);


--
-- Name: external_metadata_mapping external_metadata_mapping_metadata_provider_id_fkey; Type: FK CONSTRAINT; Schema: integration; Owner: -
--

ALTER TABLE ONLY integration.external_metadata_mapping
    ADD CONSTRAINT external_metadata_mapping_metadata_provider_id_fkey FOREIGN KEY (metadata_provider_id) REFERENCES integration.metadata_provider(metadata_provider_id);


--
-- Name: external_metadata_mapping external_metadata_mapping_release_id_fkey; Type: FK CONSTRAINT; Schema: integration; Owner: -
--

ALTER TABLE ONLY integration.external_metadata_mapping
    ADD CONSTRAINT external_metadata_mapping_release_id_fkey FOREIGN KEY (release_id) REFERENCES catalog.release(release_id);


--
-- Name: external_metadata_mapping external_metadata_mapping_work_id_fkey; Type: FK CONSTRAINT; Schema: integration; Owner: -
--

ALTER TABLE ONLY integration.external_metadata_mapping
    ADD CONSTRAINT external_metadata_mapping_work_id_fkey FOREIGN KEY (work_id) REFERENCES catalog.work(work_id);


--
-- Name: import_mapping import_mapping_copy_id_fkey; Type: FK CONSTRAINT; Schema: integration; Owner: -
--

ALTER TABLE ONLY integration.import_mapping
    ADD CONSTRAINT import_mapping_copy_id_fkey FOREIGN KEY (copy_id) REFERENCES inventory.inventory_copy(copy_id);


--
-- Name: import_mapping import_mapping_release_id_fkey; Type: FK CONSTRAINT; Schema: integration; Owner: -
--

ALTER TABLE ONLY integration.import_mapping
    ADD CONSTRAINT import_mapping_release_id_fkey FOREIGN KEY (release_id) REFERENCES catalog.release(release_id);


--
-- Name: sync_job sync_job_metadata_provider_id_fkey; Type: FK CONSTRAINT; Schema: integration; Owner: -
--

ALTER TABLE ONLY integration.sync_job
    ADD CONSTRAINT sync_job_metadata_provider_id_fkey FOREIGN KEY (metadata_provider_id) REFERENCES integration.metadata_provider(metadata_provider_id);


--
-- Name: sync_log sync_log_sync_job_id_fkey; Type: FK CONSTRAINT; Schema: integration; Owner: -
--

ALTER TABLE ONLY integration.sync_log
    ADD CONSTRAINT sync_log_sync_job_id_fkey FOREIGN KEY (sync_job_id) REFERENCES integration.sync_job(sync_job_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict iJgoUymHclq2g6rXQ95r0hUNPpBjMyUvacmJZzuJqQmheFelygFr6Y03G216mRo

