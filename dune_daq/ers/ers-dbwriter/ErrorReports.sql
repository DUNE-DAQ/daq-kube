--
-- Automatically created by dbwriter.py no need to import
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

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
-- Name: public; Type: SCHEMA; Schema: -; Owner: ers
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO ers;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: ErrorReports; Type: TABLE; Schema: public; Owner: ers
--

CREATE TABLE public."ErrorReports" (
    partition text,
    issue_name text,
    message text,
    severity text,
    usecs_since_epoch bigint,
    "time" bigint,
    qualifiers text,
    params text,
    cwd text,
    file_name text,
    function_name text,
    host_name text,
    package_name text,
    user_name text,
    application_name text,
    user_id integer,
    process_id integer,
    thread_id integer,
    line_number integer,
    chain text
);


ALTER TABLE public."ErrorReports" OWNER TO ers;

--
-- PostgreSQL database dump complete
--
