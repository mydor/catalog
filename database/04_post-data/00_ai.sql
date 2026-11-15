--
-- PostgreSQL database dump
--

\restrict OzSRj4LEyaHBT06khMR1cPmXvZ63JY8xCxdGDhNluCzPCLpSlj2miVDqpA4aoh4

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
-- Name: ai_enrichment ai_enrichment_pkey; Type: CONSTRAINT; Schema: ai; Owner: -
--

ALTER TABLE ONLY ai.ai_enrichment
    ADD CONSTRAINT ai_enrichment_pkey PRIMARY KEY (ai_enrichment_id);


--
-- Name: recommendation_cache recommendation_cache_pkey; Type: CONSTRAINT; Schema: ai; Owner: -
--

ALTER TABLE ONLY ai.recommendation_cache
    ADD CONSTRAINT recommendation_cache_pkey PRIMARY KEY (recommendation_cache_id);


--
-- Name: recommendation_model recommendation_model_pkey; Type: CONSTRAINT; Schema: ai; Owner: -
--

ALTER TABLE ONLY ai.recommendation_model
    ADD CONSTRAINT recommendation_model_pkey PRIMARY KEY (recommendation_model_id);


--
-- Name: release_embedding release_embedding_pkey; Type: CONSTRAINT; Schema: ai; Owner: -
--

ALTER TABLE ONLY ai.release_embedding
    ADD CONSTRAINT release_embedding_pkey PRIMARY KEY (release_embedding_id);


--
-- Name: release_semantic_tag release_semantic_tag_pkey; Type: CONSTRAINT; Schema: ai; Owner: -
--

ALTER TABLE ONLY ai.release_semantic_tag
    ADD CONSTRAINT release_semantic_tag_pkey PRIMARY KEY (release_id, semantic_tag_id);


--
-- Name: recommendation_model uq_recommendation_model; Type: CONSTRAINT; Schema: ai; Owner: -
--

ALTER TABLE ONLY ai.recommendation_model
    ADD CONSTRAINT uq_recommendation_model UNIQUE (model_code);


--
-- Name: user_interaction_event user_interaction_event_pkey; Type: CONSTRAINT; Schema: ai; Owner: -
--

ALTER TABLE ONLY ai.user_interaction_event
    ADD CONSTRAINT user_interaction_event_pkey PRIMARY KEY (user_interaction_event_id);


--
-- Name: ix_ai_enrichment_release; Type: INDEX; Schema: ai; Owner: -
--

CREATE INDEX ix_ai_enrichment_release ON ai.ai_enrichment USING btree (release_id);


--
-- Name: ix_recommendation_source; Type: INDEX; Schema: ai; Owner: -
--

CREATE INDEX ix_recommendation_source ON ai.recommendation_cache USING btree (source_release_id);


--
-- Name: ix_release_embedding_vector; Type: INDEX; Schema: ai; Owner: -
--

CREATE INDEX ix_release_embedding_vector ON ai.release_embedding USING hnsw (embedding public.vector_cosine_ops);


--
-- Name: ix_release_semantic_tag_release; Type: INDEX; Schema: ai; Owner: -
--

CREATE INDEX ix_release_semantic_tag_release ON ai.release_semantic_tag USING btree (release_id);


--
-- Name: ix_user_interaction_user; Type: INDEX; Schema: ai; Owner: -
--

CREATE INDEX ix_user_interaction_user ON ai.user_interaction_event USING btree (user_id);


--
-- Name: ai_enrichment ai_enrichment_release_id_fkey; Type: FK CONSTRAINT; Schema: ai; Owner: -
--

ALTER TABLE ONLY ai.ai_enrichment
    ADD CONSTRAINT ai_enrichment_release_id_fkey FOREIGN KEY (release_id) REFERENCES catalog.release(release_id) ON DELETE CASCADE;


--
-- Name: recommendation_cache recommendation_cache_recommendation_model_id_fkey; Type: FK CONSTRAINT; Schema: ai; Owner: -
--

ALTER TABLE ONLY ai.recommendation_cache
    ADD CONSTRAINT recommendation_cache_recommendation_model_id_fkey FOREIGN KEY (recommendation_model_id) REFERENCES ai.recommendation_model(recommendation_model_id);


--
-- Name: recommendation_cache recommendation_cache_recommended_release_id_fkey; Type: FK CONSTRAINT; Schema: ai; Owner: -
--

ALTER TABLE ONLY ai.recommendation_cache
    ADD CONSTRAINT recommendation_cache_recommended_release_id_fkey FOREIGN KEY (recommended_release_id) REFERENCES catalog.release(release_id);


--
-- Name: recommendation_cache recommendation_cache_source_release_id_fkey; Type: FK CONSTRAINT; Schema: ai; Owner: -
--

ALTER TABLE ONLY ai.recommendation_cache
    ADD CONSTRAINT recommendation_cache_source_release_id_fkey FOREIGN KEY (source_release_id) REFERENCES catalog.release(release_id);


--
-- Name: release_embedding release_embedding_release_id_fkey; Type: FK CONSTRAINT; Schema: ai; Owner: -
--

ALTER TABLE ONLY ai.release_embedding
    ADD CONSTRAINT release_embedding_release_id_fkey FOREIGN KEY (release_id) REFERENCES catalog.release(release_id) ON DELETE CASCADE;


--
-- Name: release_semantic_tag release_semantic_tag_release_id_fkey; Type: FK CONSTRAINT; Schema: ai; Owner: -
--

ALTER TABLE ONLY ai.release_semantic_tag
    ADD CONSTRAINT release_semantic_tag_release_id_fkey FOREIGN KEY (release_id) REFERENCES catalog.release(release_id) ON DELETE CASCADE;


--
-- Name: release_semantic_tag release_semantic_tag_semantic_tag_id_fkey; Type: FK CONSTRAINT; Schema: ai; Owner: -
--

ALTER TABLE ONLY ai.release_semantic_tag
    ADD CONSTRAINT release_semantic_tag_semantic_tag_id_fkey FOREIGN KEY (semantic_tag_id) REFERENCES catalog.tag(tag_id);


--
-- Name: user_interaction_event user_interaction_event_copy_id_fkey; Type: FK CONSTRAINT; Schema: ai; Owner: -
--

ALTER TABLE ONLY ai.user_interaction_event
    ADD CONSTRAINT user_interaction_event_copy_id_fkey FOREIGN KEY (copy_id) REFERENCES inventory.inventory_copy(copy_id);


--
-- Name: user_interaction_event user_interaction_event_release_id_fkey; Type: FK CONSTRAINT; Schema: ai; Owner: -
--

ALTER TABLE ONLY ai.user_interaction_event
    ADD CONSTRAINT user_interaction_event_release_id_fkey FOREIGN KEY (release_id) REFERENCES catalog.release(release_id);


--
-- Name: user_interaction_event user_interaction_event_user_id_fkey; Type: FK CONSTRAINT; Schema: ai; Owner: -
--

ALTER TABLE ONLY ai.user_interaction_event
    ADD CONSTRAINT user_interaction_event_user_id_fkey FOREIGN KEY (user_id) REFERENCES users.app_user(user_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict OzSRj4LEyaHBT06khMR1cPmXvZ63JY8xCxdGDhNluCzPCLpSlj2miVDqpA4aoh4

