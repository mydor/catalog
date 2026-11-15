--
-- PostgreSQL database dump
--

\restrict zDBHirfRCg1m7RFwKX29PQ7ZXvDTLA9HBnbTaXf92EwcU6cnNRzpkfi30bs04b4

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
-- Data for Name: age_rating; Type: TABLE DATA; Schema: catalog; Owner: -
--

COPY catalog.age_rating (age_rating_id, rating_system, rating_code, rating_name, description, minimum_age) FROM stdin;
1	MPAA	G	General audiences	All ages	0
2	MPAA	PG	Parental guidence suggested	Some material may not be suitable for children	0
3	MPAA	PG-13	Parents strongly cautioned	Some material may be inappropriate for children under 13	13
4	MPAA	R	Restricted	Under 17 required adult guardian	17
5	MPAA	NC-17	Adults only	No one 17 and under allowed	18
6	TVPG	TV-Y	Young audiances	Appropriage for all children	0
7	TVPG	TV-Y7	Children 7 and up	Designed for children age 7 and above	7
8	TVPG	TV-G	General audiences	Generally suitable for all ages	0
9	TVPG	TV-PG	Parental guidence suggested	Some material may not be suitable for children	0
10	TVPG	TV-14	Parent strongly cautioned	Material may be inappropriate for children under 14	14
11	TVPG	TV-MA	Adults only	Unsutable for children under 17	18
12	ESRB	E	Everyone	Generally suitable for all ages	0
13	ESRB	E10+	Everyone 10+	Generally suitable for ages 10 and up	10
14	ESRB	T	Teen	Generally suitable for ages 13 and up	13
15	ESRB	M	Mature	Generally suitable for ages 17 and up	17
16	ESRB	AO	Adults Only 18+	Only suitable for adults ages 18 and up	18
17	ESRB	RP	Rating Pending	Not yet assigned a final ESRB rating	0
18	PEGI	PEGI 3	Everyone	Suitable for all age groups	3
19	PEGI	PEGI 7	Children 7 and up	Possibly frightening to younger children under 7	7
20	PEGI	PEGI 12	Children 12 and up	Violence, sexual innuendo, or mild language, not suitable for children under 12	12
21	PEGI	PEGI 16	Children 16 and up	Violence, sexual activity, more extreme language, or use of tabacco/alcohol/drugs, not suitable for children under 16	16
22	PEGI	PEGI 18	Adults only	Extreme violence, explicit sexual activity, simulated gambling, or glamorisation of drugs, not suitable for anyone under 18	18
23	PEGI	PEGI !	Parental Guidance Recommended	Contains user generated or curated content	0
\.


--
-- Data for Name: book_release; Type: TABLE DATA; Schema: catalog; Owner: -
--

COPY catalog.book_release (release_id, book_format_id) FROM stdin;
\.


--
-- Data for Name: content_item; Type: TABLE DATA; Schema: catalog; Owner: -
--

COPY catalog.content_item (content_item_id, work_id, title, content_type, page_count, runtime_minutes, sequence_number, notes) FROM stdin;
\.


--
-- Data for Name: game_release; Type: TABLE DATA; Schema: catalog; Owner: -
--

COPY catalog.game_release (release_id, game_type_id, players_min, players_max, play_time_min, play_time_max) FROM stdin;
\.


--
-- Data for Name: genre; Type: TABLE DATA; Schema: catalog; Owner: -
--

COPY catalog.genre (genre_id, parent_genre_id, genre_name, description) FROM stdin;
\.


--
-- Data for Name: identifier_type; Type: TABLE DATA; Schema: catalog; Owner: -
--

COPY catalog.identifier_type (identifier_type_id, identifier_code, identifier_name, validation_regex) FROM stdin;
1	ISBN	International Standard Book Number	\N
2	UPC	Universal Product Code	\N
3	EAN	European Article Number	\N
4	GTIN	Global Trade Item Number	\N
5	ISSN	International Standard Serial Number	\N
6	ISMN	International Standard Music Number	\N
7	JAN	Japanese Article Number	\N
8	SERIAL_NUMBER	Serial Number	\N
9	ASIN	Amazon Standard Identification Number	\N
\.


