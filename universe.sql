--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    name character varying(30),
    galaxy_id integer NOT NULL,
    constellation character varying(20),
    dist_in_kpc integer NOT NULL,
    notes text
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
    name character varying(30),
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    dia_in_kms integer NOT NULL,
    only_moon boolean NOT NULL
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
    name character varying(30),
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    is_habitable boolean,
    planet_type character varying(30)
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
-- Name: space_telesc; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.space_telesc (
    space_telesc_id integer NOT NULL,
    space_agency character varying(30) NOT NULL,
    launch_date date NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.space_telesc OWNER TO freecodecamp;

--
-- Name: space_telesc_space_telesc_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.space_telesc_space_telesc_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.space_telesc_space_telesc_id_seq OWNER TO freecodecamp;

--
-- Name: space_telesc_space_telesc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.space_telesc_space_telesc_id_seq OWNED BY public.space_telesc.space_telesc_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    age_in_gyr numeric,
    temp_in_k integer NOT NULL,
    star_id integer NOT NULL
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
-- Name: space_telesc space_telesc_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_telesc ALTER COLUMN space_telesc_id SET DEFAULT nextval('public.space_telesc_space_telesc_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Andromeda', 2, 'Andromeda', 752, 'Closest big galaxy to Milky way. Expected to collide in 4.5 bil yrs.');
INSERT INTO public.galaxy VALUES ('Milky Way', 1, 'Sagittarius', 8, 'Contains solar system and thus Earth.');
INSERT INTO public.galaxy VALUES ('NGC 4151', 3, 'Canes Venatici', 15800, 'Also nicknamed Eye of Sauron');
INSERT INTO public.galaxy VALUES ('Mayalls object', 4, 'Ursa Major', 140000, 'Peculiar spindle and ring shape thought to be due to two galaxies colliding');
INSERT INTO public.galaxy VALUES ('Large Magellanic Cloud', 5, 'Dorado/Mensa', 50, 'Holds TarantulaNebula,the mostactive star-forming region in the Local group');
INSERT INTO public.galaxy VALUES ('Triangulum galaxy', 6, 'Triangulum', 890, 'Visible to the naked eye. Third largest member of the local group of galaxies');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Moon', 1, 3, 3476, true);
INSERT INTO public.moon VALUES ('Deimos', 3, 6, 12, false);
INSERT INTO public.moon VALUES ('Phobos', 5, 6, 22, false);
INSERT INTO public.moon VALUES ('lo', 6, 7, 3660, false);
INSERT INTO public.moon VALUES ('Titan', 2, 8, 5149, false);
INSERT INTO public.moon VALUES ('Ganymede', 7, 7, 5286, false);
INSERT INTO public.moon VALUES ('Callisto', 8, 7, 4820, false);
INSERT INTO public.moon VALUES ('Kale', 9, 7, 2, false);
INSERT INTO public.moon VALUES ('Mimas', 10, 8, 396, false);
INSERT INTO public.moon VALUES ('Rhea', 11, 8, 1527, false);
INSERT INTO public.moon VALUES ('Hyperion', 12, 8, 270, false);
INSERT INTO public.moon VALUES ('Titania', 13, 9, 1577, false);
INSERT INTO public.moon VALUES ('Ariel', 14, 9, 1157, false);
INSERT INTO public.moon VALUES ('Miranda', 15, 9, 471, false);
INSERT INTO public.moon VALUES ('Umbriel', 16, 9, 1169, false);
INSERT INTO public.moon VALUES ('Triton', 17, 10, 2707, false);
INSERT INTO public.moon VALUES ('Nereid', 18, 10, 340, false);
INSERT INTO public.moon VALUES ('Naiad', 19, 10, 66, false);
INSERT INTO public.moon VALUES ('Proteus', 20, 10, 420, false);
INSERT INTO public.moon VALUES ('Janus', 21, 8, 179, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Mercury', 1, 4, false, 'Terrestrial');
INSERT INTO public.planet VALUES ('Venus', 2, 4, false, 'Terrestrial');
INSERT INTO public.planet VALUES ('Earth', 3, 4, true, 'Terrestrial');
INSERT INTO public.planet VALUES ('Kepler-442b', 4, 6, true, 'Terrestrial');
INSERT INTO public.planet VALUES ('Proxima Centauri b', 5, 1, true, 'Terrestrial');
INSERT INTO public.planet VALUES ('Mars', 6, 4, false, 'Terrestrial');
INSERT INTO public.planet VALUES ('Jupiter', 7, 4, false, 'Gas Giant');
INSERT INTO public.planet VALUES ('Saturn', 8, 4, false, 'Gas Giant');
INSERT INTO public.planet VALUES ('Uranus', 9, 4, false, 'Ice Giant');
INSERT INTO public.planet VALUES ('Neptune', 10, 4, false, 'Ice Giant');
INSERT INTO public.planet VALUES ('TRAPPIST-1b', 11, 7, false, 'Terrestial');
INSERT INTO public.planet VALUES ('Kepler-186f', 12, 6, NULL, 'Terrestrial or Ocean planet');


--
-- Data for Name: space_telesc; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.space_telesc VALUES (1, 'NASA', '1989-11-18', 'COBE');
INSERT INTO public.space_telesc VALUES (2, 'ISRO', '1980-03-14', 'Aryabhata');
INSERT INTO public.space_telesc VALUES (3, 'USSR', '1965-07-16', 'Proton-1');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Proxima Centauri', 1, 4.85, 3042, 1);
INSERT INTO public.star VALUES ('R136a1', 5, 0.00114, 46000, 2);
INSERT INTO public.star VALUES ('Sun', 1, 4.6, 5772, 4);
INSERT INTO public.star VALUES ('VHK 83', 6, NULL, 27500, 5);
INSERT INTO public.star VALUES ('Kepler 186', 1, 4, 23755, 6);
INSERT INTO public.star VALUES ('TRAPPIST-1', 1, 7.6, 2566, 7);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: space_telesc_space_telesc_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.space_telesc_space_telesc_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


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
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: space_telesc space_telesc_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_telesc
    ADD CONSTRAINT space_telesc_name_key UNIQUE (name);


--
-- Name: space_telesc space_telesc_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_telesc
    ADD CONSTRAINT space_telesc_pkey PRIMARY KEY (space_telesc_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


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
-- PostgreSQL database dump complete
--

