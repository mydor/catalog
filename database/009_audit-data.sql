--
-- PostgreSQL database dump
--

\restrict KqGCpF3YhmhCg9D1aPQTADhxy9s8AXEplBUFbHMg5rbcRMu46l4JCWpoHkCSw2Z

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
-- Data for Name: audit_log; Type: TABLE DATA; Schema: audit; Owner: -
--

COPY audit.audit_log (audit_log_id, schema_name, table_name, record_id, operation, changed_at, changed_by, old_data, new_data) FROM stdin;
\.


--
-- Data for Name: domain_event; Type: TABLE DATA; Schema: audit; Owner: -
--

COPY audit.domain_event (domain_event_id, aggregate_type, aggregate_id, event_type, event_timestamp, event_payload) FROM stdin;
\.


--
-- Data for Name: user_activity; Type: TABLE DATA; Schema: audit; Owner: -
--

COPY audit.user_activity (user_activity_id, user_id, activity_type, activity_timestamp, activity_data) FROM stdin;
\.


--
-- Name: audit_log_audit_log_id_seq; Type: SEQUENCE SET; Schema: audit; Owner: -
--

SELECT pg_catalog.setval('audit.audit_log_audit_log_id_seq', 1, false);


--
-- Name: domain_event_domain_event_id_seq; Type: SEQUENCE SET; Schema: audit; Owner: -
--

SELECT pg_catalog.setval('audit.domain_event_domain_event_id_seq', 1, false);


--
-- Name: user_activity_user_activity_id_seq; Type: SEQUENCE SET; Schema: audit; Owner: -
--

SELECT pg_catalog.setval('audit.user_activity_user_activity_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

\unrestrict KqGCpF3YhmhCg9D1aPQTADhxy9s8AXEplBUFbHMg5rbcRMu46l4JCWpoHkCSw2Z

