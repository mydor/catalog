--
-- PostgreSQL database dump
--

\restrict hRcKy83scNPhVsFQglBKKvyWLyVeRaceAI0DX87iZdBYG4lBlJKxeI66jCApiik

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
-- Name: age_rating age_rating_pkey; Type: CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.age_rating
    ADD CONSTRAINT age_rating_pkey PRIMARY KEY (age_rating_id);


--
-- Name: book_release book_release_pkey; Type: CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.book_release
    ADD CONSTRAINT book_release_pkey PRIMARY KEY (release_id);


--
-- Name: release_type catalog_release_type_release_type_code_key; Type: CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.release_type
    ADD CONSTRAINT catalog_release_type_release_type_code_key UNIQUE (release_type_code);


--
-- Name: work_type catalog_work_type_work_type_code_key; Type: CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.work_type
    ADD CONSTRAINT catalog_work_type_work_type_code_key UNIQUE (work_type_code);


--
-- Name: content_item content_item_pkey; Type: CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.content_item
    ADD CONSTRAINT content_item_pkey PRIMARY KEY (content_item_id);


--
-- Name: game_release game_release_pkey; Type: CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.game_release
    ADD CONSTRAINT game_release_pkey PRIMARY KEY (release_id);


--
-- Name: genre genre_pkey; Type: CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.genre
    ADD CONSTRAINT genre_pkey PRIMARY KEY (genre_id);


--
-- Name: identifier_type identifier_type_pkey; Type: CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.identifier_type
    ADD CONSTRAINT identifier_type_pkey PRIMARY KEY (identifier_type_id);


--
-- Name: lookup_table lookup_table_code_key; Type: CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.lookup_table
    ADD CONSTRAINT lookup_table_code_key UNIQUE (code);


--
-- Name: lookup_table lookup_table_pkey; Type: CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.lookup_table
    ADD CONSTRAINT lookup_table_pkey PRIMARY KEY (lookup_id);


--
-- Name: media_format media_format_media_category_format_code_key; Type: CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.media_format
    ADD CONSTRAINT media_format_media_category_format_code_key UNIQUE (format_code);


--
-- Name: media_format media_format_pkey; Type: CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.media_format
    ADD CONSTRAINT media_format_pkey PRIMARY KEY (media_format_id);


--
-- Name: movie_release movie_release_pkey; Type: CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.movie_release
    ADD CONSTRAINT movie_release_pkey PRIMARY KEY (release_id);


--
-- Name: music_release music_release_pkey; Type: CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.music_release
    ADD CONSTRAINT music_release_pkey PRIMARY KEY (release_id);


--
-- Name: physical_dimension physical_dimension_pkey; Type: CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.physical_dimension
    ADD CONSTRAINT physical_dimension_pkey PRIMARY KEY (physical_dimension_id);


--
-- Name: release_component release_component_pkey; Type: CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.release_component
    ADD CONSTRAINT release_component_pkey PRIMARY KEY (release_component_id);


--
-- Name: release_content release_content_pkey; Type: CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.release_content
    ADD CONSTRAINT release_content_pkey PRIMARY KEY (release_component_id, content_item_id);


--
-- Name: release_credit release_credit_pkey; Type: CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.release_credit
    ADD CONSTRAINT release_credit_pkey PRIMARY KEY (release_id, contributor_id, role_id);


--
-- Name: release_genre release_genre_pkey; Type: CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.release_genre
    ADD CONSTRAINT release_genre_pkey PRIMARY KEY (release_id, genre_id);


--
-- Name: release_identifier release_identifier_pkey; Type: CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.release_identifier
    ADD CONSTRAINT release_identifier_pkey PRIMARY KEY (release_identifier_id);


--
-- Name: release release_pkey; Type: CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.release
    ADD CONSTRAINT release_pkey PRIMARY KEY (release_id);


--
-- Name: release_type release_type_pkey; Type: CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.release_type
    ADD CONSTRAINT release_type_pkey PRIMARY KEY (release_type_id);


--
-- Name: screen_format screen_format_pkey; Type: CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.screen_format
    ADD CONSTRAINT screen_format_pkey PRIMARY KEY (screen_format_id);


--
-- Name: series series_pkey; Type: CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.series
    ADD CONSTRAINT series_pkey PRIMARY KEY (series_id);


--
-- Name: tag tag_pkey; Type: CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.tag
    ADD CONSTRAINT tag_pkey PRIMARY KEY (tag_id);


--
-- Name: taxonomy_node taxonomy_node_pkey; Type: CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.taxonomy_node
    ADD CONSTRAINT taxonomy_node_pkey PRIMARY KEY (taxonomy_node_id);


