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
-- Data for Name: copy_location; Type: TABLE DATA; Schema: storage; Owner: -
--

COPY storage.copy_location (copy_id, location_id) FROM stdin;
\.


--
-- Data for Name: location_type; Type: TABLE DATA; Schema: storage; Owner: -
--

COPY storage.location_type (location_type_id, location_type_code, location_type_name) FROM stdin;
1	ROOM	Room
2	RACK	Rack
3	SHELF	Shelf
4	BOX	Box
5	DRAWER	Drawer
6	CABINET	Cabinet
7	BIN	Bin
8	STORAGE	Storage Unit
\.


--
-- Data for Name: storage_location; Type: TABLE DATA; Schema: storage; Owner: -
--

COPY storage.storage_location (location_id, user_id, parent_location_id, location_type_id, location_code, location_name, created_at, updated_at) FROM stdin;
\.


--
-- Name: location_type_location_type_id_seq; Type: SEQUENCE SET; Schema: storage; Owner: -
--

SELECT pg_catalog.setval('storage.location_type_location_type_id_seq', 1, false);


--
-- Name: storage_location_location_id_seq; Type: SEQUENCE SET; Schema: storage; Owner: -
--

SELECT pg_catalog.setval('storage.storage_location_location_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

\unrestrict DisableCodeExecution

