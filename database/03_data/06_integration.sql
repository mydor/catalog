--
-- PostgreSQL database dump
--

\restrict 0Vt5r0lgQ4Z33zHaIhGZoBjpw7BxpyW9FdsGJzHcrIEWiLFCAfrDzXukU0hdy7I

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
-- Data for Name: barcode_lookup_cache; Type: TABLE DATA; Schema: integration; Owner: -
--

COPY integration.barcode_lookup_cache (barcode_lookup_cache_id, barcode_value, metadata_provider_id, cached_response, cached_at, expires_at) FROM stdin;
\.


--
-- Data for Name: external_metadata_mapping; Type: TABLE DATA; Schema: integration; Owner: -
--

COPY integration.external_metadata_mapping (external_metadata_mapping_id, metadata_provider_id, release_id, work_id, external_identifier, metadata_url, last_sync_at) FROM stdin;
\.


--
-- Data for Name: import_mapping; Type: TABLE DATA; Schema: integration; Owner: -
--

COPY integration.import_mapping (import_mapping_id, source_system, source_record_id, release_id, copy_id, imported_at) FROM stdin;
\.


--
-- Data for Name: metadata_provider; Type: TABLE DATA; Schema: integration; Owner: -
--

COPY integration.metadata_provider (metadata_provider_id, provider_code, provider_name, provider_url, is_active) FROM stdin;
\.


--
-- Data for Name: sync_job; Type: TABLE DATA; Schema: integration; Owner: -
--

COPY integration.sync_job (sync_job_id, metadata_provider_id, started_at, completed_at, status, records_processed, records_updated, error_count) FROM stdin;
\.


--
-- Data for Name: sync_log; Type: TABLE DATA; Schema: integration; Owner: -
--

COPY integration.sync_log (sync_log_id, sync_job_id, log_timestamp, severity, message) FROM stdin;
\.


--
-- Name: barcode_lookup_cache_barcode_lookup_cache_id_seq; Type: SEQUENCE SET; Schema: integration; Owner: -
--

SELECT pg_catalog.setval('integration.barcode_lookup_cache_barcode_lookup_cache_id_seq', 1, false);


--
-- Name: external_metadata_mapping_external_metadata_mapping_id_seq; Type: SEQUENCE SET; Schema: integration; Owner: -
--

SELECT pg_catalog.setval('integration.external_metadata_mapping_external_metadata_mapping_id_seq', 1, false);


--
-- Name: import_mapping_import_mapping_id_seq; Type: SEQUENCE SET; Schema: integration; Owner: -
--

SELECT pg_catalog.setval('integration.import_mapping_import_mapping_id_seq', 1, false);


--
-- Name: metadata_provider_metadata_provider_id_seq; Type: SEQUENCE SET; Schema: integration; Owner: -
--

SELECT pg_catalog.setval('integration.metadata_provider_metadata_provider_id_seq', 1, false);


--
-- Name: sync_job_sync_job_id_seq; Type: SEQUENCE SET; Schema: integration; Owner: -
--

SELECT pg_catalog.setval('integration.sync_job_sync_job_id_seq', 1, false);


--
-- Name: sync_log_sync_log_id_seq; Type: SEQUENCE SET; Schema: integration; Owner: -
--

SELECT pg_catalog.setval('integration.sync_log_sync_log_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

\unrestrict 0Vt5r0lgQ4Z33zHaIhGZoBjpw7BxpyW9FdsGJzHcrIEWiLFCAfrDzXukU0hdy7I

