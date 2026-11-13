--
-- PostgreSQL database dump
--

\restrict gt8hXuIz3yYym5fNB9ZvEVjgZXwjkhG8ZJZa3SWAAybbYaBnQO6V2ulfM1AHPPB

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
-- Data for Name: ai_enrichment; Type: TABLE DATA; Schema: ai; Owner: -
--

COPY ai.ai_enrichment (ai_enrichment_id, release_id, enrichment_type, enrichment_text, model_name, confidence_score, generated_at) FROM stdin;
\.


--
-- Data for Name: recommendation_cache; Type: TABLE DATA; Schema: ai; Owner: -
--

COPY ai.recommendation_cache (recommendation_cache_id, recommendation_model_id, source_release_id, recommended_release_id, recommendation_score, generated_at) FROM stdin;
\.


--
-- Data for Name: recommendation_model; Type: TABLE DATA; Schema: ai; Owner: -
--

COPY ai.recommendation_model (recommendation_model_id, model_code, model_name, model_version, description, created_at) FROM stdin;
\.


--
-- Data for Name: release_embedding; Type: TABLE DATA; Schema: ai; Owner: -
--

COPY ai.release_embedding (release_embedding_id, release_id, model_name, embedding, generated_at) FROM stdin;
\.


--
-- Data for Name: release_semantic_tag; Type: TABLE DATA; Schema: ai; Owner: -
--

COPY ai.release_semantic_tag (release_id, semantic_tag_id, confidence_score) FROM stdin;
\.


--
-- Data for Name: user_interaction_event; Type: TABLE DATA; Schema: ai; Owner: -
--

COPY ai.user_interaction_event (user_interaction_event_id, user_id, release_id, copy_id, event_type, event_timestamp, event_data) FROM stdin;
\.


--
-- Name: ai_enrichment_ai_enrichment_id_seq; Type: SEQUENCE SET; Schema: ai; Owner: -
--

SELECT pg_catalog.setval('ai.ai_enrichment_ai_enrichment_id_seq', 1, false);


--
-- Name: recommendation_cache_recommendation_cache_id_seq; Type: SEQUENCE SET; Schema: ai; Owner: -
--

SELECT pg_catalog.setval('ai.recommendation_cache_recommendation_cache_id_seq', 1, false);


--
-- Name: recommendation_model_recommendation_model_id_seq; Type: SEQUENCE SET; Schema: ai; Owner: -
--

SELECT pg_catalog.setval('ai.recommendation_model_recommendation_model_id_seq', 1, false);


--
-- Name: release_embedding_release_embedding_id_seq; Type: SEQUENCE SET; Schema: ai; Owner: -
--

SELECT pg_catalog.setval('ai.release_embedding_release_embedding_id_seq', 1, false);


--
-- Name: user_interaction_event_user_interaction_event_id_seq; Type: SEQUENCE SET; Schema: ai; Owner: -
--

SELECT pg_catalog.setval('ai.user_interaction_event_user_interaction_event_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

\unrestrict gt8hXuIz3yYym5fNB9ZvEVjgZXwjkhG8ZJZa3SWAAybbYaBnQO6V2ulfM1AHPPB

