--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-0ubuntu0.20.04.1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    user_id integer,
    game_id integer NOT NULL,
    guesses integer NOT NULL,
    number integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(40) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (63, 1, 878, 877);
INSERT INTO public.games VALUES (63, 2, 505, 504);
INSERT INTO public.games VALUES (64, 3, 381, 380);
INSERT INTO public.games VALUES (64, 4, 692, 691);
INSERT INTO public.games VALUES (63, 5, 183, 180);
INSERT INTO public.games VALUES (63, 6, 384, 382);
INSERT INTO public.games VALUES (63, 7, 973, 972);
INSERT INTO public.games VALUES (65, 8, 735, 734);
INSERT INTO public.games VALUES (65, 9, 733, 732);
INSERT INTO public.games VALUES (66, 10, 282, 281);
INSERT INTO public.games VALUES (66, 11, 327, 326);
INSERT INTO public.games VALUES (65, 12, 831, 828);
INSERT INTO public.games VALUES (65, 13, 247, 245);
INSERT INTO public.games VALUES (65, 14, 852, 851);
INSERT INTO public.games VALUES (67, 15, 447, 446);
INSERT INTO public.games VALUES (67, 16, 82, 81);
INSERT INTO public.games VALUES (68, 17, 523, 522);
INSERT INTO public.games VALUES (68, 18, 585, 584);
INSERT INTO public.games VALUES (67, 19, 537, 534);
INSERT INTO public.games VALUES (67, 20, 83, 81);
INSERT INTO public.games VALUES (67, 21, 20, 19);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'user_1705633967803');
INSERT INTO public.users VALUES (2, 'user_1705633967802');
INSERT INTO public.users VALUES (3, 'user_1705633979963');
INSERT INTO public.users VALUES (4, 'user_1705633979962');
INSERT INTO public.users VALUES (5, 'user_1705634082067');
INSERT INTO public.users VALUES (6, 'user_1705634082066');
INSERT INTO public.users VALUES (7, 'user_1705634191338');
INSERT INTO public.users VALUES (8, 'user_1705634191337');
INSERT INTO public.users VALUES (9, 'user_1705634271477');
INSERT INTO public.users VALUES (10, 'user_1705634271476');
INSERT INTO public.users VALUES (11, 'user_1705634376706');
INSERT INTO public.users VALUES (12, 'user_1705634376705');
INSERT INTO public.users VALUES (13, 'user_1705634401288');
INSERT INTO public.users VALUES (14, 'user_1705634401287');
INSERT INTO public.users VALUES (15, 'user_1705634408700');
INSERT INTO public.users VALUES (16, 'user_1705634408699');
INSERT INTO public.users VALUES (17, 'Jose');
INSERT INTO public.users VALUES (18, 'user_1705634443017');
INSERT INTO public.users VALUES (19, 'user_1705634443016');
INSERT INTO public.users VALUES (20, 'user_1705634492213');
INSERT INTO public.users VALUES (21, 'user_1705634492212');
INSERT INTO public.users VALUES (22, 'user_1705634522383');
INSERT INTO public.users VALUES (23, 'user_1705634522382');
INSERT INTO public.users VALUES (24, 'user_1705634526387');
INSERT INTO public.users VALUES (25, 'user_1705634526386');
INSERT INTO public.users VALUES (26, 'user_1705634540155');
INSERT INTO public.users VALUES (27, 'user_1705634540154');
INSERT INTO public.users VALUES (28, 'user_1705634590548');
INSERT INTO public.users VALUES (29, 'user_1705634590547');
INSERT INTO public.users VALUES (30, 'user_1705634643310');
INSERT INTO public.users VALUES (31, 'user_1705634643309');
INSERT INTO public.users VALUES (32, 'user_1705634656380');
INSERT INTO public.users VALUES (33, 'user_1705634656379');
INSERT INTO public.users VALUES (34, 'user_1705634698616');
INSERT INTO public.users VALUES (35, 'user_1705634698615');
INSERT INTO public.users VALUES (36, 'user_1705634908939');
INSERT INTO public.users VALUES (37, 'user_1705634908938');
INSERT INTO public.users VALUES (38, 'user_1705634926268');
INSERT INTO public.users VALUES (39, 'user_1705634926267');
INSERT INTO public.users VALUES (40, 'user_1705634941896');
INSERT INTO public.users VALUES (41, 'user_1705634941895');
INSERT INTO public.users VALUES (42, 'user_1705635033567');
INSERT INTO public.users VALUES (43, 'user_1705635033566');
INSERT INTO public.users VALUES (44, 'user_1705635057483');
INSERT INTO public.users VALUES (45, 'user_1705635057482');
INSERT INTO public.users VALUES (46, 'user_1705635109758');
INSERT INTO public.users VALUES (47, 'user_1705635109757');
INSERT INTO public.users VALUES (48, 'user_1705635147433');
INSERT INTO public.users VALUES (49, 'user_1705635147432');
INSERT INTO public.users VALUES (50, 'user_1705635222162');
INSERT INTO public.users VALUES (51, 'user_1705635222161');
INSERT INTO public.users VALUES (52, 'user_1705635303538');
INSERT INTO public.users VALUES (53, 'user_1705635303537');
INSERT INTO public.users VALUES (54, 'user_1705635552327');
INSERT INTO public.users VALUES (55, 'user_1705635552326');
INSERT INTO public.users VALUES (56, 'user_1705635556825');
INSERT INTO public.users VALUES (57, 'user_1705635556824');
INSERT INTO public.users VALUES (58, 'user_1705635682933');
INSERT INTO public.users VALUES (59, 'user_1705635682932');
INSERT INTO public.users VALUES (60, 'user_1705635819746');
INSERT INTO public.users VALUES (61, 'user_1705635819745');
INSERT INTO public.users VALUES (62, 'jOSE');
INSERT INTO public.users VALUES (63, 'user_1705636036029');
INSERT INTO public.users VALUES (64, 'user_1705636036028');
INSERT INTO public.users VALUES (65, 'user_1705636137834');
INSERT INTO public.users VALUES (66, 'user_1705636137833');
INSERT INTO public.users VALUES (67, 'user_1705636426205');
INSERT INTO public.users VALUES (68, 'user_1705636426204');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 21, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 68, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

