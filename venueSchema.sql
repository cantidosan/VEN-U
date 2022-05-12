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

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers 
(UUIDs)';


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
-- Name: amenities amenities_pkey; Type: CONSTRAINT; Schema: public; Owner: ---

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
-- Name: events_pictures pictures_events_event_id_fkey; Type: FK CONSTRAINT; 
Schema: public; Owner: -
--

ALTER TABLE ONLY public.events_pictures
    ADD CONSTRAINT pictures_events_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.events(id);


--
-- Name: venues_pictures pictures_venues_venue_id_fkey; Type: FK CONSTRAINT; 
Schema: public; Owner: -
--

ALTER TABLE ONLY public.venues_pictures
    ADD CONSTRAINT pictures_venues_venue_id_fkey FOREIGN KEY (venue_id) REFERENCES public.venues(id);


--
-- Name: venue_amenities venue_amenities_amenity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.venue_amenities
    ADD CONSTRAINT venue_amenities_amenity_id_fkey FOREIGN KEY (amenity_id) REFERENCES public.amenities(id);


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