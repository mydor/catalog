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

--
-- Data for Name: copy_tag; Type: TABLE DATA; Schema: inventory; Owner: -
--

COPY inventory.copy_tag (copy_id, collection_tag_id) FROM stdin;
\.


--
-- Data for Name: insurance_policy; Type: TABLE DATA; Schema: inventory; Owner: -
--

COPY inventory.insurance_policy (insurance_policy_id, user_id, policy_name, carrier_name, policy_number, effective_date, expiration_date, coverage_limit, notes) FROM stdin;
\.


--
-- Data for Name: insured_item; Type: TABLE DATA; Schema: inventory; Owner: -
--

COPY inventory.insured_item (insured_item_id, insurance_policy_id, copy_id, insured_value, notes) FROM stdin;
\.


--
-- Data for Name: inventory_copy; Type: TABLE DATA; Schema: inventory; Owner: -
--

COPY inventory.inventory_copy (copy_id, user_id, release_id, item_condition_id, acquisition_date, acquisition_price, acquisition_source, ownership_notes, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: inventory_valuation; Type: TABLE DATA; Schema: inventory; Owner: -
--

COPY inventory.inventory_valuation (inventory_valuation_id, copy_id, valuation_source_id, valuation_type, valuation_amount, valuation_date, notes, created_at) FROM stdin;
\.


--
-- Data for Name: item_condition; Type: TABLE DATA; Schema: inventory; Owner: -
--

COPY inventory.item_condition (item_condition_id, condition_code, condition_name, description, sort_order) FROM stdin;
1	SEALED	Sealed	\N	1
2	MINT	Mint	\N	2
3	NEAR_MINT	Near Mint	\N	3
4	EXCELLENT	Excellent	\N	4
5	GOOD	Good	\N	5
6	FAIR	Fair	\N	6
7	POOR	Poor	\N	7
8	DAMAGED	Damaged	\N	8
\.


--
-- Data for Name: market_value_history; Type: TABLE DATA; Schema: inventory; Owner: -
--

COPY inventory.market_value_history (market_value_history_id, copy_id, valuation_source_id, valuation_amount, valuation_date, notes) FROM stdin;
\.


--
-- Data for Name: valuation_source; Type: TABLE DATA; Schema: inventory; Owner: -
--

COPY inventory.valuation_source (valuation_source_id, source_code, source_name, source_url) FROM stdin;
\.


--
-- Data for Name: wishlist_item; Type: TABLE DATA; Schema: inventory; Owner: -
--

COPY inventory.wishlist_item (wishlist_item_id, user_id, release_id, priority, desired_price, notes, created_at) FROM stdin;
\.


--
-- Name: insurance_policy_insurance_policy_id_seq; Type: SEQUENCE SET; Schema: inventory; Owner: -
--

SELECT pg_catalog.setval('inventory.insurance_policy_insurance_policy_id_seq', 1, false);


--
-- Name: insured_item_insured_item_id_seq; Type: SEQUENCE SET; Schema: inventory; Owner: -
--

SELECT pg_catalog.setval('inventory.insured_item_insured_item_id_seq', 1, false);


--
-- Name: inventory_copy_copy_id_seq; Type: SEQUENCE SET; Schema: inventory; Owner: -
--

SELECT pg_catalog.setval('inventory.inventory_copy_copy_id_seq', 1, false);


--
-- Name: inventory_valuation_inventory_valuation_id_seq; Type: SEQUENCE SET; Schema: inventory; Owner: -
--

SELECT pg_catalog.setval('inventory.inventory_valuation_inventory_valuation_id_seq', 1, false);


--
-- Name: item_condition_item_condition_id_seq; Type: SEQUENCE SET; Schema: inventory; Owner: -
--

SELECT pg_catalog.setval('inventory.item_condition_item_condition_id_seq', 8, true);


--
-- Name: market_value_history_market_value_history_id_seq; Type: SEQUENCE SET; Schema: inventory; Owner: -
--

SELECT pg_catalog.setval('inventory.market_value_history_market_value_history_id_seq', 1, false);


--
-- Name: valuation_source_valuation_source_id_seq; Type: SEQUENCE SET; Schema: inventory; Owner: -
--

SELECT pg_catalog.setval('inventory.valuation_source_valuation_source_id_seq', 1, false);


--
-- Name: wishlist_item_wishlist_item_id_seq; Type: SEQUENCE SET; Schema: inventory; Owner: -
--

SELECT pg_catalog.setval('inventory.wishlist_item_wishlist_item_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

\unrestrict DisableCodeExecution