--
-- Data for Name: lookup_table; Type: TABLE DATA; Schema: catalog; Owner: -
--

COPY catalog.lookup_table (lookup_id, code, name, description) FROM stdin;
\.


--
-- Data for Name: media_format; Type: TABLE DATA; Schema: catalog; Owner: -
--

COPY catalog.media_format (media_format_id, media_category, format_code, format_name, description) FROM stdin;
1	MOVIE	BETA	Beta Tape	\N
2	MOVIE	VHS	VHS Tape	\N
3	MOVIE	LASERDISC	Laser Disc	\N
4	MOVIE	DVD	DVD Disc	\N
5	MOVIE	BLURAY	BluRay Disc	\N
6	MOVIE	UHD_4K	4K Ultra High Definition	\N
7	MUSIC	8TRACK	8 Track Tape	\N
8	MUSIC	VINYL LP	Vinyl 12 Long Play 33 1/3RPM	\N
9	MUSIC	VINYL EP	Vinyl 10 Extended Play 45RPM	\N
10	MUSIC	VINYL SP	Vinyl 7 Standard Play 45RPM	\N
11	MUSIC	CASSETTE	Cassette Tape	\N
12	MUSIC	CD	Compact Disc	\N
13	MUSIC	SACD	Super Audio Compact Disc	\N
14	MUSIC	DVD-AUDIO	DVD Audio Disc	\N
15	MUSIC	BLUSPEC-CD	Blu-spec Compact Disc	\N
16	BOOK	HARDCOVER	Hardcover Book	\N
17	BOOK	PAPERBACK	Paperback Book	\N
18	BOOK	AUDIOBOOK-CD	Compact Disc Audio Book	\N
19	GAME	CARTRIDGE	Game Cartridge	\N
20	GAME	DISC	Game Disc (CD/DVD/BluRay)	\N
21	GAME	TABLETOP	TableTop Game (Board/Dice/Card/Etc)	\N
22	GAME	EXPAN	Game Expansion	\N
23	GAME	PC	PC Game	\N
24	GAME	XBOX	Xbox Game	\N
25	GAME	XBOX360	Xbox 360 Game	\N
26	GAME	XBOXONE	Xbox One Game	\N
27	GAME	SWITCH	Nintendo Switch Game	\N
28	GAME	SWITCH2	Nintendo Switch 2 Game	\N
29	GAME	WII	Nintendo WII Game	\N
30	GAME	NDS	Nintendo DS Game	\N
31	GAME	NGC	Nintendo Game Cube Game	\N
32	GAME	GBA	Nintendo Game Boy Advanced Game	\N
33	GAME	PSP	Play Station Portable Game	\N
34	GAME	PS1	Play Station Game	\N
35	GAME	PS2	Play Station 2 Game	\N
36	GAME	PS3	Play Station 3 Game	\N
37	GAME	PS4	Play Station 4 Game	\N
38	GAME	PS5	Play Station 5 Game	\N
\.


--
-- Data for Name: movie_release; Type: TABLE DATA; Schema: catalog; Owner: -
--

COPY catalog.movie_release (release_id, screen_format_id, movie_format_id) FROM stdin;
\.


--
-- Data for Name: music_release; Type: TABLE DATA; Schema: catalog; Owner: -
--

COPY catalog.music_release (release_id, release_year, disc_count, music_format_id) FROM stdin;
\.


--
-- Data for Name: physical_dimension; Type: TABLE DATA; Schema: catalog; Owner: -
--

COPY catalog.physical_dimension (physical_dimension_id, width_mm, height_mm, depth_mm, weight_g) FROM stdin;
\.


--
-- Data for Name: release; Type: TABLE DATA; Schema: catalog; Owner: -
--

COPY catalog.release (release_id, work_id, physical_dimension_id, release_title, edition, release_year, age_rating_id, release_notes, created_at, updated_at, release_type_id) FROM stdin;
\.


