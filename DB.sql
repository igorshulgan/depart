--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.1
-- Dumped by pg_dump version 9.5.1

-- Started on 2016-04-05 22:32:37 MSK

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

--
-- TOC entry 2404 (class 0 OID 16536)
-- Dependencies: 186
-- Data for Name: documents; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2419 (class 0 OID 0)
-- Dependencies: 185
-- Name: documents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('documents_id_seq', 1, false);


--
-- TOC entry 2406 (class 0 OID 16568)
-- Dependencies: 188
-- Data for Name: user_request; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO user_request (id, user_id, num_stud, doc_id, type_st, name_st, budget_amount, cost, hours, budget) VALUES (1, 1, -10233, NULL, '123', 'gdfg', NULL, -0.18, 111, -0.17);


--
-- TOC entry 2420 (class 0 OID 0)
-- Dependencies: 187
-- Name: user_request_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('user_request_id_seq', 1, true);


--
-- TOC entry 2402 (class 0 OID 16520)
-- Dependencies: 184
-- Data for Name: user_studies; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2421 (class 0 OID 0)
-- Dependencies: 183
-- Name: user_studies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('user_studies_id_seq', 1, true);


--
-- TOC entry 2400 (class 0 OID 16509)
-- Dependencies: 182
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO users (id, password, login, num_id, name, surname, secondname, department, role) VALUES (48, 'dd97813dd40be87559aaefed642c3fbb', 'igor', NULL, 'Igor', 'Shulgan', '', 'Cycling Department', 'manager');


--
-- TOC entry 2422 (class 0 OID 0)
-- Dependencies: 181
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_id_seq', 48, true);


-- Completed on 2016-04-05 22:32:37 MSK

--
-- PostgreSQL database dump complete
--

