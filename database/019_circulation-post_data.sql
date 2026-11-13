--
-- PostgreSQL database dump
--

\restrict xNN8ajouoXUDy2lnzJgeMAFwCagb03RzdTfUKcYIPlJwbc2SccbDpuJb3YW6eOg

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
-- Name: borrower borrower_pkey; Type: CONSTRAINT; Schema: circulation; Owner: -
--

ALTER TABLE ONLY circulation.borrower
    ADD CONSTRAINT borrower_pkey PRIMARY KEY (borrower_id);


--
-- Name: loan_event loan_event_pkey; Type: CONSTRAINT; Schema: circulation; Owner: -
--

ALTER TABLE ONLY circulation.loan_event
    ADD CONSTRAINT loan_event_pkey PRIMARY KEY (loan_event_id);


--
-- Name: loan loan_pkey; Type: CONSTRAINT; Schema: circulation; Owner: -
--

ALTER TABLE ONLY circulation.loan
    ADD CONSTRAINT loan_pkey PRIMARY KEY (loan_id);


--
-- Name: reservation reservation_pkey; Type: CONSTRAINT; Schema: circulation; Owner: -
--

ALTER TABLE ONLY circulation.reservation
    ADD CONSTRAINT reservation_pkey PRIMARY KEY (reservation_id);


--
-- Name: ix_borrower_name; Type: INDEX; Schema: circulation; Owner: -
--

CREATE INDEX ix_borrower_name ON circulation.borrower USING btree (borrower_name);


--
-- Name: ix_borrower_user; Type: INDEX; Schema: circulation; Owner: -
--

CREATE INDEX ix_borrower_user ON circulation.borrower USING btree (user_id);


--
-- Name: ix_loan_borrower; Type: INDEX; Schema: circulation; Owner: -
--

CREATE INDEX ix_loan_borrower ON circulation.loan USING btree (borrower_id);


--
-- Name: ix_loan_copy; Type: INDEX; Schema: circulation; Owner: -
--

CREATE INDEX ix_loan_copy ON circulation.loan USING btree (copy_id);


--
-- Name: uq_active_copy_loan; Type: INDEX; Schema: circulation; Owner: -
--

CREATE UNIQUE INDEX uq_active_copy_loan ON circulation.loan USING btree (copy_id) WHERE (returned_date IS NULL);


--
-- Name: borrower borrower_user_id_fkey; Type: FK CONSTRAINT; Schema: circulation; Owner: -
--

ALTER TABLE ONLY circulation.borrower
    ADD CONSTRAINT borrower_user_id_fkey FOREIGN KEY (user_id) REFERENCES users.app_user(user_id) ON DELETE CASCADE;


--
-- Name: loan loan_borrower_id_fkey; Type: FK CONSTRAINT; Schema: circulation; Owner: -
--

ALTER TABLE ONLY circulation.loan
    ADD CONSTRAINT loan_borrower_id_fkey FOREIGN KEY (borrower_id) REFERENCES circulation.borrower(borrower_id) ON DELETE RESTRICT;


--
-- Name: loan loan_copy_id_fkey; Type: FK CONSTRAINT; Schema: circulation; Owner: -
--

ALTER TABLE ONLY circulation.loan
    ADD CONSTRAINT loan_copy_id_fkey FOREIGN KEY (copy_id) REFERENCES inventory.inventory_copy(copy_id) ON DELETE RESTRICT;


--
-- Name: loan_event loan_event_loan_id_fkey; Type: FK CONSTRAINT; Schema: circulation; Owner: -
--

ALTER TABLE ONLY circulation.loan_event
    ADD CONSTRAINT loan_event_loan_id_fkey FOREIGN KEY (loan_id) REFERENCES circulation.loan(loan_id) ON DELETE CASCADE;


--
-- Name: reservation reservation_borrower_id_fkey; Type: FK CONSTRAINT; Schema: circulation; Owner: -
--

ALTER TABLE ONLY circulation.reservation
    ADD CONSTRAINT reservation_borrower_id_fkey FOREIGN KEY (borrower_id) REFERENCES circulation.borrower(borrower_id) ON DELETE CASCADE;


--
-- Name: reservation reservation_copy_id_fkey; Type: FK CONSTRAINT; Schema: circulation; Owner: -
--

ALTER TABLE ONLY circulation.reservation
    ADD CONSTRAINT reservation_copy_id_fkey FOREIGN KEY (copy_id) REFERENCES inventory.inventory_copy(copy_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict xNN8ajouoXUDy2lnzJgeMAFwCagb03RzdTfUKcYIPlJwbc2SccbDpuJb3YW6eOg

