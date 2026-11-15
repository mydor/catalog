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

SET default_tablespace = '';

--
-- Name: media_asset_ocr media_asset_ocr_pkey; Type: CONSTRAINT; Schema: assets; Owner: -
--

ALTER TABLE ONLY assets.media_asset_ocr
    ADD CONSTRAINT media_asset_ocr_pkey PRIMARY KEY (media_asset_ocr_id);


--
-- Name: media_asset media_asset_pkey; Type: CONSTRAINT; Schema: assets; Owner: -
--

ALTER TABLE ONLY assets.media_asset
    ADD CONSTRAINT media_asset_pkey PRIMARY KEY (media_asset_id);


--
-- Name: media_asset_tag media_asset_tag_pkey; Type: CONSTRAINT; Schema: assets; Owner: -
--

ALTER TABLE ONLY assets.media_asset_tag
    ADD CONSTRAINT media_asset_tag_pkey PRIMARY KEY (media_asset_id, collection_tag_id);


--
-- Name: media_asset_type media_asset_type_pkey; Type: CONSTRAINT; Schema: assets; Owner: -
--

ALTER TABLE ONLY assets.media_asset_type
    ADD CONSTRAINT media_asset_type_pkey PRIMARY KEY (media_asset_type_id);


--
-- Name: media_asset_version media_asset_version_pkey; Type: CONSTRAINT; Schema: assets; Owner: -
--

ALTER TABLE ONLY assets.media_asset_version
    ADD CONSTRAINT media_asset_version_pkey PRIMARY KEY (media_asset_version_id);


--
-- Name: media_asset_version uq_asset_version; Type: CONSTRAINT; Schema: assets; Owner: -
--

ALTER TABLE ONLY assets.media_asset_version
    ADD CONSTRAINT uq_asset_version UNIQUE (media_asset_id, version_number);


--
-- Name: media_asset_type uq_media_asset_type; Type: CONSTRAINT; Schema: assets; Owner: -
--

ALTER TABLE ONLY assets.media_asset_type
    ADD CONSTRAINT uq_media_asset_type UNIQUE (type_code);


--
-- Name: ix_asset_copy; Type: INDEX; Schema: assets; Owner: -
--

CREATE INDEX ix_asset_copy ON assets.media_asset USING btree (copy_id);


--
-- Name: ix_asset_release; Type: INDEX; Schema: assets; Owner: -
--

CREATE INDEX ix_asset_release ON assets.media_asset USING btree (release_id);


--
-- Name: media_asset media_asset_copy_id_fkey; Type: FK CONSTRAINT; Schema: assets; Owner: -
--

ALTER TABLE ONLY assets.media_asset
    ADD CONSTRAINT media_asset_copy_id_fkey FOREIGN KEY (copy_id) REFERENCES inventory.inventory_copy(copy_id) ON DELETE CASCADE;


--
-- Name: media_asset media_asset_media_asset_type_id_fkey; Type: FK CONSTRAINT; Schema: assets; Owner: -
--

ALTER TABLE ONLY assets.media_asset
    ADD CONSTRAINT media_asset_media_asset_type_id_fkey FOREIGN KEY (media_asset_type_id) REFERENCES assets.media_asset_type(media_asset_type_id);


--
-- Name: media_asset_ocr media_asset_ocr_media_asset_version_id_fkey; Type: FK CONSTRAINT; Schema: assets; Owner: -
--

ALTER TABLE ONLY assets.media_asset_ocr
    ADD CONSTRAINT media_asset_ocr_media_asset_version_id_fkey FOREIGN KEY (media_asset_version_id) REFERENCES assets.media_asset_version(media_asset_version_id) ON DELETE CASCADE;


--
-- Name: media_asset media_asset_release_id_fkey; Type: FK CONSTRAINT; Schema: assets; Owner: -
--

ALTER TABLE ONLY assets.media_asset
    ADD CONSTRAINT media_asset_release_id_fkey FOREIGN KEY (release_id) REFERENCES catalog.release(release_id) ON DELETE CASCADE;


--
-- Name: media_asset_tag media_asset_tag_collection_tag_id_fkey; Type: FK CONSTRAINT; Schema: assets; Owner: -
--

ALTER TABLE ONLY assets.media_asset_tag
    ADD CONSTRAINT media_asset_tag_collection_tag_id_fkey FOREIGN KEY (collection_tag_id) REFERENCES catalog.tag(tag_id);


--
-- Name: media_asset_tag media_asset_tag_media_asset_id_fkey; Type: FK CONSTRAINT; Schema: assets; Owner: -
--

ALTER TABLE ONLY assets.media_asset_tag
    ADD CONSTRAINT media_asset_tag_media_asset_id_fkey FOREIGN KEY (media_asset_id) REFERENCES assets.media_asset(media_asset_id) ON DELETE CASCADE;


--
-- Name: media_asset media_asset_user_id_fkey; Type: FK CONSTRAINT; Schema: assets; Owner: -
--

ALTER TABLE ONLY assets.media_asset
    ADD CONSTRAINT media_asset_user_id_fkey FOREIGN KEY (user_id) REFERENCES users.app_user(user_id) ON DELETE CASCADE;


--
-- Name: media_asset_version media_asset_version_media_asset_id_fkey; Type: FK CONSTRAINT; Schema: assets; Owner: -
--

ALTER TABLE ONLY assets.media_asset_version
    ADD CONSTRAINT media_asset_version_media_asset_id_fkey FOREIGN KEY (media_asset_id) REFERENCES assets.media_asset(media_asset_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict DisableCodeExecution