--
-- Name: age_rating uq_age_rating; Type: CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.age_rating
    ADD CONSTRAINT uq_age_rating UNIQUE (rating_system, rating_code);


--
-- Name: genre uq_genre_name; Type: CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.genre
    ADD CONSTRAINT uq_genre_name UNIQUE (genre_name);


--
-- Name: identifier_type uq_identifier_code; Type: CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.identifier_type
    ADD CONSTRAINT uq_identifier_code UNIQUE (identifier_code);


--
-- Name: screen_format uq_screen_format; Type: CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.screen_format
    ADD CONSTRAINT uq_screen_format UNIQUE (format_code);


--
-- Name: work_credit work_credit_pkey; Type: CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.work_credit
    ADD CONSTRAINT work_credit_pkey PRIMARY KEY (work_id, contributor_id, role_id);


--
-- Name: work work_pkey; Type: CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.work
    ADD CONSTRAINT work_pkey PRIMARY KEY (work_id);


--
-- Name: work_relationship work_relationship_pkey; Type: CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.work_relationship
    ADD CONSTRAINT work_relationship_pkey PRIMARY KEY (parent_work_id, child_work_id, work_relationship_type_id);


--
-- Name: work_relationship_type work_relationship_type_pkey; Type: CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.work_relationship_type
    ADD CONSTRAINT work_relationship_type_pkey PRIMARY KEY (work_relationship_type_id);


--
-- Name: work_relationship_type work_relationship_type_relationship_code_key; Type: CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.work_relationship_type
    ADD CONSTRAINT work_relationship_type_relationship_code_key UNIQUE (relationship_code);


--
-- Name: work_type work_type_pkey; Type: CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.work_type
    ADD CONSTRAINT work_type_pkey PRIMARY KEY (work_type_id);


--
-- Name: ix_release_component_format; Type: INDEX; Schema: catalog; Owner: -
--

CREATE INDEX ix_release_component_format ON catalog.release_component USING btree (media_format_id);


--
-- Name: ix_release_component_release; Type: INDEX; Schema: catalog; Owner: -
--

CREATE INDEX ix_release_component_release ON catalog.release_component USING btree (release_id);


--
-- Name: ix_release_credit_contributor; Type: INDEX; Schema: catalog; Owner: -
--

CREATE INDEX ix_release_credit_contributor ON catalog.release_credit USING btree (contributor_id);


--
-- Name: ix_release_credit_release; Type: INDEX; Schema: catalog; Owner: -
--

CREATE INDEX ix_release_credit_release ON catalog.release_credit USING btree (release_id);


--
-- Name: ix_release_identifier_release; Type: INDEX; Schema: catalog; Owner: -
--

CREATE INDEX ix_release_identifier_release ON catalog.release_identifier USING btree (release_id);


--
-- Name: ix_release_search; Type: INDEX; Schema: catalog; Owner: -
--

CREATE INDEX ix_release_search ON catalog.release USING gin (search_vector);


--
-- Name: ix_release_work; Type: INDEX; Schema: catalog; Owner: -
--

CREATE INDEX ix_release_work ON catalog.release USING btree (work_id);


--
-- Name: ix_release_year; Type: INDEX; Schema: catalog; Owner: -
--

CREATE INDEX ix_release_year ON catalog.release USING btree (release_year);


--
-- Name: ix_series_parent; Type: INDEX; Schema: catalog; Owner: -
--

CREATE INDEX ix_series_parent ON catalog.series USING btree (parent_series_id);


--
-- Name: ix_series_title; Type: INDEX; Schema: catalog; Owner: -
--

CREATE INDEX ix_series_title ON catalog.series USING btree (title);


--
-- Name: ix_work_credit_contributor; Type: INDEX; Schema: catalog; Owner: -
--

CREATE INDEX ix_work_credit_contributor ON catalog.work_credit USING btree (contributor_id);


--
-- Name: ix_work_credit_work; Type: INDEX; Schema: catalog; Owner: -
--

CREATE INDEX ix_work_credit_work ON catalog.work_credit USING btree (work_id);


--
-- Name: ix_work_search; Type: INDEX; Schema: catalog; Owner: -
--

CREATE INDEX ix_work_search ON catalog.work USING gin (search_vector);


--
-- Name: ix_work_series; Type: INDEX; Schema: catalog; Owner: -
--

CREATE INDEX ix_work_series ON catalog.work USING btree (series_id);


--
-- Name: ix_work_sort_title; Type: INDEX; Schema: catalog; Owner: -
--

CREATE INDEX ix_work_sort_title ON catalog.work USING btree (sort_title);


--
-- Name: ix_work_title; Type: INDEX; Schema: catalog; Owner: -
--

CREATE INDEX ix_work_title ON catalog.work USING btree (title);


