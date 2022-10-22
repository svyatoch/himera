--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.14
-- Dumped by pg_dump version 10.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'EUC_CN';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: github.com/svyatoch/himera_sites_myid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.github.com/svyatoch/himera_sites_myid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1;

ALTER TABLE public.github.com/svyatoch/himera_sites_myid_seq OWNER TO postgres;

--
-- Name: github.com/svyatoch/himera_sites; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.github.com/svyatoch/himera_sites (
    id integer DEFAULT nextval('public.github.com/svyatoch/himera_sites_myid_seq'::regclass) NOT NULL,
    key character varying(100) NOT NULL,
    value text NOT NULL,
    type integer DEFAULT 0,
    description character varying(3000),
    state integer DEFAULT 0,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.github.com/svyatoch/himera_sites OWNER TO postgres;

--
-- Data for Name: github.com/svyatoch/himera_sites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.github.com/svyatoch/himera_sites (id, key, value, type, description, state, created_at, updated_at) FROM stdin;
\.


--
-- Name: github.com/svyatoch/himera_sites github.com/svyatoch/himera_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.github.com/svyatoch/himera_sites
    ADD CONSTRAINT github.com/svyatoch/himera_sites_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

