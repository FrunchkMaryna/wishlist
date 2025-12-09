--
-- PostgreSQL database dump
--

\restrict oce4FeEJrFZegOWHemxxzh8axM385mnXhnunIwCbL0hdLtbtnnlMSxaXkYSXSZi

-- Dumped from database version 15.15
-- Dumped by pg_dump version 15.15

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
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying,
    full_name character varying,
    hashed_password character varying,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: wish_item_statuses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wish_item_statuses (
    id integer NOT NULL,
    item_id integer,
    user_id integer,
    marked boolean,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.wish_item_statuses OWNER TO postgres;

--
-- Name: wish_item_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.wish_item_statuses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wish_item_statuses_id_seq OWNER TO postgres;

--
-- Name: wish_item_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wish_item_statuses_id_seq OWNED BY public.wish_item_statuses.id;


--
-- Name: wish_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wish_items (
    id integer NOT NULL,
    title character varying,
    description text,
    priority integer,
    wishlist_id integer,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.wish_items OWNER TO postgres;

--
-- Name: wish_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.wish_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wish_items_id_seq OWNER TO postgres;

--
-- Name: wish_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wish_items_id_seq OWNED BY public.wish_items.id;


--
-- Name: wishlists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wishlists (
    id integer NOT NULL,
    title character varying,
    description text,
    user_id integer,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.wishlists OWNER TO postgres;

--
-- Name: wishlists_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.wishlists_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wishlists_id_seq OWNER TO postgres;

--
-- Name: wishlists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wishlists_id_seq OWNED BY public.wishlists.id;


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: wish_item_statuses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wish_item_statuses ALTER COLUMN id SET DEFAULT nextval('public.wish_item_statuses_id_seq'::regclass);


--
-- Name: wish_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wish_items ALTER COLUMN id SET DEFAULT nextval('public.wish_items_id_seq'::regclass);


--
-- Name: wishlists id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wishlists ALTER COLUMN id SET DEFAULT nextval('public.wishlists_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, full_name, hashed_password, created_at) FROM stdin;
\.


--
-- Data for Name: wish_item_statuses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wish_item_statuses (id, item_id, user_id, marked, created_at) FROM stdin;
\.


--
-- Data for Name: wish_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wish_items (id, title, description, priority, wishlist_id, created_at) FROM stdin;
\.


--
-- Data for Name: wishlists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wishlists (id, title, description, user_id, created_at) FROM stdin;
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: wish_item_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wish_item_statuses_id_seq', 1, false);


--
-- Name: wish_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wish_items_id_seq', 1, false);


--
-- Name: wishlists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wishlists_id_seq', 1, false);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: wish_item_statuses wish_item_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wish_item_statuses
    ADD CONSTRAINT wish_item_statuses_pkey PRIMARY KEY (id);


--
-- Name: wish_items wish_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wish_items
    ADD CONSTRAINT wish_items_pkey PRIMARY KEY (id);


--
-- Name: wishlists wishlists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wishlists
    ADD CONSTRAINT wishlists_pkey PRIMARY KEY (id);


--
-- Name: ix_users_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ix_users_email ON public.users USING btree (email);


--
-- Name: ix_users_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_users_id ON public.users USING btree (id);


--
-- Name: ix_wish_item_statuses_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_wish_item_statuses_id ON public.wish_item_statuses USING btree (id);


--
-- Name: ix_wish_items_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_wish_items_id ON public.wish_items USING btree (id);


--
-- Name: ix_wish_items_title; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_wish_items_title ON public.wish_items USING btree (title);


--
-- Name: ix_wishlists_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_wishlists_id ON public.wishlists USING btree (id);


--
-- Name: ix_wishlists_title; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_wishlists_title ON public.wishlists USING btree (title);


--
-- Name: wish_item_statuses wish_item_statuses_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wish_item_statuses
    ADD CONSTRAINT wish_item_statuses_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.wish_items(id);


--
-- Name: wish_item_statuses wish_item_statuses_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wish_item_statuses
    ADD CONSTRAINT wish_item_statuses_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: wish_items wish_items_wishlist_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wish_items
    ADD CONSTRAINT wish_items_wishlist_id_fkey FOREIGN KEY (wishlist_id) REFERENCES public.wishlists(id);


--
-- Name: wishlists wishlists_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wishlists
    ADD CONSTRAINT wishlists_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

\unrestrict oce4FeEJrFZegOWHemxxzh8axM385mnXhnunIwCbL0hdLtbtnnlMSxaXkYSXSZi

