
CREATE DATABASE venue;

-- DROP TABLE  IF EXISTS  users,venues,events,venueissues,amentities,pictures_events,pictures_venues,customer, ;
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

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
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: event_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.event_type AS ENUM (
    '1-1',
    '1-M',
    '1-S'
);


--
-- Name: user_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.user_type AS ENUM (
    'HOST',
    'BOOKEE',
    'CUSTOMER'
);


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: amenities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.amenities (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying
);


--
-- Name: customer; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customer (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    user_id uuid,
    event_id uuid,
    purchase_status boolean
);


--
-- Name: events; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.events (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying,
    location character varying(250),
    bookee_id uuid,
    created_at date,
    type public.event_type,
    entry_price integer,
    start_date date,
    duration integer,
    start_time time without time zone,
    promotional_details character varying(250),
    venue_id uuid,
    is_active boolean
);


--
-- Name: events_pictures; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.events_pictures (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    event_id uuid,
    pic_url character varying(250),
    is_active boolean
);


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    sid character varying NOT NULL,
    sess json NOT NULL,
    expire timestamp(6) without time zone NOT NULL
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    username character varying,
    first_name character varying,
    last_name character varying,
    created_at date,
    email character varying(250),
    password character varying(250),
    last_logged character varying(250),
    updated_at character varying(250),
    is_active boolean,
    user_type public.user_type,
    phone character varying(250)
);


--
-- Name: venue_amenities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.venue_amenities (
    venue_id uuid NOT NULL,
    amenity_id uuid NOT NULL,
    is_active boolean
);


--
-- Name: venueissues; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.venueissues (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    title character varying(250),
    comment character varying(250),
    venue_id uuid,
    user_id uuid
);


--
-- Name: venues; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.venues (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying NOT NULL,
    location character varying(250) NOT NULL,
    price integer NOT NULL,
    host_id uuid,
    created_at date DEFAULT now() NOT NULL,
    updated_at date DEFAULT now() NOT NULL,
    is_active boolean
);


--
-- Name: venues_pictures; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.venues_pictures (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    venue_id uuid,
    pic_url character varying(250),
    is_active boolean
);


--
-- Data for Name: amenities; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.amenities (id, name) FROM stdin;
1ff4786d-cd58-47a5-9683-a48568ae1f3d	parking
80e5964f-6409-41c1-a620-bdc329cd5def	blankets
cdd5fcb7-7e93-4e45-b4e3-eb1f6b8a96cb	food
25ab1821-07db-41db-b384-2950ef4f754a	Electricity
10344141-d8ed-47b7-a1a1-91ddbeaa8808	WiFi
\.


--
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.customer (id, user_id, event_id, purchase_status) FROM stdin;
\.


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.events (id, name, location, bookee_id, created_at, type, entry_price, start_date, duration, start_time, promotional_details, venue_id, is_active) FROM stdin;
933510e5-d960-4bd2-a67e-48d702df7fad	Kling, Beahan and Kuhlman	05 Cardinal Hill	a82df3f6-a7e4-41b9-8b36-9326850b2f03	2021-12-02	1-1	68	2021-10-08	55	19:56:00	Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.	29594aa7-9160-4344-96b4-ccca63e15bf0	t
3b26f2ac-b306-41af-8179-3bcf41f91e50	Torphy Group	4 South Point	88c8bd10-4aef-4939-a67c-4b6b93c35e62	2021-10-26	1-S	5	2022-04-28	74	19:10:00	Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.	29594aa7-9160-4344-96b4-ccca63e15bf0	t
ed2249bb-b217-4400-97c1-a35ab773bdbf	Robel and Sons	035 Division Crossing	aec93cbc-542b-47d3-a7a3-89919a438cad	2021-07-14	1-S	77	2022-05-06	3	21:20:00	Fusce posuere felis sed lacus. Morbi sem mauris, us.sque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.	29594aa7-9160-4344-96b4-ccca63e15bf0	f
a7994559-83ef-4464-a8e7-69c6095c6554	Collier, Collins and Stracke	194 Pankratz Lane	ad30f0d7-3c89-4cf7-a3b0-26eeb028d450	2021-04-30	1-M	21	2022-05-06	15	05:52:00	Maecenas tristique, est et tempus semper, est quaa Curae; Mauris viverra diam vitae quam. Suspendisse potenti.	29594aa7-9160-4344-96b4-ccca63e15bf0	f
56c86030-05a8-490a-891a-46604d66a63a	Ringer	Brooklyn	7ad42f51-3d63-4211-9d51-1530543212fd	2021-08-06	1-1	500	2022-05-06	57	\N	Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.	29594aa7-9160-4344-96b4-ccca63e15bf0	f
\.


