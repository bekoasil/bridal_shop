--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1 (Debian 16.1-1.pgdg120+1)
-- Dumped by pg_dump version 16.1 (Debian 16.1-1.pgdg120+1)

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
-- Name: time_interval; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.time_interval AS ENUM (
    '08:00-09:00',
    '09:00-10:00',
    '10:00-11:00',
    '11:00-12:00',
    '12:00-13:00',
    '13:00-14:00',
    '14:00-15:00',
    '15:00-16:00',
    '16:00-17:00',
    '17:00-18:00',
    '18:00-19:00'
);


ALTER TYPE public.time_interval OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: appointments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.appointments (
    appointment_id integer NOT NULL,
    customer_id integer,
    appointment_date date,
    time_interval public.time_interval,
    product_type_selection integer,
    salesperson_id integer
);


ALTER TABLE public.appointments OWNER TO postgres;

--
-- Name: appointments_appointment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.appointments_appointment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.appointments_appointment_id_seq OWNER TO postgres;

--
-- Name: appointments_appointment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.appointments_appointment_id_seq OWNED BY public.appointments.appointment_id;


--
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    customer_id integer NOT NULL,
    customer_name character varying(15),
    customer_surname character varying(15),
    phone character varying(25) NOT NULL,
    email character varying(30)
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- Name: customers_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customers_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customers_customer_id_seq OWNER TO postgres;

--
-- Name: customers_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customers_customer_id_seq OWNED BY public.customers.customer_id;


--
-- Name: product_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_type (
    product_type_id integer NOT NULL,
    product_type character varying(15)
);


ALTER TABLE public.product_type OWNER TO postgres;

--
-- Name: product_type_product_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_type_product_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_type_product_type_id_seq OWNER TO postgres;

--
-- Name: product_type_product_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_type_product_type_id_seq OWNED BY public.product_type.product_type_id;


--
-- Name: salesperson; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.salesperson (
    salesperson_id integer NOT NULL,
    salesperson_name character varying(15),
    salesperson_surname character varying(15)
);


ALTER TABLE public.salesperson OWNER TO postgres;

--
-- Name: salesperson_salesperson_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.salesperson_salesperson_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.salesperson_salesperson_id_seq OWNER TO postgres;

--
-- Name: salesperson_salesperson_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.salesperson_salesperson_id_seq OWNED BY public.salesperson.salesperson_id;


--
-- Name: appointments appointment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments ALTER COLUMN appointment_id SET DEFAULT nextval('public.appointments_appointment_id_seq'::regclass);


--
-- Name: customers customer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers ALTER COLUMN customer_id SET DEFAULT nextval('public.customers_customer_id_seq'::regclass);


--
-- Name: product_type product_type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_type ALTER COLUMN product_type_id SET DEFAULT nextval('public.product_type_product_type_id_seq'::regclass);


--
-- Name: salesperson salesperson_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salesperson ALTER COLUMN salesperson_id SET DEFAULT nextval('public.salesperson_salesperson_id_seq'::regclass);


--
-- Data for Name: appointments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.appointments (appointment_id, customer_id, appointment_date, time_interval, product_type_selection, salesperson_id) FROM stdin;
1	60	2023-12-29	10:00-11:00	3	1
2	61	2023-12-29	09:00-10:00	4	2
3	62	2023-12-29	14:00-15:00	3	1
4	63	2023-12-29	12:00-13:00	2	1
5	64	2023-12-29	16:00-17:00	1	1
6	65	2023-12-29	13:00-14:00	1	1
7	66	2023-12-29	18:00-19:00	5	1
8	67	2023-12-30	09:00-10:00	1	2
9	68	2023-12-30	10:00-11:00	3	2
10	69	2023-12-30	11:00-12:00	3	2
11	70	2023-12-30	11:00-12:00	5	1
12	71	2023-12-30	13:00-14:00	3	2
13	72	2023-12-30	12:00-13:00	3	1
14	73	2023-12-30	14:00-15:00	2	2
15	74	2023-12-30	15:00-16:00	1	2
16	75	2023-12-30	16:00-17:00	4	2
17	77	2023-12-30	18:00-19:00	4	2
18	78	2023-12-30	17:00-18:00	3	2
19	81	2023-12-31	10:00-11:00	3	2
20	82	2023-12-31	11:00-12:00	5	2
21	83	2023-12-31	09:00-10:00	3	1
\.


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (customer_id, customer_name, customer_surname, phone, email) FROM stdin;
62	Deniz	Dafne	05325557899	deniz199@outlook.com
63	gizem	yazıcı	05448345666	gizotki@hotmail.com
64	hatice	nurfeneri	05303609876	hnurfeneri@outlook.com
65	melike	sancaktar	05301908766	melike.sancaktar@gmail.com
66	belinda	osmanov	+14597789988	beliosmano@gmail.com
67	Nursena	Namık	05448897766	nursenanam@outlook.com
68	Cansu	Canan	05447764757	cansu.canan@gmail.com
69	Zelal	Çalışkan	05325678899	zelal.caliskan@gmail.com
70	Fadime	Ünlü	05467889945	fadime67@gmail.com
71	Helin	Ozan	05553345533	suppergirl77@hotmail.com
72	Banu	Tarkan	05467778899	banu.tarkan@hotmail.com
73	Tuana	Tansu	05347776234	tuana.tans@hotmail.com
74	Deren	Çakır	05347889923	deren.deren12@gmail.com
75	Zeynep	Bastık	05328886745	zeynep.bastik@gmail.com
77	Angelina	Jolie	05324557896	angelina@outlook.com
78	Salme	Hayek	05328906634	salmehay@hi.com
81	Pelin	Çiftçi	05327824859	pelin.cift@gmail.com
82	Pınar	Altuğ	05548561982	pinar.altug@hotmail.com
83	Rana	Güllü	05551239865	rana@gmail.com
60	Ayşegül	Damla	05554487656	aysegul91@hotmail.com
61	Fatma	Kaya	05447723498	fatmakaya@gmail.com
\.


--
-- Data for Name: product_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_type (product_type_id, product_type) FROM stdin;
1	Gelinlik
2	Kınalık
3	Nişanlık
4	Abiye
5	After
\.


--
-- Data for Name: salesperson; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.salesperson (salesperson_id, salesperson_name, salesperson_surname) FROM stdin;
1	Sultan	Asil
2	Alya	Güneş
\.


--
-- Name: appointments_appointment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.appointments_appointment_id_seq', 21, true);


--
-- Name: customers_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_customer_id_seq', 83, true);


--
-- Name: product_type_product_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_type_product_type_id_seq', 5, true);


--
-- Name: salesperson_salesperson_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.salesperson_salesperson_id_seq', 4, true);


--
-- Name: appointments appointments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_pkey PRIMARY KEY (appointment_id);


--
-- Name: customers customers_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_email_key UNIQUE (email);


--
-- Name: customers customers_phone_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_phone_key UNIQUE (phone);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);


--
-- Name: product_type product_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_type
    ADD CONSTRAINT product_type_pkey PRIMARY KEY (product_type_id);


--
-- Name: salesperson salesperson_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salesperson
    ADD CONSTRAINT salesperson_pkey PRIMARY KEY (salesperson_id);


--
-- Name: appointments appointments_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);


--
-- Name: appointments appointments_product_type_selection_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_product_type_selection_fkey FOREIGN KEY (product_type_selection) REFERENCES public.product_type(product_type_id);


--
-- Name: appointments appointments_salesperson_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_salesperson_id_fkey FOREIGN KEY (salesperson_id) REFERENCES public.salesperson(salesperson_id);


--
-- PostgreSQL database dump complete
--

