PostgreSQL database dump
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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(45) NOT NULL,
    english_name character varying(45),
    main_star character varying(45) NOT NULL,
    associated_galaxy character varying(45),
    area_square_degrees integer,
    galaxy_id integer
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(45) NOT NULL,
    type text NOT NULL,
    hubble_image boolean,
    distance_from_earth_million_light_years numeric,
    galaxy_radius_light_years integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(45) NOT NULL,
    hosting_planet character varying(45),
    diameter_miles integer NOT NULL,
    distance_from_planet_miles numeric,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(45) NOT NULL,
    hosting_star character varying(45) NOT NULL,
    planet_type text,
    planet_radius text,
    planet_mass text,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(45) NOT NULL,
    associated_galaxy character varying(45),
    type text,
    star_radius_km numeric NOT NULL,
    visible_without_telescope boolean,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (2, 'Ursa Minor', 'Little Bear', 'Polaris', 'Ursa Minor Dwarf', 256, NULL);
INSERT INTO public.constellation VALUES (4, 'Saggitarius', 'Archer', 'Pistol Star', 'Saggitarius Dwarf', 867, NULL);
INSERT INTO public.constellation VALUES (3, 'Triangulum', 'Triangle', 'NGC 604', 'Triangulum', 132, 3);
INSERT INTO public.constellation VALUES (1, 'Andromeda', 'Andromeda', 'Alpheratz', 'Andromeda', 722, 1);
INSERT INTO public.constellation VALUES (6, 'Ursa Major', 'Big Bear', 'Alkaid', 'Pinwheel', 1280, 2);
INSERT INTO public.constellation VALUES (5, 'Lupus', 'Wolf', 'Alpha Lupi', 'Milky Way', 34, 4);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (5, 'Ursa Major I Dwarf', 'Dwarf', true, 0.33, NULL);
INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'Spiral', true, 2.537, 100000);
INSERT INTO public.galaxy VALUES (2, 'Pinwheel', 'Spiral', true, 20.87, 85000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', true, 2.723, 30000);
INSERT INTO public.galaxy VALUES (4, 'Milky Way', 'Spiral', true, NULL, 52850);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'Spiral', true, 23.16, 30000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (9, 'Charon', 'pluto', 753, 12200, NULL);
INSERT INTO public.moon VALUES (4, 'Europa', 'Jupiter', 1940, 42758, 9);
INSERT INTO public.moon VALUES (5, 'Io', 'Jupiter', 2264, 261592, 9);
INSERT INTO public.moon VALUES (12, 'Ganymede', 'Jupiter', 3274, 663763, 9);
INSERT INTO public.moon VALUES (13, 'Callisto', 'Jupiter', 2995, 1180605, 9);
INSERT INTO public.moon VALUES (14, 'Amalthea', 'Jupiter', 104, 112716, 9);
INSERT INTO public.moon VALUES (15, 'Leda', 'Jupiter', 6, 6900000, 9);
INSERT INTO public.moon VALUES (16, 'Kore', 'Jupiter', 12, 15200000, 9);
INSERT INTO public.moon VALUES (17, 'Mneme', 'Jupiter', 12, 13000000, 9);
INSERT INTO public.moon VALUES (1, 'Enceladus', 'Saturn', 313, 148000, 11);
INSERT INTO public.moon VALUES (2, 'Titan', 'Saturn', 3200, 759000, 11);
INSERT INTO public.moon VALUES (10, 'Iapetus', 'Saturn', 913, 2213000, 11);
INSERT INTO public.moon VALUES (11, 'Mimas', 'Saturn', 246, 115000, 11);
INSERT INTO public.moon VALUES (18, 'Atlas', 'Saturn', 18, 85544, 11);
INSERT INTO public.moon VALUES (20, 'Helene', 'Saturn', 22, 234505, 11);
INSERT INTO public.moon VALUES (6, 'Moon', 'Earth', 2159, 240587, 10);
INSERT INTO public.moon VALUES (7, 'Miranda', 'Uranus', 293, 80654, 7);
INSERT INTO public.moon VALUES (8, 'Ariel', 'Uranus', 719, 118620, 7);
INSERT INTO public.moon VALUES (3, 'Phobos', 'Mars', 14, 3700, 3);
INSERT INTO public.moon VALUES (21, 'Carpo', 'Jupiter', 2, 11000000, 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (4, '47 Ursae Majoris b', '47 Ursae Majoris', 'Gas giant', '1.18 Jupiter', '2.53 Jupiter', NULL);
INSERT INTO public.planet VALUES (5, '42 Draconis b', '42 Draconis', 'Gas giant', '1.16 Jupiter', '3.88 Jupiter', NULL);
INSERT INTO public.planet VALUES (3, 'Mars', 'Sun', 'Terrestrial', '0.53 Earths', '0.1 Earths', 6);
INSERT INTO public.planet VALUES (6, 'Venus', 'Sun', 'Terrestrial', '0.94 Earths', '0.815 Earths', 6);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Sun', 'Ice giant', '4 Earths', '14.53 Earths', 6);
INSERT INTO public.planet VALUES (8, 'Mercury', 'Sun', 'Terrestrial', '0.33 Earths', '0.055 Earths', 6);
INSERT INTO public.planet VALUES (9, 'Jupiter', 'Sun', 'Gas giant', '1300 Earths', '317.8 Earths', 6);
INSERT INTO public.planet VALUES (10, 'Earth', 'Sun', 'Terrestrial', '3959 miles', '5.972x10^21 T', 6);
INSERT INTO public.planet VALUES (11, 'Saturn', 'Sun', 'Gas giant', '9.449 Earths', '95 Earths', 6);
INSERT INTO public.planet VALUES (12, 'Epic 201238110 b', 'Epic 201238110', 'Super Earth', '1.87 Earths', '4.16 Earths', 3);
INSERT INTO public.planet VALUES (2, '14 Andromedae b', 'Veritate', 'Gas giant', '1.15 Jupiter', '4.8 Jupiter', 1);
INSERT INTO public.planet VALUES (1, 'Keppler 11 b', 'Keppler 11', 'Terrestrial', '1.8 Earths', '1.9 Earths', 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Veritate', 'Milky Way', 'K-type', 6470074, true, 4);
INSERT INTO public.star VALUES (2, 'Keppler 11', 'Milky Way', 'G-type', 710316, false, 4);
INSERT INTO public.star VALUES (3, 'Epic 201238110', 'Milky Way', 'M-type', 0, false, 4);
INSERT INTO public.star VALUES (5, 'KW Sagitarii', 'Milky Way', 'M-type', 0, true, 4);
INSERT INTO public.star VALUES (6, 'Sun', 'Milky Way', 'G-type', 1392000, true, 4);
INSERT INTO public.star VALUES (4, 'Alkaid', 'Pinwheel', 'B-type', 1469800, false, 2);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy galaxy_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_unique UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


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
-- Name: star star_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_unique UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: constellation unique_constellation_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT unique_constellation_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: constellation constellation_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

