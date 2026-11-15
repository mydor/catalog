--
-- PostgreSQL database dump
--

\restrict 6UGklaDSaRXLeoMnjmnB8ZO5C9ABqu8EN64UigT6bBRW93GjXLtTH3qf6FPLofJ

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
-- Data for Name: alias; Type: TABLE DATA; Schema: authority; Owner: -
--

COPY authority.alias (alias_id, contributor_id, alias_name, is_preferred) FROM stdin;
\.


--
-- Data for Name: contributor; Type: TABLE DATA; Schema: authority; Owner: -
--

COPY authority.contributor (contributor_id, person_id, organization_id, created_at) FROM stdin;
\.


--
-- Data for Name: organization; Type: TABLE DATA; Schema: authority; Owner: -
--

COPY authority.organization (organization_id, organization_name, normalized_name, formed_date, dissolved_date, website_url, notes, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: person; Type: TABLE DATA; Schema: authority; Owner: -
--

COPY authority.person (person_id, primary_name, normalized_name, name_sequence, birth_date, death_date, biography, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: authority; Owner: -
--

COPY authority.role (role_id, role_code, role_name, description, created_at) FROM stdin;
1	AUTHOR	Author	\N	2026-06-09 11:29:24.005912-05
2	EDITOR	Editor	\N	2026-06-09 11:29:24.005912-05
3	ILLUSTRATOR	Illustrator	\N	2026-06-09 11:29:24.005912-05
4	TRANSLATOR	Translator	\N	2026-06-09 11:29:24.005912-05
5	NARRATOR	Narrator	\N	2026-06-09 11:29:24.005912-05
6	GAME_DESIGNER	Game Designer	\N	2026-06-09 11:29:24.005912-05
7	GAME_ARTIST	Game Artist	\N	2026-06-09 11:29:24.005912-05
8	DEVELOPER	Developer	\N	2026-06-09 11:29:24.005912-05
9	ACTOR	Actor	\N	2026-06-09 11:29:24.005912-05
10	PRODUCER	Producer	\N	2026-06-09 11:29:24.005912-05
11	SCREENWRITER	Screenwriter	\N	2026-06-09 11:29:24.005912-05
12	COMPOSER	Composer	\N	2026-06-09 11:29:24.005912-05
13	CONDUCTOR	Conductor	\N	2026-06-09 11:29:24.005912-05
14	MUSICIAN	Musician	\N	2026-06-09 11:29:24.005912-05
15	VOCALIST	Vocalist	\N	2026-06-09 11:29:24.005912-05
16	BAND	Band	\N	2026-06-09 11:29:24.005912-05
17	ORCHESTRA	Orchestra	\N	2026-06-09 11:29:24.005912-05
18	COVER_ARTIST	Cover Artist	\N	2026-06-09 11:29:24.005912-05
19	PHOTOGRAPHER	Photographer	\N	2026-06-09 11:29:24.005912-05
20	PUBLISHER	Publisher	\N	2026-06-14 14:36:52.302742-05
21	LABEL	Label	\N	2026-06-14 14:36:52.302742-05
22	STUDIO	Studio	\N	2026-06-14 14:36:52.302742-05
23	DISTRIBUTOR	Distributor	\N	2026-06-14 14:36:52.302742-05
24	MANUFACTURER	Manufacturer	\N	2026-06-14 14:36:52.302742-05
\.


--
-- Name: alias_alias_id_seq; Type: SEQUENCE SET; Schema: authority; Owner: -
--

SELECT pg_catalog.setval('authority.alias_alias_id_seq', 1, false);


--
-- Name: contributor_contributor_id_seq; Type: SEQUENCE SET; Schema: authority; Owner: -
--

SELECT pg_catalog.setval('authority.contributor_contributor_id_seq', 1, false);


--
-- Name: organization_organization_id_seq; Type: SEQUENCE SET; Schema: authority; Owner: -
--

SELECT pg_catalog.setval('authority.organization_organization_id_seq', 1, false);


--
-- Name: person_person_id_seq; Type: SEQUENCE SET; Schema: authority; Owner: -
--

SELECT pg_catalog.setval('authority.person_person_id_seq', 1, false);


--
-- Name: role_role_id_seq; Type: SEQUENCE SET; Schema: authority; Owner: -
--

SELECT pg_catalog.setval('authority.role_role_id_seq', 24, true);


--
-- PostgreSQL database dump complete
--

\unrestrict 6UGklaDSaRXLeoMnjmnB8ZO5C9ABqu8EN64UigT6bBRW93GjXLtTH3qf6FPLofJ

