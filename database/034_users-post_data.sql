--
-- PostgreSQL database dump
--

\restrict lcUHW1jDZIgm5ws6A3WzRUkKO9SRgODs5JvaICJDbXYBwCO52fsHxVCdTfhHcWZ

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
-- Name: app_user app_user_pkey; Type: CONSTRAINT; Schema: users; Owner: -
--

ALTER TABLE ONLY users.app_user
    ADD CONSTRAINT app_user_pkey PRIMARY KEY (user_id);


--
-- Name: app_user uq_app_user_email; Type: CONSTRAINT; Schema: users; Owner: -
--

ALTER TABLE ONLY users.app_user
    ADD CONSTRAINT uq_app_user_email UNIQUE (email);


--
-- Name: app_user uq_app_user_username; Type: CONSTRAINT; Schema: users; Owner: -
--

ALTER TABLE ONLY users.app_user
    ADD CONSTRAINT uq_app_user_username UNIQUE (username);


--
-- Name: user_preference uq_user_preference; Type: CONSTRAINT; Schema: users; Owner: -
--

ALTER TABLE ONLY users.user_preference
    ADD CONSTRAINT uq_user_preference UNIQUE (user_id, preference_key);


--
-- Name: user_role uq_user_role_code; Type: CONSTRAINT; Schema: users; Owner: -
--

ALTER TABLE ONLY users.user_role
    ADD CONSTRAINT uq_user_role_code UNIQUE (role_code);


--
-- Name: user_preference user_preference_pkey; Type: CONSTRAINT; Schema: users; Owner: -
--

ALTER TABLE ONLY users.user_preference
    ADD CONSTRAINT user_preference_pkey PRIMARY KEY (user_preference_id);


--
-- Name: user_profile user_profile_pkey; Type: CONSTRAINT; Schema: users; Owner: -
--

ALTER TABLE ONLY users.user_profile
    ADD CONSTRAINT user_profile_pkey PRIMARY KEY (user_id);


--
-- Name: user_role_assignment user_role_assignment_pkey; Type: CONSTRAINT; Schema: users; Owner: -
--

ALTER TABLE ONLY users.user_role_assignment
    ADD CONSTRAINT user_role_assignment_pkey PRIMARY KEY (user_id, user_role_id);


--
-- Name: user_role user_role_pkey; Type: CONSTRAINT; Schema: users; Owner: -
--

ALTER TABLE ONLY users.user_role
    ADD CONSTRAINT user_role_pkey PRIMARY KEY (user_role_id);


--
-- Name: user_session user_session_pkey; Type: CONSTRAINT; Schema: users; Owner: -
--

ALTER TABLE ONLY users.user_session
    ADD CONSTRAINT user_session_pkey PRIMARY KEY (session_id);


--
-- Name: ix_app_user_display_name; Type: INDEX; Schema: users; Owner: -
--

CREATE INDEX ix_app_user_display_name ON users.app_user USING btree (display_name);


--
-- Name: ix_app_user_user_uuid; Type: INDEX; Schema: users; Owner: -
--

CREATE INDEX ix_app_user_user_uuid ON users.app_user USING btree (user_uuid);


--
-- Name: ix_user_session_expiration; Type: INDEX; Schema: users; Owner: -
--

CREATE INDEX ix_user_session_expiration ON users.user_session USING btree (expires_at);


--
-- Name: ix_user_session_user; Type: INDEX; Schema: users; Owner: -
--

CREATE INDEX ix_user_session_user ON users.user_session USING btree (user_id);


--
-- Name: user_preference user_preference_user_id_fkey; Type: FK CONSTRAINT; Schema: users; Owner: -
--

ALTER TABLE ONLY users.user_preference
    ADD CONSTRAINT user_preference_user_id_fkey FOREIGN KEY (user_id) REFERENCES users.app_user(user_id) ON DELETE CASCADE;


--
-- Name: user_profile user_profile_user_id_fkey; Type: FK CONSTRAINT; Schema: users; Owner: -
--

ALTER TABLE ONLY users.user_profile
    ADD CONSTRAINT user_profile_user_id_fkey FOREIGN KEY (user_id) REFERENCES users.app_user(user_id) ON DELETE CASCADE;


--
-- Name: user_role_assignment user_role_assignment_user_id_fkey; Type: FK CONSTRAINT; Schema: users; Owner: -
--

ALTER TABLE ONLY users.user_role_assignment
    ADD CONSTRAINT user_role_assignment_user_id_fkey FOREIGN KEY (user_id) REFERENCES users.app_user(user_id) ON DELETE CASCADE;


--
-- Name: user_role_assignment user_role_assignment_user_role_id_fkey; Type: FK CONSTRAINT; Schema: users; Owner: -
--

ALTER TABLE ONLY users.user_role_assignment
    ADD CONSTRAINT user_role_assignment_user_role_id_fkey FOREIGN KEY (user_role_id) REFERENCES users.user_role(user_role_id) ON DELETE CASCADE;


--
-- Name: user_session user_session_user_id_fkey; Type: FK CONSTRAINT; Schema: users; Owner: -
--

ALTER TABLE ONLY users.user_session
    ADD CONSTRAINT user_session_user_id_fkey FOREIGN KEY (user_id) REFERENCES users.app_user(user_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict lcUHW1jDZIgm5ws6A3WzRUkKO9SRgODs5JvaICJDbXYBwCO52fsHxVCdTfhHcWZ

