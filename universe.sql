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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    distance_earth integer,
    name character varying(30) NOT NULL,
    magnitude numeric(4,2),
    constellation character varying(30)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    distance_earth integer,
    description text,
    habitable boolean,
    planet_id integer,
    name character varying(30) NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    radius numeric(8,3),
    habitable boolean,
    star_id integer,
    name character varying(30) NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer,
    star_types_id integer,
    age integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: star_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_types (
    star_types_id integer NOT NULL,
    supernova boolean NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.star_types OWNER TO freecodecamp;

--
-- Name: star_types_st_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_types_st_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_types_st_id_seq OWNER TO freecodecamp;

--
-- Name: star_types_st_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_types_st_id_seq OWNED BY public.star_types.star_types_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: star_types star_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_types ALTER COLUMN star_types_id SET DEFAULT nextval('public.star_types_st_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 0, 'Milky Way', NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 25000, 'Canis Major Dwarf', NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 30000, 'Stellar Stream', NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 81000, 'Sagittarius Dwarf', NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 2500000, 'Andromeda', NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 13700000, 'Centaurus A', NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, NULL, 'Nereida is a small, icy moon with vast frozen oceans beneath its thin atmosphere.', false, 1, 'Nereida');
INSERT INTO public.moon VALUES (2, NULL, 'Pyralis is a habitable moon with a breathable atmosphere, lush forests, and diverse ecosystems.', true, 2, 'Pyralis');
INSERT INTO public.moon VALUES (3, NULL, 'Luna Nova is a rocky moon with high cliffs and deep canyons, devoid of any significant atmosphere.', false, 3, 'Luna Nova');
INSERT INTO public.moon VALUES (4, NULL, 'Aetheria is a habitable moon with floating islands in its dense, gaseous atmosphere.', true, 4, 'Aetheria');
INSERT INTO public.moon VALUES (5, NULL, 'Verdant Luna is a habitable moon covered in lush greenery and dotted with sparkling lakes.', true, 5, 'Verdant Luna');
INSERT INTO public.moon VALUES (6, NULL, 'Aqua Luna is Earths moon, known for its desolate landscapes and impact craters.', true, 6, 'Aqua Luna');
INSERT INTO public.moon VALUES (7, NULL, 'Inferna is a moon with active volcanic activity, featuring molten rivers of lava on its surface.', false, 7, 'Inferna');
INSERT INTO public.moon VALUES (8, NULL, 'Zephyr Minor is a habitable moon with gentle winds and floating islands suspended in its atmosphere.', true, 8, 'Zephyr Minor');
INSERT INTO public.moon VALUES (9, NULL, 'Ignis Luna is a moon with a fiery, inhospitable environment, characterized by intense heat and volcanic eruptions.', false, 9, 'Ignis Luna');
INSERT INTO public.moon VALUES (10, NULL, 'Aquiluna is a habitable moon with vast oceans and a climate suitable for various life forms.', true, 10, 'Aquiluna');
INSERT INTO public.moon VALUES (11, NULL, 'Lumina is a moon with a reflective surface, often glowing brightly in the light of its parent star.', false, 11, 'Lumina');
INSERT INTO public.moon VALUES (12, NULL, 'Silva Luna is a habitable moon covered in dense, ancient forests and teeming with diverse flora and fauna.', true, 12, 'Silva Luna');
INSERT INTO public.moon VALUES (13, NULL, 'Oceanus is a habitable moon with vast, deep oceans covering its surface, harboring mysterious aquatic life forms.', true, 1, 'Oceanus');
INSERT INTO public.moon VALUES (14, NULL, 'Cinder is a moon with a rocky, barren surface and extreme temperature variations due to its proximity to its parent star.', false, 2, 'Cinder');
INSERT INTO public.moon VALUES (15, NULL, 'Celestial Beacon is a habitable moon known for its bright bioluminescent flora that illuminates the landscape at night.', true, 3, 'Celestial Beacon');
INSERT INTO public.moon VALUES (16, NULL, 'Zephyr Majoris is a moon with powerful winds and storms, making it inhospitable for most forms of life.', false, 4, 'Zephyr Majoris');
INSERT INTO public.moon VALUES (17, NULL, 'Aurora is a habitable moon with breathtaking auroras that dance across its skies, creating a mesmerizing celestial display.', true, 5, 'Aurora');
INSERT INTO public.moon VALUES (18, NULL, 'Lunar Oasis is Earths moon, transformed into a habitable outpost with domed settlements and artificial ecosystems.', true, 6, 'Lunar Oasis');
INSERT INTO public.moon VALUES (19, NULL, 'Molten Halo is a moon with a molten surface, surrounded by a shimmering halo of volcanic activity.', false, 7, 'Molten Halo');
INSERT INTO public.moon VALUES (20, NULL, 'Zenith is a habitable moon with towering mountains that reach into the stratosphere, offering breathtaking views of the cosmos.', true, 8, 'Zenith');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1.500, true, 1, 'Aqualis Prime');
INSERT INTO public.planet VALUES (2, 2.800, false, 2, 'Embera');
INSERT INTO public.planet VALUES (3, 1.100, true, 3, 'Terranova');
INSERT INTO public.planet VALUES (4, 1.900, false, 4, 'Celestia');
INSERT INTO public.planet VALUES (5, 1.700, true, 5, 'Verdant Haven');
INSERT INTO public.planet VALUES (6, 1.000, true, 6, 'Earth');
INSERT INTO public.planet VALUES (7, 3.500, false, 7, 'Pyros Minor');
INSERT INTO public.planet VALUES (8, 1.800, true, 1, 'Zephyr Prime');
INSERT INTO public.planet VALUES (9, 2.200, false, 2, 'Ignis Terra');
INSERT INTO public.planet VALUES (10, 1.300, true, 3, 'Aquilon IX');
INSERT INTO public.planet VALUES (11, 2.000, false, 4, 'Luminara');
INSERT INTO public.planet VALUES (12, 1.600, true, 4, 'Sylva Magna');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 4, 250, 'Sirio');
INSERT INTO public.star VALUES (2, 1, 4, 8, 'Betelgeuse');
INSERT INTO public.star VALUES (3, 1, 3, 4000, 'Proxima Centauri');
INSERT INTO public.star VALUES (4, 1, 1, 6000, 'Alpha Centauri A');
INSERT INTO public.star VALUES (5, 5, 4, 48, 'Mirach');
INSERT INTO public.star VALUES (6, 1, 2, 4600, 'Sun');
INSERT INTO public.star VALUES (7, 1, 1, 12, 'Antares');


--
-- Data for Name: star_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_types VALUES (1, true, 'Red Giant');
INSERT INTO public.star_types VALUES (2, false, 'White Dwarf');
INSERT INTO public.star_types VALUES (3, false, 'Neutron Star');
INSERT INTO public.star_types VALUES (4, true, 'Massive Star');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: star_types_st_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_types_st_id_seq', 4, true);


--
-- Name: galaxy galaxy_constellation_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_constellation_key UNIQUE (constellation);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_age_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_age_key UNIQUE (age);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star_types star_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_types
    ADD CONSTRAINT star_types_name_key UNIQUE (name);


--
-- Name: star_types star_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_types
    ADD CONSTRAINT star_types_pkey PRIMARY KEY (star_types_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star star_st_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_st_id_fkey FOREIGN KEY (star_types_id) REFERENCES public.star_types(star_types_id);


--
-- PostgreSQL database dump complete
--

