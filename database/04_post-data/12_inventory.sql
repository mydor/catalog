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
-- Name: copy_tag copy_tag_pkey; Type: CONSTRAINT; Schema: inventory; Owner: -
--

ALTER TABLE ONLY inventory.copy_tag
    ADD CONSTRAINT copy_tag_pkey PRIMARY KEY (copy_id, collection_tag_id);


--
-- Name: insurance_policy insurance_policy_pkey; Type: CONSTRAINT; Schema: inventory; Owner: -
--

ALTER TABLE ONLY inventory.insurance_policy
    ADD CONSTRAINT insurance_policy_pkey PRIMARY KEY (insurance_policy_id);


--
-- Name: insured_item insured_item_pkey; Type: CONSTRAINT; Schema: inventory; Owner: -
--

ALTER TABLE ONLY inventory.insured_item
    ADD CONSTRAINT insured_item_pkey PRIMARY KEY (insured_item_id);


--
-- Name: inventory_copy inventory_copy_pkey; Type: CONSTRAINT; Schema: inventory; Owner: -
--

ALTER TABLE ONLY inventory.inventory_copy
    ADD CONSTRAINT inventory_copy_pkey PRIMARY KEY (copy_id);


--
-- Name: inventory_valuation inventory_valuation_pkey; Type: CONSTRAINT; Schema: inventory; Owner: -
--

ALTER TABLE ONLY inventory.inventory_valuation
    ADD CONSTRAINT inventory_valuation_pkey PRIMARY KEY (inventory_valuation_id);


--
-- Name: item_condition item_condition_pkey; Type: CONSTRAINT; Schema: inventory; Owner: -
--

ALTER TABLE ONLY inventory.item_condition
    ADD CONSTRAINT item_condition_pkey PRIMARY KEY (item_condition_id);


--
-- Name: market_value_history market_value_history_pkey; Type: CONSTRAINT; Schema: inventory; Owner: -
--

ALTER TABLE ONLY inventory.market_value_history
    ADD CONSTRAINT market_value_history_pkey PRIMARY KEY (market_value_history_id);


--
-- Name: insured_item uq_insured_item; Type: CONSTRAINT; Schema: inventory; Owner: -
--

ALTER TABLE ONLY inventory.insured_item
    ADD CONSTRAINT uq_insured_item UNIQUE (insurance_policy_id, copy_id);


--
-- Name: item_condition uq_item_condition_code; Type: CONSTRAINT; Schema: inventory; Owner: -
--

ALTER TABLE ONLY inventory.item_condition
    ADD CONSTRAINT uq_item_condition_code UNIQUE (condition_code);


--
-- Name: valuation_source uq_valuation_source; Type: CONSTRAINT; Schema: inventory; Owner: -
--

ALTER TABLE ONLY inventory.valuation_source
    ADD CONSTRAINT uq_valuation_source UNIQUE (source_code);


--
-- Name: valuation_source valuation_source_pkey; Type: CONSTRAINT; Schema: inventory; Owner: -
--

ALTER TABLE ONLY inventory.valuation_source
    ADD CONSTRAINT valuation_source_pkey PRIMARY KEY (valuation_source_id);


--
-- Name: wishlist_item wishlist_item_pkey; Type: CONSTRAINT; Schema: inventory; Owner: -
--

ALTER TABLE ONLY inventory.wishlist_item
    ADD CONSTRAINT wishlist_item_pkey PRIMARY KEY (wishlist_item_id);


--
-- Name: ix_inventory_copy_condition; Type: INDEX; Schema: inventory; Owner: -
--

CREATE INDEX ix_inventory_copy_condition ON inventory.inventory_copy USING btree (item_condition_id);


--
-- Name: ix_inventory_copy_release; Type: INDEX; Schema: inventory; Owner: -
--

CREATE INDEX ix_inventory_copy_release ON inventory.inventory_copy USING btree (release_id);


--
-- Name: ix_inventory_copy_user; Type: INDEX; Schema: inventory; Owner: -
--

CREATE INDEX ix_inventory_copy_user ON inventory.inventory_copy USING btree (user_id);


--
-- Name: copy_tag copy_tag_collection_tag_id_fkey; Type: FK CONSTRAINT; Schema: inventory; Owner: -
--

ALTER TABLE ONLY inventory.copy_tag
    ADD CONSTRAINT copy_tag_collection_tag_id_fkey FOREIGN KEY (collection_tag_id) REFERENCES catalog.tag(tag_id);


--
-- Name: copy_tag copy_tag_copy_id_fkey; Type: FK CONSTRAINT; Schema: inventory; Owner: -
--

ALTER TABLE ONLY inventory.copy_tag
    ADD CONSTRAINT copy_tag_copy_id_fkey FOREIGN KEY (copy_id) REFERENCES inventory.inventory_copy(copy_id) ON DELETE CASCADE;