--
-- Data for Name: release_component; Type: TABLE DATA; Schema: catalog; Owner: -
--

COPY catalog.release_component (release_component_id, release_id, media_format_id, component_number, component_name, quantity, notes) FROM stdin;
\.


--
-- Data for Name: release_content; Type: TABLE DATA; Schema: catalog; Owner: -
--

COPY catalog.release_content (release_component_id, content_item_id) FROM stdin;
\.


--
-- Data for Name: release_credit; Type: TABLE DATA; Schema: catalog; Owner: -
--

COPY catalog.release_credit (release_id, contributor_id, role_id, credit_order, notes) FROM stdin;
\.


--
-- Data for Name: release_genre; Type: TABLE DATA; Schema: catalog; Owner: -
--

COPY catalog.release_genre (release_id, genre_id) FROM stdin;
\.


--
-- Data for Name: release_identifier; Type: TABLE DATA; Schema: catalog; Owner: -
--

COPY catalog.release_identifier (release_identifier_id, release_id, identifier_type_id, identifier_value, is_primary) FROM stdin;
\.


--
-- Data for Name: release_type; Type: TABLE DATA; Schema: catalog; Owner: -
--

COPY catalog.release_type (release_type_id, release_type_code, release_type_name) FROM stdin;
1	STANDARD	Standard Edition
2	COLLECTORS	Collector's Edition
3	LIMITED	Limited Edition
4	ANNIVERSARY	Anniversary Edition
5	REMASTERED	Remastered Edition
6	SPECIAL_EDITION	Special Edition
\.


--
-- Data for Name: screen_format; Type: TABLE DATA; Schema: catalog; Owner: -
--

COPY catalog.screen_format (screen_format_id, format_code, format_name) FROM stdin;
1	FULLSCREEN	Full Screen
2	WIDESCREEN	Wide Screen
3	IMAX	IMAX
\.


--
-- Data for Name: series; Type: TABLE DATA; Schema: catalog; Owner: -
--