--
-- Data for Name: events_pictures; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.events_pictures (id, event_id, pic_url, is_active) FROM stdin;
dad434e6-7f22-43a8-9c3a-6a8705bccbf2	3b26f2ac-b306-41af-8179-3bcf41f91e50	https://unsplash.com/photos/hTv8aaPziOQ	t
8ab364e1-7a32-4805-8861-6aa3d5f2f197	3b26f2ac-b306-41af-8179-3bcf41f91e50	https://unsplash.com/photos/hzgs56Ze49s	t
d5e4b1b4-dbd0-492c-9479-e90ddb52145c	3b26f2ac-b306-41af-8179-3bcf41f91e50	https://unsplash.com/photos/ULHxWq8reao	t
d598ba29-dee9-4e21-931e-6147b5818d5e	3b26f2ac-b306-41af-8179-3bcf41f91e50	https://unsplash.com/photos/fIHozNWfcvs	t
3b3a3cc3-7a87-49f7-a589-4e76a6b9171f	56c86030-05a8-490a-891a-46604d66a63a	https://unsplash.com/photos/I9j8Rk-JYFM	t
55a4f84c-42bd-4a40-ba60-401aa21a4ffb	56c86030-05a8-490a-891a-46604d66a63a	https://unsplash.com/photos/9vDdkxSCAD4	t
0588ed26-ec10-43b6-8a15-7292b918d488	56c86030-05a8-490a-891a-46604d66a63a	https://unsplash.com/photos/74tlEYKgrBE	t
fb2668ce-9596-446d-ac15-5462ce84e113	ed2249bb-b217-4400-97c1-a35ab773bdbf	https://unsplash.com/photos/nLUb9GThIcg	t
3fffc94f-73d3-4dbe-a4e7-969a891302c6	ed2249bb-b217-4400-97c1-a35ab773bdbf	https://unsplash.com/photos/_HXFz-0g9w8	t
b2c5c706-0e4f-4e80-ae4c-a921e5b85a22	ed2249bb-b217-4400-97c1-a35ab773bdbf	https://unsplash.com/photos/3skLpaOBlMw	t
1fda787a-bc43-438d-afff-e7cdf2b126ad	a7994559-83ef-4464-a8e7-69c6095c6554	https://unsplash.com/photos/OQOKSsj8QME	t
979dd987-f961-4436-a557-8bfcb9097131	a7994559-83ef-4464-a8e7-69c6095c6554	https://unsplash.com/photos/ya631mqQ7Ng	t
41b7bf2d-ecb1-4fe7-98d5-3a9975624c37	a7994559-83ef-4464-a8e7-69c6095c6554	https://unsplash.com/photos/UV3GmG_HEqI	t
ca19beb5-afa3-472c-9c30-e4efd483a880	933510e5-d960-4bd2-a67e-48d702df7fad	https://unsplash.com/photos/AZMmUy2qL6A	t
19b794c4-6505-4cc0-a4bf-cef7e79ad05e	933510e5-d960-4bd2-a67e-48d702df7fad	https://unsplash.com/photos/vFMY_lgJ8rg	t
2575fa5b-87f2-4893-8a67-b66bedc2d424	933510e5-d960-4bd2-a67e-48d702df7fad	https://unsplash.com/photos/pYjRGc81avs	t
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.sessions (sid, sess, expire) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (id, username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) FROM stdin;
1d339485-3a53-42d3-a464-513cfa0430eb	rvallantine0	Retha	Vallantine	2021-09-02	rvallantine0@thetimes.co.uk	$2b$08$rTtOzRVZw9trj75hJlg0Kecx6Z4RgY7TDIi1r2J1qrd3DItlol/p6	10/24/2021	4/22/2022	t	HOST	979-395-5903
7e67993e-dbb2-4793-bff2-b850c1e74b1d	odurand3	Oren	Durand	2022-03-23	odurand3@uol.com.br	$2b$08$rTtOzRVZw9trj75hJlg0Kecx6Z4RgY7TDIi1r2J1qrd3DItlol/p6	10/14/2021	7/19/2021	f	HOST	333-560-3146
94401edc-63ea-45c3-af93-3f7ce394cc04	alyes6	Antoine	Lyes	2021-05-19	alyes6@nature.com	$2b$08$rTtOzRVZw9trj75hJlg0Kecx6Z4RgY7TDIi1r2J1qrd3DItlol/p6	8/29/2021	7/8/2021	t	HOST	333-682-6551
d0c955df-d4e9-4fea-bd6b-e89fea2b3fde	dmetham9	Drucill	Metham	2021-05-08	dmetham9@comsenz.com	$2b$08$rTtOzRVZw9trj75hJlg0Kecx6Z4RgY7TDIi1r2J1qrd3DItlol/p6	1/14/2022	1/28/2022	t	HOST	489-420-1452
b7a1730f-1598-42c7-b503-e420fa794fb8	mmarfieldc	Modestine	Marfield	2021-08-03	mmarfieldc@xing.com	$2b$08$rTtOzRVZw9trj75hJlg0Kecx6Z4RgY7TDIi1r2J1qrd3DItlol/p6	4/29/2021	11/5/2021	t	HOST	806-624-9904
5f8c7c3c-549e-4ad1-9a58-dc7358cad1d5	fheightonf	Finley	Heighton	2022-04-18	fheightonf@gizmodo.com	$2b$08$rTtOzRVZw9trj75hJlg0Kecx6Z4RgY7TDIi1r2J1qrd3DItlol/p6	8/24/2021	11/17/2021	f	HOST	341-485-5668
d7c42908-c409-432e-8225-219ac60e32c2	bgehrelsi	Boyd	Gehrels	2022-04-02	bgehrelsi@zdnet.com	$2b$08$rTtOzRVZw9trj75hJlg0Kecx6Z4RgY7TDIi1r2J1qrd3DItlol/p6	11/1/2021	5/8/2021	f	HOST	438-710-7843
6711a148-2293-4511-95a8-8ccf3a69356d	esertinl	Eziechiele	Sertin	2021-07-22	esertinl@tumblr.com	$2b$08$rTtOzRVZw9trj75hJlg0Kecx6Z4RgY7TDIi1r2J1qrd3DItlol/p6	10/14/2021	10/27/2021	t	HOST	434-521-3907
082f2420-d97c-4cb8-b514-8b14a60bcb8c	jmcinneryo	Jayne	McInnery	2022-04-03	jmcinneryo@aboutads.info	$2b$08$rTtOzRVZw9trj75hJlg0Kecx6Z4RgY7TDIi1r2J1qrd3DItlol/p6	12/14/2021	4/25/2021	t	HOST	832-610-7937
b6f5e928-9c26-4e49-997c-689990d533da	gsenussir	Garvey	Senussi	2022-01-26	gsenussir@mozilla.com	$2b$08$rTtOzRVZw9trj75hJlg0Kecx6Z4RgY7TDIi1r2J1qrd3DItlol/p6	12/4/2021	2/2/2022	t	HOST	358-913-4936
3eaa7f2a-54b9-4ae5-947b-cc679479adb4	gwinnyu	Grover	Winny	2021-08-22	gwinnyu@businessweek.com	$2b$08$rTtOzRVZw9trj75hJlg0Kecx6Z4RgY7TDIi1r2J1qrd3DItlol/p6	10/6/2021	8/21/2021	f	HOST	129-785-7030
16a62481-80ed-47bb-b985-2339d7608b80	jkenningtonx	Joela	Kennington	2021-11-14	jkenningtonx@reference.com	$2b$08$rTtOzRVZw9trj75hJlg0Kecx6Z4RgY7TDIi1r2J1qrd3DItlol/p6	5/13/2021	10/1/2021	t	HOST	155-630-5826
eb52f801-3c1f-49f3-bf68-05d9518e59cc	cblagdon10	Charlie	Blagdon	2021-05-21	cblagdon10@cbc.ca	$2b$08$rTtOzRVZw9trj75hJlg0Kecx6Z4RgY7TDIi1r2J1qrd3DItlol/p6	8/10/2021	1/3/2022	f	HOST	951-605-3873
1c31f715-478f-458c-9797-a96ecb95f7b3	gevill1	Glenden	Evill	2021-12-10	gevill1@economist.com	$2b$08$rTtOzRVZw9trj75hJlg0Kecx6Z4RgY7TDIi1r2J1qrd3DItlol/p6	4/19/2022	6/27/2021	f	CUSTOMER	509-917-7392
b99c33f2-e8d0-470c-ad05-fea594302f04	edionisii4	Emmeline	Dionisii	2021-09-05	edionisii4@plala.or.jp	$2b$08$rTtOzRVZw9trj75hJlg0Kecx6Z4RgY7TDIi1r2J1qrd3DItlol/p6	4/19/2022	8/8/2021	f	CUSTOMER	881-591-1433
27e03d4e-e7e1-4ff1-8ef5-525767bc88c7	ecolbertson7	Emery	Colbertson	2021-10-14	ecolbertson7@home.pl	$2b$08$rTtOzRVZw9trj75hJlg0Kecx6Z4RgY7TDIi1r2J1qrd3DItlol/p6	9/1/2021	5/22/2021	t	CUSTOMER	858-105-3736
db5952af-2c1f-4af4-8419-a3ab032a98cc	smacquakera	Siffre	MacQuaker	2022-02-18	smacquakera@gnu.org	$2b$08$rTtOzRVZw9trj75hJlg0Kecx6Z4RgY7TDIi1r2J1qrd3DItlol/p6	5/2/2021	7/25/2021	t	CUSTOMER	676-808-6095
4e20ea43-a928-437a-bd49-59701c2cac4f	nputtond	Natalie	Putton	2021-07-18	nputtond@parallels.com	$2b$08$rTtOzRVZw9trj75hJlg0Kecx6Z4RgY7TDIi1r2J1qrd3DItlol/p6	1/13/2022	1/29/2022	t	CUSTOMER	220-859-2454
568a2026-f4ed-4eb3-afdd-26c618c78843	sastlettg	Stephine	Astlett	2022-01-31	sastlettg@columbia.edu	$2b$08$rTtOzRVZw9trj75hJlg0Kecx6Z4RgY7TDIi1r2J1qrd3DItlol/p6	9/18/2021	9/22/2021	f	CUSTOMER	453-651-0249
6c9f3e5c-4ddc-4c1b-ad7b-af38f2b936d4	jspellecyj	Jory	Spellecy	2021-10-24	jspellecyj@fema.gov	$2b$08$rTtOzRVZw9trj75hJlg0Kecx6Z4RgY7TDIi1r2J1qrd3DItlol/p6	1/17/2022	10/2/2021	t	CUSTOMER	368-515-6675
064ba308-7d7d-4705-9b67-64d30d307ea8	dbarusm	Daniella	Barus	2021-10-18	dbarusm@jimdo.com	$2b$08$rTtOzRVZw9trj75hJlg0Kecx6Z4RgY7TDIi1r2J1qrd3DItlol/p6	7/26/2021	5/18/2021	t	CUSTOMER	295-913-0516
e561a186-b352-4ae1-b888-4f0b834a3638	btedmanp	Bertram	Tedman	2022-04-11	btedmanp@wired.com	$2b$08$rTtOzRVZw9trj75hJlg0Kecx6Z4RgY7TDIi1r2J1qrd3DItlol/p6	4/8/2022	11/29/2021	f	CUSTOMER	246-702-4312
612fcee7-d98f-4e61-b559-34d1388ca03e	hguilletons	Henri	Guilleton	2021-05-29	hguilletons@samsung.com	$2b$08$rTtOzRVZw9trj75hJlg0Kecx6Z4RgY7TDIi1r2J1qrd3DItlol/p6	10/21/2021	8/31/2021	t	CUSTOMER	561-981-6903
76f02b0d-b2bd-4c1d-936f-6299f48420dd	swrightonv	Sol	Wrighton	2021-06-29	swrightonv@list-manage.com	$2b$08$rTtOzRVZw9trj75hJlg0Kecx6Z4RgY7TDIi1r2J1qrd3DItlol/p6	11/7/2021	9/17/2021	f	CUSTOMER	937-420-7114
2fbe411b-a70c-4229-99a8-a2533c76c5b4	ejanosevicy	Ettie	Janosevic	2021-12-05	ejanosevicy@ca.gov	$2b$08$rTtOzRVZw9trj75hJlg0Kecx6Z4RgY7TDIi1r2J1qrd3DItlol/p6	3/12/2022	12/29/2021	f	CUSTOMER	224-296-9051
2552626f-58dd-4dad-b4f4-9a69f50a6b43	ismiz11	Ignacio	Smiz	2021-06-23	ismiz11@miibeian.gov.cn	$2b$08$rTtOzRVZw9trj75hJlg0Kecx6Z4RgY7TDIi1r2J1qrd3DItlol/p6	10/19/2021	11/29/2021	t	CUSTOMER	159-773-7741
f85a84c5-856c-4315-899c-04d5829df5f0	fkennet2	Frasquito	Kennet	2022-03-26	fkennet2@mit.edu	$2b$08$rTtOzRVZw9trj75hJlg0Kecx6Z4RgY7TDIi1r2J1qrd3DItlol/p6	1/28/2022	4/29/2021	f	BOOKEE	676-947-0438
89a41c11-9b4b-4ee0-a9ff-b3f5ccd39857	mwarmisham5	Maryrose	Warmisham	2021-07-15	mwarmisham5@google.fr	$2b$08$rTtOzRVZw9trj75hJlg0Kecx6Z4RgY7TDIi1r2J1qrd3DItlol/p6	4/24/2021	12/16/2021	f	BOOKEE	778-790-2020
ea16d31c-473e-449c-acb4-10c468602f7d	eodeegan8	Ealasaid	ODeegan	2021-09-13	eodeegan8@pbs.org	$2b$08$rTtOzRVZw9trj75hJlg0Kecx6Z4RgY7TDIi1r2J1qrd3DItlol/p6	4/25/2021	9/3/2021	f	BOOKEE	143-189-9220
a82df3f6-a7e4-41b9-8b36-9326850b2f03	lpaslowb	Lucy	Paslow	2021-08-03	lpaslowb@amazonaws.com	$2b$08$rTtOzRVZw9trj75hJlg0Kecx6Z4RgY7TDIi1r2J1qrd3DItlol/p6	2/5/2022	8/17/2021	f	BOOKEE	195-905-6899
88c8bd10-4aef-4939-a67c-4b6b93c35e62	vbloise	Vale	Blois	2021-12-31	vbloise@cmu.edu	$2b$08$rTtOzRVZw9trj75hJlg0Kecx6Z4RgY7TDIi1r2J1qrd3DItlol/p6	4/23/2022	11/11/2021	t	BOOKEE	905-439-3906
ce851800-e49d-4934-acb4-5ba7ecb96000	dkillelayh	Delano	Killelay	2022-01-21	dkillelayh@hugedomains.com	$2b$08$rTtOzRVZw9trj75hJlg0Kecx6Z4RgY7TDIi1r2J1qrd3DItlol/p6	1/21/2022	9/6/2021	f	BOOKEE	216-526-1486
ad30f0d7-3c89-4cf7-a3b0-26eeb028d450	bludlammek	Bunni	Ludlamme	2021-07-03	bludlammek@nifty.com	$2b$08$rTtOzRVZw9trj75hJlg0Kecx6Z4RgY7TDIi1r2J1qrd3DItlol/p6	1/23/2022	6/8/2021	t	BOOKEE	596-699-8083
7ad42f51-3d63-4211-9d51-1530543212fd	amccarlien	Atlanta	McCarlie	2021-06-02	amccarlien@usatoday.com	$2b$08$rTtOzRVZw9trj75hJlg0Kecx6Z4RgY7TDIi1r2J1qrd3DItlol/p6	9/17/2021	3/29/2022	t	BOOKEE	134-756-0896
b1e49e89-aa2a-43d4-9bee-07b7e569c0e2	vstockbridgeq	Valenka	Stockbridge	2022-02-05	vstockbridgeq@dmoz.org	$2b$08$rTtOzRVZw9trj75hJlg0Kecx6Z4RgY7TDIi1r2J1qrd3DItlol/p6	3/27/2022	9/11/2021	f	BOOKEE	119-373-4348
aec93cbc-542b-47d3-a7a3-89919a438cad	tscheffelt	Tyler	Scheffel	2021-07-08	tscheffelt@forbes.com	$2b$08$rTtOzRVZw9trj75hJlg0Kecx6Z4RgY7TDIi1r2J1qrd3DItlol/p6	8/31/2021	6/20/2021	f	BOOKEE	645-101-3120
2499daae-928c-4591-939a-379388f99439	tmerigonw	Thadeus	Merigon	2021-11-29	tmerigonw@slate.com	$2b$08$rTtOzRVZw9trj75hJlg0Kecx6Z4RgY7TDIi1r2J1qrd3DItlol/p6	11/1/2021	4/15/2022	t	BOOKEE	583-639-1173
a39cbc0b-38f6-4b9f-a4b3-9ff670029e35	dbaymanz	Dahlia	Bayman	2021-05-22	dbaymanz@spiegel.de	$2b$08$rTtOzRVZw9trj75hJlg0Kecx6Z4RgY7TDIi1r2J1qrd3DItlol/p6	11/24/2021	12/7/2021	t	BOOKEE	530-697-1038
bff48f34-2328-4d80-ad66-55850e6a3c72	megell12	Murielle	Egell	2021-06-30	megell12@unesco.org	$2b$08$rTtOzRVZw9trj75hJlg0Kecx6Z4RgY7TDIi1r2J1qrd3DItlol/p6	8/8/2021	9/10/2021	f	BOOKEE	324-883-0400
60c9ff34-1799-4c97-87c1-784b5e5741f6	admin	admin_fname	admin_lname	2022-05-07	admin@gmail.com	$2b$08$rTtOzRVZw9trj75hJlg0Kecx6Z4RgY7TDIi1r2J1qrd3DItlol/p6	\N	2022-05-07T18:19:05.639+00:00	t	BOOKEE	641562723
c6984b78-b80c-4516-b983-e9686505246d	djeayes13	Dov	Jeayes	2021-09-23	djeayes13@cyberchimps.com	$2b$08$rTtOzRVZw9trj75hJlg0Kecx6Z4RgY7TDIi1r2J1qrd3DItlol/p6	8/29/2021	8/25/2021	t	HOST	478-261-7023
b74898e7-d33c-416b-9f31-b70bfe679275	barryC	barryC_fname	barryC_lname	2022-05-07	barryC@gmail.com	$2b$08$V4xqJ2LB7GzQkbBX3phRqe1RivR14leMhudUulfUEyRVHqv0qZrni	2022-05-07T18:29:04.957+00:00	2022-05-07T18:29:04.957+00:00	t	CUSTOMER	437715624
\.