--
-- Name: insurance_policy insurance_policy_user_id_fkey; Type: FK CONSTRAINT; Schema: inventory; Owner: -
--

ALTER TABLE ONLY inventory.insurance_policy
    ADD CONSTRAINT insurance_policy_user_id_fkey FOREIGN KEY (user_id) REFERENCES users.app_user(user_id) ON DELETE CASCADE;


--
-- Name: insured_item insured_item_copy_id_fkey; Type: FK CONSTRAINT; Schema: inventory; Owner: -
--

ALTER TABLE ONLY inventory.insured_item
    ADD CONSTRAINT insured_item_copy_id_fkey FOREIGN KEY (copy_id) REFERENCES inventory.inventory_copy(copy_id) ON DELETE CASCADE;


--
-- Name: insured_item insured_item_insurance_policy_id_fkey; Type: FK CONSTRAINT; Schema: inventory; Owner: -
--

ALTER TABLE ONLY inventory.insured_item
    ADD CONSTRAINT insured_item_insurance_policy_id_fkey FOREIGN KEY (insurance_policy_id) REFERENCES inventory.insurance_policy(insurance_policy_id) ON DELETE CASCADE;


--
-- Name: inventory_copy inventory_copy_item_condition_id_fkey; Type: FK CONSTRAINT; Schema: inventory; Owner: -
--

ALTER TABLE ONLY inventory.inventory_copy
    ADD CONSTRAINT inventory_copy_item_condition_id_fkey FOREIGN KEY (item_condition_id) REFERENCES inventory.item_condition(item_condition_id);


--
-- Name: inventory_copy inventory_copy_release_id_fkey; Type: FK CONSTRAINT; Schema: inventory; Owner: -
--

ALTER TABLE ONLY inventory.inventory_copy
    ADD CONSTRAINT inventory_copy_release_id_fkey FOREIGN KEY (release_id) REFERENCES catalog.release(release_id) ON DELETE RESTRICT;


--
-- Name: inventory_copy inventory_copy_user_id_fkey; Type: FK CONSTRAINT; Schema: inventory; Owner: -
--

ALTER TABLE ONLY inventory.inventory_copy
    ADD CONSTRAINT inventory_copy_user_id_fkey FOREIGN KEY (user_id) REFERENCES users.app_user(user_id) ON DELETE CASCADE;


--
-- Name: inventory_valuation inventory_valuation_copy_id_fkey; Type: FK CONSTRAINT; Schema: inventory; Owner: -
--

ALTER TABLE ONLY inventory.inventory_valuation
    ADD CONSTRAINT inventory_valuation_copy_id_fkey FOREIGN KEY (copy_id) REFERENCES inventory.inventory_copy(copy_id) ON DELETE CASCADE;


--
-- Name: inventory_valuation inventory_valuation_valuation_source_id_fkey; Type: FK CONSTRAINT; Schema: inventory; Owner: -
--

ALTER TABLE ONLY inventory.inventory_valuation
    ADD CONSTRAINT inventory_valuation_valuation_source_id_fkey FOREIGN KEY (valuation_source_id) REFERENCES inventory.valuation_source(valuation_source_id);


--
-- Name: market_value_history market_value_history_copy_id_fkey; Type: FK CONSTRAINT; Schema: inventory; Owner: -
--

ALTER TABLE ONLY inventory.market_value_history
    ADD CONSTRAINT market_value_history_copy_id_fkey FOREIGN KEY (copy_id) REFERENCES inventory.inventory_copy(copy_id) ON DELETE CASCADE;


--
-- Name: market_value_history market_value_history_valuation_source_id_fkey; Type: FK CONSTRAINT; Schema: inventory; Owner: -
--

ALTER TABLE ONLY inventory.market_value_history
    ADD CONSTRAINT market_value_history_valuation_source_id_fkey FOREIGN KEY (valuation_source_id) REFERENCES inventory.valuation_source(valuation_source_id);


--
-- Name: wishlist_item wishlist_item_release_id_fkey; Type: FK CONSTRAINT; Schema: inventory; Owner: -
--

ALTER TABLE ONLY inventory.wishlist_item
    ADD CONSTRAINT wishlist_item_release_id_fkey FOREIGN KEY (release_id) REFERENCES catalog.release(release_id);


--
-- Name: wishlist_item wishlist_item_user_id_fkey; Type: FK CONSTRAINT; Schema: inventory; Owner: -
--

ALTER TABLE ONLY inventory.wishlist_item
    ADD CONSTRAINT wishlist_item_user_id_fkey FOREIGN KEY (user_id) REFERENCES users.app_user(user_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict DisableCodeExecution