--
-- Name: uq_release_identifier; Type: INDEX; Schema: catalog; Owner: -
--

CREATE UNIQUE INDEX uq_release_identifier ON catalog.release_identifier USING btree (identifier_type_id, identifier_value);


--
-- Name: book_release book_release_book_format_id_fkey; Type: FK CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.book_release
    ADD CONSTRAINT book_release_book_format_id_fkey FOREIGN KEY (book_format_id) REFERENCES catalog.media_format(media_format_id) ON DELETE CASCADE;


--
-- Name: book_release book_release_release_id_fkey; Type: FK CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.book_release
    ADD CONSTRAINT book_release_release_id_fkey FOREIGN KEY (release_id) REFERENCES catalog.release(release_id) ON DELETE CASCADE;


--
-- Name: content_item content_item_work_id_fkey; Type: FK CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.content_item
    ADD CONSTRAINT content_item_work_id_fkey FOREIGN KEY (work_id) REFERENCES catalog.work(work_id);


--
-- Name: release_genre fk_release_genre_release; Type: FK CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.release_genre
    ADD CONSTRAINT fk_release_genre_release FOREIGN KEY (release_id) REFERENCES catalog.release(release_id) ON DELETE CASCADE;


--
-- Name: game_release game_release_game_type_id_fkey; Type: FK CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.game_release
    ADD CONSTRAINT game_release_game_type_id_fkey FOREIGN KEY (game_type_id) REFERENCES catalog.media_format(media_format_id) ON DELETE CASCADE;


--
-- Name: game_release game_release_release_id_fkey; Type: FK CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.game_release
    ADD CONSTRAINT game_release_release_id_fkey FOREIGN KEY (release_id) REFERENCES catalog.release(release_id) ON DELETE CASCADE;


--
-- Name: genre genre_parent_genre_id_fkey; Type: FK CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.genre
    ADD CONSTRAINT genre_parent_genre_id_fkey FOREIGN KEY (parent_genre_id) REFERENCES catalog.genre(genre_id);


--
-- Name: movie_release movie_release_movie_format_id_fkey; Type: FK CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.movie_release
    ADD CONSTRAINT movie_release_movie_format_id_fkey FOREIGN KEY (movie_format_id) REFERENCES catalog.media_format(media_format_id) ON DELETE CASCADE;


--
-- Name: movie_release movie_release_release_id_fkey; Type: FK CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.movie_release
    ADD CONSTRAINT movie_release_release_id_fkey FOREIGN KEY (release_id) REFERENCES catalog.release(release_id) ON DELETE CASCADE;


--
-- Name: movie_release movie_release_screen_format_id_fkey; Type: FK CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.movie_release
    ADD CONSTRAINT movie_release_screen_format_id_fkey FOREIGN KEY (screen_format_id) REFERENCES catalog.screen_format(screen_format_id);


--
-- Name: music_release music_release_music_format_id_fkey; Type: FK CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.music_release
    ADD CONSTRAINT music_release_music_format_id_fkey FOREIGN KEY (music_format_id) REFERENCES catalog.media_format(media_format_id) ON DELETE CASCADE;


--
-- Name: music_release music_release_release_id_fkey; Type: FK CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.music_release
    ADD CONSTRAINT music_release_release_id_fkey FOREIGN KEY (release_id) REFERENCES catalog.release(release_id) ON DELETE CASCADE;


--
-- Name: release release_age_rating_id_fkey; Type: FK CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.release
    ADD CONSTRAINT release_age_rating_id_fkey FOREIGN KEY (age_rating_id) REFERENCES catalog.age_rating(age_rating_id);


--
-- Name: release_component release_component_media_format_id_fkey; Type: FK CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.release_component
    ADD CONSTRAINT release_component_media_format_id_fkey FOREIGN KEY (media_format_id) REFERENCES catalog.media_format(media_format_id);


--
-- Name: release_component release_component_release_id_fkey; Type: FK CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.release_component
    ADD CONSTRAINT release_component_release_id_fkey FOREIGN KEY (release_id) REFERENCES catalog.release(release_id) ON DELETE CASCADE;


--
-- Name: release_content release_content_content_item_id_fkey; Type: FK CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.release_content
    ADD CONSTRAINT release_content_content_item_id_fkey FOREIGN KEY (content_item_id) REFERENCES catalog.content_item(content_item_id);


--
-- Name: release_content release_content_release_component_id_fkey; Type: FK CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.release_content
    ADD CONSTRAINT release_content_release_component_id_fkey FOREIGN KEY (release_component_id) REFERENCES catalog.release_component(release_component_id);