--
-- Data for Name: venue_amenities; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.venue_amenities (venue_id, amenity_id, is_active) FROM stdin;
b00f31aa-2e36-43a0-b672-a3913d9c2ad5	10344141-d8ed-47b7-a1a1-91ddbeaa8808	f
d3136f4b-e852-4be1-94db-13245240e295	1ff4786d-cd58-47a5-9683-a48568ae1f3d	t
d3136f4b-e852-4be1-94db-13245240e295	80e5964f-6409-41c1-a620-bdc329cd5def	t
d3136f4b-e852-4be1-94db-13245240e295	cdd5fcb7-7e93-4e45-b4e3-eb1f6b8a96cb	t
d3136f4b-e852-4be1-94db-13245240e295	25ab1821-07db-41db-b384-2950ef4f754a	t
d3136f4b-e852-4be1-94db-13245240e295	10344141-d8ed-47b7-a1a1-91ddbeaa8808	t
c385fc4b-070a-4fca-a512-11f219f60b71	1ff4786d-cd58-47a5-9683-a48568ae1f3d	t
c385fc4b-070a-4fca-a512-11f219f60b71	80e5964f-6409-41c1-a620-bdc329cd5def	t
c385fc4b-070a-4fca-a512-11f219f60b71	cdd5fcb7-7e93-4e45-b4e3-eb1f6b8a96cb	t
c385fc4b-070a-4fca-a512-11f219f60b71	25ab1821-07db-41db-b384-2950ef4f754a	t
c385fc4b-070a-4fca-a512-11f219f60b71	10344141-d8ed-47b7-a1a1-91ddbeaa8808	t
29594aa7-9160-4344-96b4-ccca63e15bf0	1ff4786d-cd58-47a5-9683-a48568ae1f3d	t
29594aa7-9160-4344-96b4-ccca63e15bf0	80e5964f-6409-41c1-a620-bdc329cd5def	t
29594aa7-9160-4344-96b4-ccca63e15bf0	cdd5fcb7-7e93-4e45-b4e3-eb1f6b8a96cb	t
29594aa7-9160-4344-96b4-ccca63e15bf0	25ab1821-07db-41db-b384-2950ef4f754a	t
29594aa7-9160-4344-96b4-ccca63e15bf0	10344141-d8ed-47b7-a1a1-91ddbeaa8808	t
44c10af5-79b7-4efc-810e-a39343f6af20	1ff4786d-cd58-47a5-9683-a48568ae1f3d	t
44c10af5-79b7-4efc-810e-a39343f6af20	80e5964f-6409-41c1-a620-bdc329cd5def	t
44c10af5-79b7-4efc-810e-a39343f6af20	cdd5fcb7-7e93-4e45-b4e3-eb1f6b8a96cb	t
44c10af5-79b7-4efc-810e-a39343f6af20	25ab1821-07db-41db-b384-2950ef4f754a	t
44c10af5-79b7-4efc-810e-a39343f6af20	10344141-d8ed-47b7-a1a1-91ddbeaa8808	t
\.


