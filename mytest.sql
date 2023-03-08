--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2 (Debian 15.2-1.pgdg110+1)
-- Dumped by pg_dump version 15.2 (Debian 15.2-1.pgdg110+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: mytest; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE mytest WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE mytest OWNER TO postgres;

\connect mytest

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: chart_data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chart_data (
    id integer NOT NULL,
    factory_id integer NOT NULL,
    sprocket_production_actual integer NOT NULL,
    sprocket_production_goal integer NOT NULL,
    "time" bigint NOT NULL
);


ALTER TABLE public.chart_data OWNER TO postgres;

--
-- Name: chart_data_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.chart_data_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chart_data_id_seq OWNER TO postgres;

--
-- Name: chart_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.chart_data_id_seq OWNED BY public.chart_data.id;


--
-- Name: factory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.factory (
    id integer NOT NULL,
    name varchar (100)
);


ALTER TABLE public.factory OWNER TO postgres;

--
-- Name: factory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.factory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.factory_id_seq OWNER TO postgres;

--
-- Name: factory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.factory_id_seq OWNED BY public.factory.id;


--
-- Name: sprocket; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sprocket (
    id integer NOT NULL,
    teeth integer NOT NULL,
    pitch integer NOT NULL,
    outside_diameter integer NOT NULL,
    pitch_diameter integer NOT NULL
);


ALTER TABLE public.sprocket OWNER TO postgres;

--
-- Name: sprocket_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sprocket_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sprocket_id_seq OWNER TO postgres;

--
-- Name: sprocket_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sprocket_id_seq OWNED BY public.sprocket.id;


--
-- Name: chart_data id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chart_data ALTER COLUMN id SET DEFAULT nextval('public.chart_data_id_seq'::regclass);


--
-- Name: factory id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factory ALTER COLUMN id SET DEFAULT nextval('public.factory_id_seq'::regclass);


--
-- Name: sprocket id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sprocket ALTER COLUMN id SET DEFAULT nextval('public.sprocket_id_seq'::regclass);


--
-- Data for Name: chart_data; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chart_data (id, factory_id, sprocket_production_actual, sprocket_production_goal, "time") FROM stdin;
1	1	32	32	1611194818
2	1	29	30	1611194878
3	1	31	31	1611194938
4	1	30	29	1611194998
5	1	32	32	1611195058
6	1	32	32	1611195118
7	1	29	30	1611195178
8	1	31	31	1611195238
9	1	30	29	1611195298
10	1	32	32	1611195358
11	1	32	32	1611195418
12	1	29	30	1611195478
13	1	31	31	1611195538
14	1	30	29	1611195598
15	1	32	32	1611195658
16	1	32	32	1611195718
17	1	29	30	1611195778
18	1	31	31	1611195838
19	1	30	29	1611195898
20	1	32	32	1611195958
41	2	32	32	1611194818
42	2	29	30	1611194878
43	2	31	31	1611194938
44	2	30	29	1611194998
45	2	32	32	1611195058
46	2	32	32	1611195118
47	2	29	30	1611195178
48	2	31	31	1611195238
49	2	30	29	1611195298
50	2	32	32	1611195358
51	2	32	32	1611195418
52	2	29	30	1611195478
53	2	31	31	1611195538
54	2	30	29	1611195598
55	2	32	31	1611195658
56	2	32	32	1611195718
57	2	29	30	1611195778
58	2	31	31	1611195838
59	2	30	29	1611195898
60	2	32	32	1611195958
61	3	32	29	1611304818
62	3	31	31	1611304878
63	3	29	29	1611304938
64	3	30	30	1611304998
65	3	30	32	1611305058
66	3	32	30	1611305118
67	3	29	30	1611305178
68	3	29	31	1611305238
69	3	30	29	1611305298
70	3	32	31	1611305358
71	3	32	30	1611305418
72	3	29	30	1611305478
73	3	31	28	1611305538
74	3	30	29	1611305598
75	3	30	32	1611305658
76	3	32	29	1611305718
77	3	29	31	1611305778
78	3	29	31	1611305838
79	3	33	28	1611305898
80	3	31	32	1611305958
\.


--
-- Data for Name: factory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.factory (id) FROM stdin;
1
2
3
\.


--
-- Data for Name: sprocket; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sprocket (id, teeth, pitch, outside_diameter, pitch_diameter) FROM stdin;
1	5	1	6	5
2	5	1	6	5
3	5	1	6	5
\.


--
-- Name: chart_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.chart_data_id_seq', 80, true);


--
-- Name: factory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.factory_id_seq', 3, true);


--
-- Name: sprocket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sprocket_id_seq', 4, true);


--
-- Name: chart_data chart_data_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chart_data
    ADD CONSTRAINT chart_data_pk PRIMARY KEY (id);


--
-- Name: factory factory_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factory
    ADD CONSTRAINT factory_pk PRIMARY KEY (id);


--
-- Name: sprocket sprocket_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sprocket
    ADD CONSTRAINT sprocket_pk PRIMARY KEY (id);


--
-- Name: chart_data chart_data_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chart_data
    ADD CONSTRAINT chart_data_fk FOREIGN KEY (factory_id) REFERENCES public.factory(id);


--
-- PostgreSQL database dump complete
--

