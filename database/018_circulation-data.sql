--
-- PostgreSQL database dump
--

\restrict BMDFZETMgR9cf98Ay9qmc6NWCeD4FRuy4Ozdsg3iGdIIyzfQcjbanVdaILID8TT

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

--
-- Data for Name: borrower; Type: TABLE DATA; Schema: circulation; Owner: -
--

COPY circulation.borrower (borrower_id, user_id, borrower_name, email_address, phone_number, notes, is_active, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: loan; Type: TABLE DATA; Schema: circulation; Owner: -
--

COPY circulation.loan (loan_id, copy_id, borrower_id, loan_date, due_date, returned_date, loan_notes, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: loan_event; Type: TABLE DATA; Schema: circulation; Owner: -
--

COPY circulation.loan_event (loan_event_id, loan_id, event_type, event_timestamp, event_details) FROM stdin;
\.


--
-- Data for Name: reservation; Type: TABLE DATA; Schema: circulation; Owner: -
--

COPY circulation.reservation (reservation_id, copy_id, borrower_id, reservation_date, expiration_date, fulfilled_date, status) FROM stdin;
\.


--
-- Name: borrower_borrower_id_seq; Type: SEQUENCE SET; Schema: circulation; Owner: -
--

SELECT pg_catalog.setval('circulation.borrower_borrower_id_seq', 1, false);


--
-- Name: loan_event_loan_event_id_seq; Type: SEQUENCE SET; Schema: circulation; Owner: -
--

SELECT pg_catalog.setval('circulation.loan_event_loan_event_id_seq', 1, false);


--
-- Name: loan_loan_id_seq; Type: SEQUENCE SET; Schema: circulation; Owner: -
--

SELECT pg_catalog.setval('circulation.loan_loan_id_seq', 1, false);


--
-- Name: reservation_reservation_id_seq; Type: SEQUENCE SET; Schema: circulation; Owner: -
--

SELECT pg_catalog.setval('circulation.reservation_reservation_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

\unrestrict BMDFZETMgR9cf98Ay9qmc6NWCeD4FRuy4Ozdsg3iGdIIyzfQcjbanVdaILID8TT