--
-- Data for Name: venueissues; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.venueissues (id, title, comment, venue_id, user_id) FROM stdin;
\.


--
-- Data for Name: venues; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.venues (id, name, location, price, host_id, created_at, updated_at, is_active) FROM stdin;
d3136f4b-e852-4be1-94db-13245240e295	abeaston2	6180 Rutledge Center	4	7e67993e-dbb2-4793-bff2-b850c1e74b1d	2022-01-18	2022-05-11	f
c385fc4b-070a-4fca-a512-11f219f60b71	drodell3	698 Glacier Hill Way	7	6711a148-2293-4511-95a8-8ccf3a69356d	2022-04-11	2022-05-11	f
b00f31aa-2e36-43a0-b672-a3913d9c2ad5	mgreensted5	8 Park Meadow Terrace	5	3eaa7f2a-54b9-4ae5-947b-cc679479adb4	2021-11-11	2022-05-11	t
29594aa7-9160-4344-96b4-ccca63e15bf0	Smolations	Boston	400	16a62481-80ed-47bb-b985-2339d7608b80	2021-05-04	2022-05-11	f
3bc97358-d171-4c02-846a-e38425f53993	chicago	MLK boulevard	12	94401edc-63ea-45c3-af93-3f7ce394cc04	2021-09-12	2022-05-11	f
4e93621a-4c30-4910-818d-3796db882f66	tomb	egypt	48	1d339485-3a53-42d3-a464-513cfa0430eb	2022-05-11	2022-05-11	t
44c10af5-79b7-4efc-810e-a39343f6af20	aba	brooklyn	34	7e67993e-dbb2-4793-bff2-b850c1e74b1d	2022-07-07	2022-05-11	t
0305dfc8-cc20-448e-a653-d5209701bdce	AZAN	Turkey	500	1d339485-3a53-42d3-a464-513cfa0430eb	2022-05-11	2022-05-11	t
\.


