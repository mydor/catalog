--
-- PostgreSQL database dump
--

\restrict eKObELoXk90binJpgMgErNyVbeVFseGa8zofNj7vELzB7QC0GKzfeYnt1te0ZFw

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
-- Name: duplicate_candidate duplicate_candidate_pkey; Type: CONSTRAINT; Schema: staging; Owner: -
--

ALTER TABLE ONLY staging.duplicate_candidate
    ADD CONSTRAINT duplicate_candidate_pkey PRIMARY KEY (duplicate_candidate_id);


--
-- Name: etl_job etl_job_pkey; Type: CONSTRAINT; Schema: staging; Owner: -
--

ALTER TABLE ONLY staging.etl_job
    ADD CONSTRAINT etl_job_pkey PRIMARY KEY (etl_job_id);


--
-- Name: import_batch import_batch_pkey; Type: CONSTRAINT; Schema: staging; Owner: -
--

ALTER TABLE ONLY staging.import_batch
    ADD CONSTRAINT import_batch_pkey PRIMARY KEY (import_batch_id);


--
-- Name: stg_books stg_books_pkey; Type: CONSTRAINT; Schema: staging; Owner: -
--

ALTER TABLE ONLY staging.stg_books
    ADD CONSTRAINT stg_books_pkey PRIMARY KEY (stg_book_id);


--
-- Name: stg_games stg_games_pkey; Type: CONSTRAINT; Schema: staging; Owner: -
--

ALTER TABLE ONLY staging.stg_games
    ADD CONSTRAINT stg_games_pkey PRIMARY KEY (stg_game_id);


--
-- Name: stg_movies stg_movies_pkey; Type: CONSTRAINT; Schema: staging; Owner: -
--

ALTER TABLE ONLY staging.stg_movies
    ADD CONSTRAINT stg_movies_pkey PRIMARY KEY (stg_movie_id);


--
-- Name: stg_music stg_music_pkey; Type: CONSTRAINT; Schema: staging; Owner: -
--

ALTER TABLE ONLY staging.stg_music
    ADD CONSTRAINT stg_music_pkey PRIMARY KEY (stg_music_id);


--
-- Name: validation_error validation_error_pkey; Type: CONSTRAINT; Schema: staging; Owner: -
--

ALTER TABLE ONLY staging.validation_error
    ADD CONSTRAINT validation_error_pkey PRIMARY KEY (validation_error_id);


--
-- Name: ix_duplicate_candidate_release; Type: INDEX; Schema: staging; Owner: -
--

CREATE INDEX ix_duplicate_candidate_release ON staging.duplicate_candidate USING btree (release_id);


--
-- Name: ix_validation_error_batch; Type: INDEX; Schema: staging; Owner: -
--

CREATE INDEX ix_validation_error_batch ON staging.validation_error USING btree (import_batch_id);


--
-- Name: stg_books_raw_record_key; Type: INDEX; Schema: staging; Owner: -
--

CREATE UNIQUE INDEX stg_books_raw_record_key ON staging.stg_books USING btree (md5((raw_record)::text));


--
-- Name: stg_games_raw_record_key; Type: INDEX; Schema: staging; Owner: -
--

CREATE UNIQUE INDEX stg_games_raw_record_key ON staging.stg_games USING btree (md5((raw_record)::text));


--
-- Name: stg_movies_raw_record_key; Type: INDEX; Schema: staging; Owner: -
--

CREATE UNIQUE INDEX stg_movies_raw_record_key ON staging.stg_movies USING btree (md5((raw_record)::text));


--
-- Name: stg_music_raw_record_key; Type: INDEX; Schema: staging; Owner: -
--

CREATE UNIQUE INDEX stg_music_raw_record_key ON staging.stg_music USING btree (md5((raw_record)::text));


--
-- Name: duplicate_candidate duplicate_candidate_release_id_fkey; Type: FK CONSTRAINT; Schema: staging; Owner: -
--

ALTER TABLE ONLY staging.duplicate_candidate
    ADD CONSTRAINT duplicate_candidate_release_id_fkey FOREIGN KEY (release_id) REFERENCES catalog.release(release_id);


--
-- Name: etl_job etl_job_import_batch_id_fkey; Type: FK CONSTRAINT; Schema: staging; Owner: -
--

ALTER TABLE ONLY staging.etl_job
    ADD CONSTRAINT etl_job_import_batch_id_fkey FOREIGN KEY (import_batch_id) REFERENCES staging.import_batch(import_batch_id) ON DELETE CASCADE;


--
-- Name: import_batch import_batch_user_id_fkey; Type: FK CONSTRAINT; Schema: staging; Owner: -
--

ALTER TABLE ONLY staging.import_batch
    ADD CONSTRAINT import_batch_user_id_fkey FOREIGN KEY (user_id) REFERENCES users.app_user(user_id);


--
-- Name: stg_books stg_books_import_batch_id_fkey; Type: FK CONSTRAINT; Schema: staging; Owner: -
--

ALTER TABLE ONLY staging.stg_books
    ADD CONSTRAINT stg_books_import_batch_id_fkey FOREIGN KEY (import_batch_id) REFERENCES staging.import_batch(import_batch_id);


--
-- Name: stg_games stg_games_import_batch_id_fkey; Type: FK CONSTRAINT; Schema: staging; Owner: -
--

ALTER TABLE ONLY staging.stg_games
    ADD CONSTRAINT stg_games_import_batch_id_fkey FOREIGN KEY (import_batch_id) REFERENCES staging.import_batch(import_batch_id);


--
-- Name: stg_movies stg_movies_import_batch_id_fkey; Type: FK CONSTRAINT; Schema: staging; Owner: -
--

ALTER TABLE ONLY staging.stg_movies
    ADD CONSTRAINT stg_movies_import_batch_id_fkey FOREIGN KEY (import_batch_id) REFERENCES staging.import_batch(import_batch_id);


--
-- Name: stg_music stg_music_import_batch_id_fkey; Type: FK CONSTRAINT; Schema: staging; Owner: -
--

ALTER TABLE ONLY staging.stg_music
    ADD CONSTRAINT stg_music_import_batch_id_fkey FOREIGN KEY (import_batch_id) REFERENCES staging.import_batch(import_batch_id);


--
-- Name: validation_error validation_error_import_batch_id_fkey; Type: FK CONSTRAINT; Schema: staging; Owner: -
--

ALTER TABLE ONLY staging.validation_error
    ADD CONSTRAINT validation_error_import_batch_id_fkey FOREIGN KEY (import_batch_id) REFERENCES staging.import_batch(import_batch_id);


--
-- PostgreSQL database dump complete
--

\unrestrict eKObELoXk90binJpgMgErNyVbeVFseGa8zofNj7vELzB7QC0GKzfeYnt1te0ZFw

