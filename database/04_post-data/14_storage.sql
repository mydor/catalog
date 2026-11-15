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
-- Name: copy_location inventory_copy_location_key; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.copy_location
    ADD CONSTRAINT inventory_copy_location_key UNIQUE (copy_id, location_id);


--
-- Name: location_type location_type_pkey; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.location_type
    ADD CONSTRAINT location_type_pkey PRIMARY KEY (location_type_id);


--
-- Name: storage_location storage_location_pkey; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.storage_location
    ADD CONSTRAINT storage_location_pkey PRIMARY KEY (location_id);


--
-- Name: location_type storage_location_type_location_type_code_key; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.location_type
    ADD CONSTRAINT storage_location_type_location_type_code_key UNIQUE (location_type_code);


--
-- Name: storage_location storage_storage_location_location_code_key; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.storage_location
    ADD CONSTRAINT storage_storage_location_location_code_key UNIQUE (location_code);


--
-- Name: copy_location copy_location_copy_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.copy_location
    ADD CONSTRAINT copy_location_copy_id_fkey FOREIGN KEY (copy_id) REFERENCES inventory.inventory_copy(copy_id) ON DELETE CASCADE;


--
-- Name: copy_location copy_location_location_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.copy_location
    ADD CONSTRAINT copy_location_location_id_fkey FOREIGN KEY (location_id) REFERENCES storage.storage_location(location_id) ON DELETE CASCADE;


--
-- Name: storage_location storage_location_location_type_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.storage_location
    ADD CONSTRAINT storage_location_location_type_id_fkey FOREIGN KEY (location_type_id) REFERENCES storage.location_type(location_type_id) ON DELETE CASCADE;


--
-- Name: storage_location storage_location_parent_location_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.storage_location
    ADD CONSTRAINT storage_location_parent_location_id_fkey FOREIGN KEY (parent_location_id) REFERENCES storage.storage_location(location_id) ON DELETE CASCADE;


--
-- Name: storage_location storage_location_user_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.storage_location
    ADD CONSTRAINT storage_location_user_id_fkey FOREIGN KEY (user_id) REFERENCES users.app_user(user_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict DisableCodeExecution