--
-- Data for Name: venues_pictures; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.venues_pictures (id, venue_id, pic_url, is_active) FROM stdin;
23a90b43-a6c1-46fc-a8b4-0f9e4095e6ed	29594aa7-9160-4344-96b4-ccca63e15bf0	https://unsplash.com/photos/olVJDJYKPSI	t
c21a62b0-19a3-4b36-9e86-76c73a4de550	29594aa7-9160-4344-96b4-ccca63e15bf0	https://unsplash.com/photos/fqUmkIyFMNk	t
3fb7e322-4201-49e9-8fce-eb6e94499bb9	d3136f4b-e852-4be1-94db-13245240e295	https://unsplash.com/photos/skAv-NHClaE	t
805c85d8-e3d2-4aa8-8551-f89522399dac	d3136f4b-e852-4be1-94db-13245240e295	https://unsplash.com/photos/NMcC4oakPKc	t
88e845fb-9b27-41ee-b6c0-67fee7a97250	c385fc4b-070a-4fca-a512-11f219f60b71	https://unsplash.com/photos/vTA42h-v0pw	t
e64e8316-3510-421e-b87c-077e659f477a	c385fc4b-070a-4fca-a512-11f219f60b71	https://unsplash.com/photos/ZYT7O6UlB14	t
22a061cb-03e1-4a52-80e6-56082089e09f	3bc97358-d171-4c02-846a-e38425f53993	https://unsplash.com/photos/s08uwbS1DkE	t
706b7c7f-2d94-4bfd-a51d-19a771e8a5ea	3bc97358-d171-4c02-846a-e38425f53993	https://unsplash.com/photos/NmInovQT-Rs	t
fdb704d3-4ffd-4835-86e9-b45e98c6f021	b00f31aa-2e36-43a0-b672-a3913d9c2ad5	https://unsplash.com/photos/iJgmwXLc35g	t
d844399c-5d2c-49bd-a3d6-0a5686e5c4a6	b00f31aa-2e36-43a0-b672-a3913d9c2ad5	https://unsplash.com/photos/Y9xVffMVZNM	t
\.