COPY catalog.series (series_id, parent_series_id, title, sort_title, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: tag; Type: TABLE DATA; Schema: catalog; Owner: -
--

COPY catalog.tag (tag_id, tag_type, tag_name) FROM stdin;
\.


--
-- Data for Name: taxonomy_node; Type: TABLE DATA; Schema: catalog; Owner: -
--

COPY catalog.taxonomy_node (taxonomy_node_id, parent_node_id, node_name, node_type, description) FROM stdin;
\.


--
-- Data for Name: work; Type: TABLE DATA; Schema: catalog; Owner: -
--

COPY catalog.work (work_id, series_id, title, sort_title, part_number, description, original_year, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: work_credit; Type: TABLE DATA; Schema: catalog; Owner: -
--

COPY catalog.work_credit (work_id, contributor_id, role_id, credit_order, notes) FROM stdin;
\.


--
-- Data for Name: work_relationship; Type: TABLE DATA; Schema: catalog; Owner: -
--

COPY catalog.work_relationship (parent_work_id, child_work_id, work_relationship_type_id, sequence_number) FROM stdin;
\.


--
-- Data for Name: work_relationship_type; Type: TABLE DATA; Schema: catalog; Owner: -
--

COPY catalog.work_relationship_type (work_relationship_type_id, relationship_code, relationship_name) FROM stdin;
1	PART_OF	Work belongs to collection
2	CONTAINS	Collection contains work
3	SEQUEL_TO	Sequel
4	PREQUEL_TO	Prequel
5	ADAPTATION_OF	Adaptation
6	SPINOFF_OF	Spinoff
\.


--
-- Data for Name: work_type; Type: TABLE DATA; Schema: catalog; Owner: -
--

COPY catalog.work_type (work_type_id, work_type_code, work_type_name) FROM stdin;
1	BOOK	Books
2	COLLECTION	Collection
3	GAME	Games
4	MOVIE	Movies
5	MUSIC	Music
\.


--
-- Name: age_rating_age_rating_id_seq; Type: SEQUENCE SET; Schema: catalog; Owner: -
--

SELECT pg_catalog.setval('catalog.age_rating_age_rating_id_seq', 23, true);


--
-- Name: content_item_content_item_id_seq; Type: SEQUENCE SET; Schema: catalog; Owner: -
--

SELECT pg_catalog.setval('catalog.content_item_content_item_id_seq', 1, false);


--
-- Name: genre_genre_id_seq; Type: SEQUENCE SET; Schema: catalog; Owner: -
--

SELECT pg_catalog.setval('catalog.genre_genre_id_seq', 1, false);


--
-- Name: identifier_type_identifier_type_id_seq; Type: SEQUENCE SET; Schema: catalog; Owner: -
--

SELECT pg_catalog.setval('catalog.identifier_type_identifier_type_id_seq', 9, true);


--
-- Name: lookup_table_lookup_id_seq; Type: SEQUENCE SET; Schema: catalog; Owner: -
--

SELECT pg_catalog.setval('catalog.lookup_table_lookup_id_seq', 1, false);


--
-- Name: media_format_media_format_id_seq; Type: SEQUENCE SET; Schema: catalog; Owner: -
--

SELECT pg_catalog.setval('catalog.media_format_media_format_id_seq', 38, true);


--
-- Name: physical_dimension_physical_dimension_id_seq; Type: SEQUENCE SET; Schema: catalog; Owner: -
--

SELECT pg_catalog.setval('catalog.physical_dimension_physical_dimension_id_seq', 1, false);


--
-- Name: release_component_release_component_id_seq; Type: SEQUENCE SET; Schema: catalog; Owner: -
--

SELECT pg_catalog.setval('catalog.release_component_release_component_id_seq', 1, false);


--
-- Name: release_identifier_release_identifier_id_seq; Type: SEQUENCE SET; Schema: catalog; Owner: -
--

SELECT pg_catalog.setval('catalog.release_identifier_release_identifier_id_seq', 1, false);


--
-- Name: release_release_id_seq; Type: SEQUENCE SET; Schema: catalog; Owner: -
--

SELECT pg_catalog.setval('catalog.release_release_id_seq', 1, false);


--
-- Name: release_type_release_type_id_seq; Type: SEQUENCE SET; Schema: catalog; Owner: -
--

SELECT pg_catalog.setval('catalog.release_type_release_type_id_seq', 1, false);


--
-- Name: screen_format_screen_format_id_seq; Type: SEQUENCE SET; Schema: catalog; Owner: -
--

SELECT pg_catalog.setval('catalog.screen_format_screen_format_id_seq', 3, true);


--
-- Name: series_series_id_seq; Type: SEQUENCE SET; Schema: catalog; Owner: -
--

SELECT pg_catalog.setval('catalog.series_series_id_seq', 1, false);


--
-- Name: tag_tag_id_seq; Type: SEQUENCE SET; Schema: catalog; Owner: -
--

SELECT pg_catalog.setval('catalog.tag_tag_id_seq', 1, false);


--
-- Name: taxonomy_node_taxonomy_node_id_seq; Type: SEQUENCE SET; Schema: catalog; Owner: -
--

SELECT pg_catalog.setval('catalog.taxonomy_node_taxonomy_node_id_seq', 1, false);


--
-- Name: work_relationship_type_work_relationship_type_id_seq; Type: SEQUENCE SET; Schema: catalog; Owner: -
--

SELECT pg_catalog.setval('catalog.work_relationship_type_work_relationship_type_id_seq', 1, false);


--
-- Name: work_type_work_type_id_seq; Type: SEQUENCE SET; Schema: catalog; Owner: -
--

SELECT pg_catalog.setval('catalog.work_type_work_type_id_seq', 1, false);


--
-- Name: work_work_id_seq; Type: SEQUENCE SET; Schema: catalog; Owner: -
--

SELECT pg_catalog.setval('catalog.work_work_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

\unrestrict zDBHirfRCg1m7RFwKX29PQ7ZXvDTLA9HBnbTaXf92EwcU6cnNRzpkfi30bs04b4

