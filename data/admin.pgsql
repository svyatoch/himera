--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.14
-- Dumped by pg_dump version 10.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
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


--
-- Name: himera_menus_myid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.himera_menus_myid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1;


ALTER TABLE public.himera_menus_myid_seq OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: himera_menus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.himera_menus (
    id integer DEFAULT nextval('public.himera_menus_myid_seq'::regclass) NOT NULL,
    parent_id integer DEFAULT 0 NOT NULL,
    type integer DEFAULT 0,
    "order" integer DEFAULT 0 NOT NULL,
    title character varying(50) NOT NULL,
    header character varying(100),
    plugin_name character varying(100) NOT NULL,
    icon character varying(50) NOT NULL,
    uri character varying(3000) NOT NULL,
    uuid character varying(100),
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.himera_menus OWNER TO postgres;

--
-- Name: himera_operation_logs_myid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.himera_operation_logs_myid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1;


ALTER TABLE public.himera_operation_logs_myid_seq OWNER TO postgres;

--
-- Name: himera_operation_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.himera_operation_logs (
    id integer DEFAULT nextval('public.himera_operation_logs_myid_seq'::regclass) NOT NULL,
    user_id integer NOT NULL,
    path character varying(255) NOT NULL,
    method character varying(10) NOT NULL,
    ip character varying(15) NOT NULL,
    input text NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.himera_operation_logs OWNER TO postgres;

--
-- Name: himera_sites_myid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.himera_sites_myid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1;


ALTER TABLE public.himera_sites_myid_seq OWNER TO postgres;

--
-- Name: himera_sites; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.himera_sites (
    id integer DEFAULT nextval('public.himera_sites_myid_seq'::regclass) NOT NULL,
    key character varying(100) NOT NULL,
    value text NOT NULL,
    type integer DEFAULT 0,
    description character varying(3000),
    state integer DEFAULT 0,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.himera_sites OWNER TO postgres;

--
-- Name: himera_permissions_myid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.himera_permissions_myid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1;


ALTER TABLE public.himera_permissions_myid_seq OWNER TO postgres;

--
-- Name: himera_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.himera_permissions (
    id integer DEFAULT nextval('public.himera_permissions_myid_seq'::regclass) NOT NULL,
    name character varying(50) NOT NULL,
    slug character varying(50) NOT NULL,
    http_method character varying(255),
    http_path text NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.himera_permissions OWNER TO postgres;

--
-- Name: himera_role_menus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.himera_role_menus (
    role_id integer NOT NULL,
    menu_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.himera_role_menus OWNER TO postgres;

--
-- Name: himera_role_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.himera_role_permissions (
    role_id integer NOT NULL,
    permission_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.himera_role_permissions OWNER TO postgres;

--
-- Name: himera_role_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.himera_role_users (
    role_id integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.himera_role_users OWNER TO postgres;

--
-- Name: himera_roles_myid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.himera_roles_myid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1;


ALTER TABLE public.himera_roles_myid_seq OWNER TO postgres;

--
-- Name: himera_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.himera_roles (
    id integer DEFAULT nextval('public.himera_roles_myid_seq'::regclass) NOT NULL,
    name character varying NOT NULL,
    slug character varying NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.himera_roles OWNER TO postgres;

--
-- Name: himera_sessions_myid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.himera_sessions_myid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1;


ALTER TABLE public.himera_sessions_myid_seq OWNER TO postgres;

--
-- Name: himera_sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.himera_sessions (
    id integer DEFAULT nextval('public.himera_sessions_myid_seq'::regclass) NOT NULL,
    sid character varying(50) NOT NULL,
    "values" character varying(3000) NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.himera_sessions OWNER TO postgres;

--
-- Name: himera_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.himera_user_permissions (
    user_id integer NOT NULL,
    permission_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.himera_user_permissions OWNER TO postgres;

--
-- Name: himera_users_myid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.himera_users_myid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1;


ALTER TABLE public.himera_users_myid_seq OWNER TO postgres;

--
-- Name: himera_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.himera_users (
    id integer DEFAULT nextval('public.himera_users_myid_seq'::regclass) NOT NULL,
    username character varying(100) NOT NULL,
    password character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    avatar character varying(255),
    remember_token character varying(100),
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.himera_users OWNER TO postgres;

--
-- Data for Name: himera_menus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.himera_menus (id, parent_id, type, "order", title, plugin_name, header, icon, uri, created_at, updated_at) FROM stdin;
1	0	1	2	Admin		\N	fa-tasks		2019-09-10 00:00:00	2019-09-10 00:00:00
2	1	1	2	Users		\N	fa-users	/info/manager	2019-09-10 00:00:00	2019-09-10 00:00:00
3	1	1	3	Roles		\N	fa-user	/info/roles	2019-09-10 00:00:00	2019-09-10 00:00:00
4	1	1	4	Permission		\N	fa-ban	/info/permission	2019-09-10 00:00:00	2019-09-10 00:00:00
5	1	1	5	Menu		\N	fa-bars	/menu	2019-09-10 00:00:00	2019-09-10 00:00:00
6	1	1	6	Operation log		\N	fa-history	/info/op	2019-09-10 00:00:00	2019-09-10 00:00:00
7	0	1	1	Dashboard		\N	fa-bar-chart	/	2019-09-10 00:00:00	2019-09-10 00:00:00
\.


--
-- Data for Name: himera_operation_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.himera_operation_logs (id, user_id, path, method, ip, input, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: himera_sites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.himera_sites (id, key, value, description, state, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: himera_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.himera_permissions (id, name, slug, http_method, http_path, created_at, updated_at) FROM stdin;
1	All permission	*		*	2019-09-10 00:00:00	2019-09-10 00:00:00
2	Dashboard	dashboard	GET,PUT,POST,DELETE	/	2019-09-10 00:00:00	2019-09-10 00:00:00
\.


--
-- Data for Name: himera_role_menus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.himera_role_menus (role_id, menu_id, created_at, updated_at) FROM stdin;
1	1	2019-09-10 00:00:00	2019-09-10 00:00:00
1	7	2019-09-10 00:00:00	2019-09-10 00:00:00
2	7	2019-09-10 00:00:00	2019-09-10 00:00:00
\.


--
-- Data for Name: himera_role_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.himera_role_permissions (role_id, permission_id, created_at, updated_at) FROM stdin;
1	1	2019-09-10 00:00:00	2019-09-10 00:00:00
1	2	2019-09-10 00:00:00	2019-09-10 00:00:00
2	2	2019-09-10 00:00:00	2019-09-10 00:00:00
0	3	\N	\N
0	3	\N	\N
0	3	\N	\N
0	3	\N	\N
0	3	\N	\N
0	3	\N	\N
0	3	\N	\N
0	3	\N	\N
0	3	\N	\N
0	3	\N	\N
0	3	\N	\N
0	3	\N	\N
0	3	\N	\N
0	3	\N	\N
0	3	\N	\N
0	3	\N	\N
\.


--
-- Data for Name: himera_role_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.himera_role_users (role_id, user_id, created_at, updated_at) FROM stdin;
1	1	2019-09-10 00:00:00	2019-09-10 00:00:00
2	2	2019-09-10 00:00:00	2019-09-10 00:00:00
\.


--
-- Data for Name: himera_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.himera_roles (id, name, slug, created_at, updated_at) FROM stdin;
1	Administrator	administrator	2019-09-10 00:00:00	2019-09-10 00:00:00
2	Operator	operator	2019-09-10 00:00:00	2019-09-10 00:00:00
\.


--
-- Data for Name: himera_sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.himera_sessions (id, sid, "values", created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: himera_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.himera_user_permissions (user_id, permission_id, created_at, updated_at) FROM stdin;
1	1	2019-09-10 00:00:00	2019-09-10 00:00:00
2	2	2019-09-10 00:00:00	2019-09-10 00:00:00
0	1	\N	\N
0	1	\N	\N
0	1	\N	\N
0	1	\N	\N
0	1	\N	\N
0	1	\N	\N
0	1	\N	\N
0	1	\N	\N
0	1	\N	\N
0	1	\N	\N
0	1	\N	\N
0	1	\N	\N
0	1	\N	\N
0	1	\N	\N
0	1	\N	\N
0	1	\N	\N
\.


--
-- Data for Name: himera_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.himera_users (id, username, password, name, avatar, remember_token, created_at, updated_at) FROM stdin;
1	admin	$2a$10$OxWYJJGTP2gi00l2x06QuOWqw5VR47MQCJ0vNKnbMYfrutij10Hwe	admin		tlNcBVK9AvfYH7WEnwB1RKvocJu8FfRy4um3DJtwdHuJy0dwFsLOgAc0xUfh	2019-09-10 00:00:00	2019-09-10 00:00:00
2	operator	$2a$10$rVqkOzHjN2MdlEprRflb1eGP0oZXuSrbJLOmJagFsCd81YZm0bsh.	Operator		\N	2019-09-10 00:00:00	2019-09-10 00:00:00
\.


--
-- Name: himera_menus_myid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.himera_menus_myid_seq', 7, true);


--
-- Name: himera_operation_logs_myid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.himera_operation_logs_myid_seq', 1, true);


--
-- Name: himera_permissions_myid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.himera_permissions_myid_seq', 2, true);


--
-- Name: himera_roles_myid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.himera_roles_myid_seq', 2, true);


--
-- Name: himera_sites_myid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.himera_sites_myid_seq', 1, true);


--
-- Name: himera_sessions_myid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.himera_sessions_myid_seq', 1, true);


--
-- Name: himera_users_myid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.himera_users_myid_seq', 2, true);


--
-- Name: himera_menus himera_menus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.himera_menus
    ADD CONSTRAINT himera_menus_pkey PRIMARY KEY (id);


--
-- Name: himera_operation_logs himera_operation_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.himera_operation_logs
    ADD CONSTRAINT himera_operation_logs_pkey PRIMARY KEY (id);


--
-- Name: himera_permissions himera_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.himera_permissions
    ADD CONSTRAINT himera_permissions_pkey PRIMARY KEY (id);


--
-- Name: himera_roles himera_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.himera_roles
    ADD CONSTRAINT himera_roles_pkey PRIMARY KEY (id);


--
-- Name: himera_sites himera_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.himera_sites
    ADD CONSTRAINT himera_sites_pkey PRIMARY KEY (id);


--
-- Name: himera_sessions himera_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.himera_sessions
    ADD CONSTRAINT himera_sessions_pkey PRIMARY KEY (id);


--
-- Name: himera_users himera_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.himera_users
    ADD CONSTRAINT himera_users_pkey PRIMARY KEY (id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