--
-- Name: amenities amenities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.amenities
    ADD CONSTRAINT amenities_pkey PRIMARY KEY (id);


--
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (id);


--
-- Name: events events_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_name_key UNIQUE (name);


--
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: events_pictures pictures_events_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.events_pictures
    ADD CONSTRAINT pictures_events_pkey PRIMARY KEY (id);


--
-- Name: venues_pictures pictures_venues_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.venues_pictures
    ADD CONSTRAINT pictures_venues_pkey PRIMARY KEY (id);


--
-- Name: sessions session_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT session_pkey PRIMARY KEY (sid);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: venue_amenities venue_amenities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.venue_amenities
    ADD CONSTRAINT venue_amenities_pkey PRIMARY KEY (venue_id, amenity_id);


--
-- Name: venueissues venueissues_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.venueissues
    ADD CONSTRAINT venueissues_pkey PRIMARY KEY (id);


--
-- Name: venues venues_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.venues
    ADD CONSTRAINT venues_name_key UNIQUE (name);


--
-- Name: venues venues_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.venues
    ADD CONSTRAINT venues_pkey PRIMARY KEY (id);


--
-- Name: IDX_session_expire; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_session_expire" ON public.sessions USING btree (expire);


--
-- Name: customer customer_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.events(id);


--
-- Name: customer customer_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: events events_bookee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_bookee_id_fkey FOREIGN KEY (bookee_id) REFERENCES public.users(id);