--
-- Name: release_credit release_credit_contributor_id_fkey; Type: FK CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.release_credit
    ADD CONSTRAINT release_credit_contributor_id_fkey FOREIGN KEY (contributor_id) REFERENCES authority.contributor(contributor_id);


--
-- Name: release_credit release_credit_release_id_fkey; Type: FK CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.release_credit
    ADD CONSTRAINT release_credit_release_id_fkey FOREIGN KEY (release_id) REFERENCES catalog.release(release_id) ON DELETE CASCADE;


--
-- Name: release_credit release_credit_role_id_fkey; Type: FK CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.release_credit
    ADD CONSTRAINT release_credit_role_id_fkey FOREIGN KEY (role_id) REFERENCES authority.role(role_id);


--
-- Name: release_genre release_genre_genre_id_fkey; Type: FK CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.release_genre
    ADD CONSTRAINT release_genre_genre_id_fkey FOREIGN KEY (genre_id) REFERENCES catalog.genre(genre_id) ON DELETE CASCADE;


--
-- Name: release_identifier release_identifier_identifier_type_id_fkey; Type: FK CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.release_identifier
    ADD CONSTRAINT release_identifier_identifier_type_id_fkey FOREIGN KEY (identifier_type_id) REFERENCES catalog.identifier_type(identifier_type_id);


--
-- Name: release_identifier release_identifier_release_id_fkey; Type: FK CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.release_identifier
    ADD CONSTRAINT release_identifier_release_id_fkey FOREIGN KEY (release_id) REFERENCES catalog.release(release_id) ON DELETE CASCADE;


--
-- Name: release release_physical_dimension_id_fkey; Type: FK CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.release
    ADD CONSTRAINT release_physical_dimension_id_fkey FOREIGN KEY (physical_dimension_id) REFERENCES catalog.physical_dimension(physical_dimension_id);


--
-- Name: release release_release_type_id_fkey; Type: FK CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.release
    ADD CONSTRAINT release_release_type_id_fkey FOREIGN KEY (release_type_id) REFERENCES catalog.release_type(release_type_id);


--
-- Name: release release_work_id_fkey; Type: FK CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.release
    ADD CONSTRAINT release_work_id_fkey FOREIGN KEY (work_id) REFERENCES catalog.work(work_id) ON DELETE RESTRICT;


--
-- Name: series series_parent_series_id_fkey; Type: FK CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.series
    ADD CONSTRAINT series_parent_series_id_fkey FOREIGN KEY (parent_series_id) REFERENCES catalog.series(series_id);


--
-- Name: taxonomy_node taxonomy_node_parent_node_id_fkey; Type: FK CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.taxonomy_node
    ADD CONSTRAINT taxonomy_node_parent_node_id_fkey FOREIGN KEY (parent_node_id) REFERENCES catalog.taxonomy_node(taxonomy_node_id);


--
-- Name: work_credit work_credit_contributor_id_fkey; Type: FK CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.work_credit
    ADD CONSTRAINT work_credit_contributor_id_fkey FOREIGN KEY (contributor_id) REFERENCES authority.contributor(contributor_id);


--
-- Name: work_credit work_credit_role_id_fkey; Type: FK CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.work_credit
    ADD CONSTRAINT work_credit_role_id_fkey FOREIGN KEY (role_id) REFERENCES authority.role(role_id);


--
-- Name: work_credit work_credit_work_id_fkey; Type: FK CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.work_credit
    ADD CONSTRAINT work_credit_work_id_fkey FOREIGN KEY (work_id) REFERENCES catalog.work(work_id) ON DELETE CASCADE;


--
-- Name: work_relationship work_relationship_child_work_id_fkey; Type: FK CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.work_relationship
    ADD CONSTRAINT work_relationship_child_work_id_fkey FOREIGN KEY (child_work_id) REFERENCES catalog.work(work_id);


--
-- Name: work_relationship work_relationship_parent_work_id_fkey; Type: FK CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.work_relationship
    ADD CONSTRAINT work_relationship_parent_work_id_fkey FOREIGN KEY (parent_work_id) REFERENCES catalog.work(work_id);


--
-- Name: work_relationship work_relationship_work_relationship_type_id_fkey; Type: FK CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.work_relationship
    ADD CONSTRAINT work_relationship_work_relationship_type_id_fkey FOREIGN KEY (work_relationship_type_id) REFERENCES catalog.work_relationship_type(work_relationship_type_id);


--
-- Name: work work_series_id_fkey; Type: FK CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.work
    ADD CONSTRAINT work_series_id_fkey FOREIGN KEY (series_id) REFERENCES catalog.series(series_id);


--
-- PostgreSQL database dump complete
--

\unrestrict hRcKy83scNPhVsFQglBKKvyWLyVeRaceAI0DX87iZdBYG4lBlJKxeI66jCApiik

