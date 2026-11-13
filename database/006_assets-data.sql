--
-- PostgreSQL database dump
--

\restrict gxxHr474RbQe0loY2xJoa1ksIuBSpYeZMX8xKCHQBUdsbWTvGOFeoq0c4BGDQY0

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
-- Data for Name: media_asset; Type: TABLE DATA; Schema: assets; Owner: -
--

COPY assets.media_asset (media_asset_id, user_id, copy_id, release_id, media_asset_type_id, asset_name, description, created_at) FROM stdin;
\.


--
-- Data for Name: media_asset_ocr; Type: TABLE DATA; Schema: assets; Owner: -
--

COPY assets.media_asset_ocr (media_asset_ocr_id, media_asset_version_id, extraction_engine, extraction_date, extracted_text) FROM stdin;
\.


--
-- Data for Name: media_asset_tag; Type: TABLE DATA; Schema: assets; Owner: -
--

COPY assets.media_asset_tag (media_asset_id, collection_tag_id) FROM stdin;
\.


--
-- Data for Name: media_asset_type; Type: TABLE DATA; Schema: assets; Owner: -
--

COPY assets.media_asset_type (media_asset_type_id, type_code, type_name, description) FROM stdin;
1	COVER_FRONT	Front Cover	\N
2	COVER_BACK	Back Cover	\N
3	SPINE	Spine	\N
4	RECEIPT	Receipt	\N
5	MANUAL	Manual	\N
6	PHOTO	Photo	\N
7	WARRANTY	Warranty	\N
8	INSURANCE_DOCUMENT	Insurance Document	\N
\.


--
-- Data for Name: media_asset_version; Type: TABLE DATA; Schema: assets; Owner: -
--

COPY assets.media_asset_version (media_asset_version_id, media_asset_id, version_number, file_name, mime_type, file_size_bytes, storage_uri, checksum_sha256, uploaded_at) FROM stdin;
\.


--
-- Name: media_asset_media_asset_id_seq; Type: SEQUENCE SET; Schema: assets; Owner: -
--

SELECT pg_catalog.setval('assets.media_asset_media_asset_id_seq', 1, false);


--
-- Name: media_asset_ocr_media_asset_ocr_id_seq; Type: SEQUENCE SET; Schema: assets; Owner: -
--

SELECT pg_catalog.setval('assets.media_asset_ocr_media_asset_ocr_id_seq', 1, false);


--
-- Name: media_asset_type_media_asset_type_id_seq; Type: SEQUENCE SET; Schema: assets; Owner: -
--

SELECT pg_catalog.setval('assets.media_asset_type_media_asset_type_id_seq', 8, true);


--
-- Name: media_asset_version_media_asset_version_id_seq; Type: SEQUENCE SET; Schema: assets; Owner: -
--

SELECT pg_catalog.setval('assets.media_asset_version_media_asset_version_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

\unrestrict gxxHr474RbQe0loY2xJoa1ksIuBSpYeZMX8xKCHQBUdsbWTvGOFeoq0c4BGDQY0