--
-- Name: events events_venue_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_venue_id_fkey FOREIGN KEY (venue_id) REFERENCES public.venues(id);


--
-- Name: events_pictures pictures_events_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.events_pictures
    ADD CONSTRAINT pictures_events_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.events(id);


--
-- Name: venues_pictures pictures_venues_venue_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.venues_pictures
    ADD CONSTRAINT pictures_venues_venue_id_fkey FOREIGN KEY (venue_id) REFERENCES public.venues(id);


--
-- Name: venue_amenities venue_amenities_amenity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.venue_amenities
    ADD CONSTRAINT venue_amenities_amenity_id_fkey FOREIGN KEY (amenity_id) REFERENCES public.amenities(id) ON DELETE CASCADE;


--
-- Name: venue_amenities venue_amenities_venue_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.venue_amenities
    ADD CONSTRAINT venue_amenities_venue_id_fkey FOREIGN KEY (venue_id) REFERENCES public.venues(id) ON DELETE CASCADE;


--
-- Name: venueissues venueissues_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.venueissues
    ADD CONSTRAINT venueissues_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: venueissues venueissues_venue_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.venueissues
    ADD CONSTRAINT venueissues_venue_id_fkey FOREIGN KEY (venue_id) REFERENCES public.venues(id);


--
-- Name: venues venues_host_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.venues
    ADD CONSTRAINT venues_host_id_fkey FOREIGN KEY (host_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--
