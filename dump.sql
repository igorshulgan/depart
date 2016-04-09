--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.1
-- Dumped by pg_dump version 9.5.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: addnewrequest(integer, integer, integer, numeric, character varying, character varying, numeric); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION addnewrequest(a_user integer, a_num integer, a_hours integer, a_cost numeric, a_name character varying, a_type character varying, a_budget numeric) RETURNS integer
    LANGUAGE plpgsql
    AS $$
BEGIN
	BEGIN
		INSERT INTO user_request (user_id, num_stud, hours, cost, name_st,
		 type_st, budget)
		 VALUES(a_user, a_num, a_hours, a_cost, a_name,
		 a_type, a_budget);
	EXCEPTION
		WHEN unique_violation THEN
			return 0;
	END;
	return 1;
END;
$$;


ALTER FUNCTION public.addnewrequest(a_user integer, a_num integer, a_hours integer, a_cost numeric, a_name character varying, a_type character varying, a_budget numeric) OWNER TO postgres;

--
-- Name: addnewrequest(integer, integer, integer, numeric, character varying, character varying, character varying, numeric); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION addnewrequest(a_user integer, a_num integer, a_hours integer, a_cost numeric, a_comp character varying, a_name character varying, a_type character varying, a_budget numeric) RETURNS integer
    LANGUAGE plpgsql
    AS $$
BEGIN
	BEGIN
		INSERT INTO user_request (user_id, num_stud, hours, comp_name, cost, name_st,
		 type_st, budget)
		 VALUES(a_user, a_num, a_hours,a_comp, a_cost, a_name,
		 a_type, a_budget);
	EXCEPTION
		WHEN unique_violation THEN
			return 0;
	END;
	return 1;
END;
$$;


ALTER FUNCTION public.addnewrequest(a_user integer, a_num integer, a_hours integer, a_cost numeric, a_comp character varying, a_name character varying, a_type character varying, a_budget numeric) OWNER TO postgres;

--
-- Name: adduser(character varying, character varying, character varying, character varying, integer, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION adduser(a_name character varying, a_surname character varying, a_secondname character varying, a_role character varying, a_department integer, a_login character varying, a_password character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
BEGIN
	BEGIN
		INSERT INTO users (name, surname, secondname, role, department,
		 login, password)
		 VALUES(a_name, a_surname, a_secondname, a_role, a_department,
		 a_login, a_password);
	EXCEPTION
		WHEN unique_violation THEN
			return 0;
	END;
	return 1;
END;
$$;


ALTER FUNCTION public.adduser(a_name character varying, a_surname character varying, a_secondname character varying, a_role character varying, a_department integer, a_login character varying, a_password character varying) OWNER TO postgres;

--
-- Name: adduserstud(integer, integer, integer, numeric, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION adduserstud(a_user integer, a_num integer, a_hours integer, a_cost numeric, a_name character varying, a_type character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
BEGIN
	BEGIN
		INSERT INTO user_studies (user_id, num_stud, hours, cost, name_st,
		 type_st)
		 VALUES(a_user, a_num, a_hours, a_cost, a_name,
		 a_type);
	EXCEPTION
		WHEN unique_violation THEN
			return 0;
	END;
	return 1;
END;
$$;


ALTER FUNCTION public.adduserstud(a_user integer, a_num integer, a_hours integer, a_cost numeric, a_name character varying, a_type character varying) OWNER TO postgres;

--
-- Name: movestud(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION movestud(a_id integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
	ans integer;
BEGIN
	 ans = (SELECT * FROM adduserstud((SELECT user_id FROM user_request WHERE a_id = id),
	 (SELECT num_stud FROM user_request WHERE a_id = id),
	 (SELECT hours FROM user_request WHERE a_id = id),
	 (SELECT cost FROM user_request WHERE a_id = id),
	 (SELECT name_st FROM user_request WHERE a_id = id),
	 (SELECT type_st FROM user_request WHERE a_id = id)));
	 IF (ans = 1) THEN
		DELETE FROM user_request WHERE id = a_id;
	 END IF;

	 return ans;
	
END;
$$;


ALTER FUNCTION public.movestud(a_id integer) OWNER TO postgres;

--
-- Name: newdepart(character varying, numeric); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION newdepart(a_name character varying, a_budget numeric) RETURNS integer
    LANGUAGE plpgsql
    AS $$
BEGIN
	BEGIN
		INSERT INTO department (name, budget)
		 VALUES(a_name, a_budget);
	EXCEPTION
		WHEN unique_violation THEN
			return 0;
	END;
	return 1;
END;
$$;


ALTER FUNCTION public.newdepart(a_name character varying, a_budget numeric) OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: department; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE department (
    id integer NOT NULL,
    name character varying(100),
    budget numeric
);


ALTER TABLE department OWNER TO postgres;

--
-- Name: department_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE department_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE department_id_seq OWNER TO postgres;

--
-- Name: department_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE department_id_seq OWNED BY department.id;


--
-- Name: documents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE documents (
    id integer NOT NULL,
    name character varying(255),
    hours integer
);


ALTER TABLE documents OWNER TO postgres;

--
-- Name: documents_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE documents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE documents_id_seq OWNER TO postgres;

--
-- Name: documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE documents_id_seq OWNED BY documents.id;


--
-- Name: user_request; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE user_request (
    id integer NOT NULL,
    user_id integer,
    num_stud integer,
    doc_id integer,
    type_st character varying(12),
    name_st character varying(255),
    budget_amount numeric,
    cost numeric,
    hours integer,
    budget numeric,
    comp_name character varying(100)
);


ALTER TABLE user_request OWNER TO postgres;

--
-- Name: user_request_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE user_request_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_request_id_seq OWNER TO postgres;

--
-- Name: user_request_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE user_request_id_seq OWNED BY user_request.id;


--
-- Name: user_studies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE user_studies (
    id integer NOT NULL,
    user_id integer,
    num_stud integer,
    doc_id integer,
    type_st character varying(12),
    name_st character varying(255),
    budget_amount numeric,
    cost numeric,
    hours integer
);


ALTER TABLE user_studies OWNER TO postgres;

--
-- Name: user_studies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE user_studies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_studies_id_seq OWNER TO postgres;

--
-- Name: user_studies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE user_studies_id_seq OWNED BY user_studies.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE users (
    id integer NOT NULL,
    password character varying(255),
    login character varying(255),
    num_id integer,
    name character varying(255),
    surname character varying(255),
    secondname character varying(255),
    role character varying(50),
    department integer
);


ALTER TABLE users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY department ALTER COLUMN id SET DEFAULT nextval('department_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY documents ALTER COLUMN id SET DEFAULT nextval('documents_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_request ALTER COLUMN id SET DEFAULT nextval('user_request_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_studies ALTER COLUMN id SET DEFAULT nextval('user_studies_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: department; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY department (id, name, budget) FROM stdin;
1	Cycling Department	1000
\.


--
-- Name: department_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('department_id_seq', 1, true);


--
-- Data for Name: documents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY documents (id, name, hours) FROM stdin;
\.


--
-- Name: documents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('documents_id_seq', 1, false);


--
-- Data for Name: user_request; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY user_request (id, user_id, num_stud, doc_id, type_st, name_st, budget_amount, cost, hours, budget, comp_name) FROM stdin;
4	13	202	\N	pdf	sdsdf	\N	-0.17	-15	-0.19	sdfsd
\.


--
-- Name: user_request_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('user_request_id_seq', 4, true);


--
-- Data for Name: user_studies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY user_studies (id, user_id, num_stud, doc_id, type_st, name_st, budget_amount, cost, hours) FROM stdin;
4	1	-10233	\N	123	gdfg	\N	-0.18	111
7	1	-10233	\N	123	gdfg	\N	-0.18	111
8	\N	\N	\N	\N	\N	\N	\N	\N
9	1	12	\N	dfg	dog	\N	-0.22	-13
10	\N	\N	\N	dfgdfg	\N	\N	\N	\N
\.


--
-- Name: user_studies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('user_studies_id_seq', 10, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users (id, password, login, num_id, name, surname, secondname, role, department) FROM stdin;
48	dd97813dd40be87559aaefed642c3fbb	igor	\N	Igor	Shulgan		manager	\N
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_id_seq', 48, true);


--
-- Name: department_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY department
    ADD CONSTRAINT department_pkey PRIMARY KEY (id);


--
-- Name: documents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY documents
    ADD CONSTRAINT documents_pkey PRIMARY KEY (id);


--
-- Name: user_request_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_request
    ADD CONSTRAINT user_request_pkey PRIMARY KEY (id);


--
-- Name: user_studies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_studies
    ADD CONSTRAINT user_studies_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users_department_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_department_fkey FOREIGN KEY (department) REFERENCES department(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

