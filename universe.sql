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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(100) NOT NULL,
    iau_code character varying(50),
    principal_star character varying(100)
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    origin_of_name text,
    constellation character varying(100),
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
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    gm character varying(50),
    radius character varying(50),
    density character varying(50),
    magnitude character varying(50)
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
    name character varying(100) NOT NULL,
    age_in_billions_of_years numeric(3,3),
    number_of_moons integer,
    diameter integer,
    density integer,
    has_ring_system boolean,
    has_global_magnetic_field boolean,
    star_id integer NOT NULL
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
    name character varying(100) NOT NULL,
    galaxy_id integer,
    designation character varying(100),
    constellation_id integer
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (476, 'Scutum', 'Sct', 'α Scuti');
INSERT INTO public.constellation VALUES (477, 'Volans', 'Vol', 'β Volantis');
INSERT INTO public.constellation VALUES (478, 'Tucana', 'Tuc', 'α Tucanae');
INSERT INTO public.constellation VALUES (479, 'Ursa Major', 'UMa', 'Alioth');
INSERT INTO public.constellation VALUES (480, 'Triangulum', 'Tri', 'β Trianguli');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (193, 'Milky Way', 'This is the galaxy that contains Earth', '', ' it is named after the nebulosity in the night sky that marks the densest concentration of stars of our galaxy in the sky, which appears to blur together into a faint glow, called the Milky Way.,');
INSERT INTO public.galaxy VALUES (194, 'Andromeda', 'Commonly just Andromeda', '', ' this, called the Andromeda Galaxy, Andromeda Nebula, Great Andromeda Nebula, Andromeda Spiral Nebula, and such, has been traditionally called Andromeda, after the constellation in which it lies.,');
INSERT INTO public.galaxy VALUES (195, 'Black Eye Galaxy', 'It has a spectacular dark band of absorbing dust in front of the galaxys bright nucleus', '', ' giving rise to its nicknames of the Black Eye or Evil Eye galaxy.');
INSERT INTO public.galaxy VALUES (196, 'Bodes Galaxy', 'Named for Johann Elert Bode who discovered this galaxy in 1774.', 'UMa', '');
INSERT INTO public.galaxy VALUES (197, 'Cartwheel Galaxy', 'Its visual appearance is similar to that of a spoked cartwheel.', '', '');
INSERT INTO public.galaxy VALUES (198, 'Cigar Galaxy', 'Appears similar in shape to a cigar.', 'UMa', '');
INSERT INTO public.galaxy VALUES (199, 'Comet Galaxy', 'This galaxy is named after its unusual appearance', '', ' looking like a comet.,The comet effect is caused by tidal stripping by its galaxy cluster, Abell 2667.');
INSERT INTO public.galaxy VALUES (200, 'Hoags Object', 'This is named after Art Hoag', '', ' who discovered this ring galaxy.,It is of the subtype Hoag-type galaxy, and may in fact be a polar-ring galaxy with the ring in the plane of rotation of the central object.');
INSERT INTO public.galaxy VALUES (201, 'Large Magellanic Cloud', 'Named after Ferdinand Magellan', '', 'This is the fourth largest galaxy in the Local Group, and forms a pair with the SMC, and from recent research, may not be part of the Milky Way system of satellites at all.');
INSERT INTO public.galaxy VALUES (202, 'Small Magellanic Cloud', 'Named after Ferdinand Magellan', 'Tuc', 'This forms a pair with the LMC, and from recent research, may not be part of the Milky Way system of satellites at all.');
INSERT INTO public.galaxy VALUES (203, 'Mayalls Object', 'This is named after Nicholas U. Mayall', 'UMa', ' of the Lick Observatory, who discovered it.,Also called VV 32 and Arp 148, this is a very peculiar looking object, and is likely to be not one galaxy, but two galaxies undergoing a collision. Event in images is a spindle shape and a ring shape.');
INSERT INTO public.galaxy VALUES (204, 'Pinwheel Galaxy', 'Similar in appearance to a pinwheel (toy).', 'UMa', '');
INSERT INTO public.galaxy VALUES (205, 'Sombrero Galaxy', 'Similar in appearance to a sombrero.', '', '');
INSERT INTO public.galaxy VALUES (206, 'Sunflower Galaxy', '', '', '');
INSERT INTO public.galaxy VALUES (207, 'Tadpole Galaxy', 'The name comes from the resemblance of the galaxy to a tadpole.', '', 'This shape resulted from tidal interaction that drew out a long tidal tail.');
INSERT INTO public.galaxy VALUES (208, 'Whirlpool Galaxy', 'From the whirlpool appearance this gravitationally disturbed galaxy exhibits.', '', '');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (116, 'Moon', 64, '4902.801±0.001', '1737.5±0.1', '3.344±0.005', '-12.74');
INSERT INTO public.moon VALUES (117, 'Phobos', 65, '0.0007112±0.0000010', '11.1±0.15', '1.872±0.076', '11.4±0.2');
INSERT INTO public.moon VALUES (118, 'Deimos', 65, '0.0000985±0.0000024', '6.2±0.18', '1.471±0.166', '12.45±0.05');
INSERT INTO public.moon VALUES (119, 'Io', 66, '5959.916±0.012', '1821.6±0.5', '3.528±0.006', '5.02±0.03');
INSERT INTO public.moon VALUES (120, 'Europa', 66, '3202.739±0.009', '1560.8±0.5', '3.013±0.005', '5.29±0.02');
INSERT INTO public.moon VALUES (121, 'Ganymede', 66, '9887.834±0.017', '2631.2±1.7', '1.942±0.005', '4.61±0.03');
INSERT INTO public.moon VALUES (122, 'Callisto', 66, '7179.289±0.013', '2410.3±1.5', '1.834±0.004', '5.65±0.10');
INSERT INTO public.moon VALUES (123, 'Amalthea', 66, '0.138±0.030', '83.45±2.4', '0.849±0.199', '14.1±0.2');
INSERT INTO public.moon VALUES (124, 'Himalia', 66, '0.45', '85', '2.6', '14.2R');
INSERT INTO public.moon VALUES (125, 'Elara', 66, '0.058', '43', '2.6', '16.0R');
INSERT INTO public.moon VALUES (126, 'Pasiphae', 66, '0.020', '30', '2.6', '16.8R');
INSERT INTO public.moon VALUES (127, 'Sinope', 66, '0.0050', '19', '2.6', '18.2R');
INSERT INTO public.moon VALUES (128, 'Lysithea', 66, '0.0042', '18', '2.6', '18.1R');
INSERT INTO public.moon VALUES (129, 'Carme', 66, '0.0088', '23', '2.6', '18.1R');
INSERT INTO public.moon VALUES (130, 'Ananke', 66, '0.0020', '14', '2.6', '19.1R');
INSERT INTO public.moon VALUES (131, 'Leda', 66, '0.00073', '10', '2.6', '19.2R');
INSERT INTO public.moon VALUES (132, 'Thebe', 66, '0.10', '49.3±2.0', '3.0', '16.0');
INSERT INTO public.moon VALUES (133, 'Adrastea', 66, '0.0005', '8.2±2.0', '3.0', '18.7');
INSERT INTO public.moon VALUES (134, 'Metis', 66, '0.008', '21.5±2.0', '3.0', '17.5');
INSERT INTO public.moon VALUES (135, 'Callirrhoe', 66, '0.000058', '4.3', '2.6', '20.8R');
INSERT INTO public.moon VALUES (136, 'Themisto', 66, '0.000046', '4.0', '2.6', '21.0R');
INSERT INTO public.moon VALUES (137, 'Megaclite', 66, '0.000014', '2.7', '2.6', '21.7R');
INSERT INTO public.moon VALUES (138, 'Taygete', 66, '0.000011', '2.5', '2.6', '21.9R');
INSERT INTO public.moon VALUES (139, 'Chaldene', 66, '0.000005', '1.9', '2.6', '22.5R');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (62, 'Mercury', NULL, 0, 4879, 5427, NULL, NULL, 297);
INSERT INTO public.planet VALUES (63, 'Venus', NULL, 0, 12104, 5243, NULL, NULL, 297);
INSERT INTO public.planet VALUES (64, 'Earth', NULL, 1, 12756, 5514, NULL, NULL, 297);
INSERT INTO public.planet VALUES (65, 'Mars', NULL, 2, 6792, 3933, NULL, NULL, 297);
INSERT INTO public.planet VALUES (66, 'Jupiter', NULL, 79, 142984, 1326, NULL, NULL, 297);
INSERT INTO public.planet VALUES (67, 'Saturn', NULL, 62, 120536, 687, NULL, NULL, 297);
INSERT INTO public.planet VALUES (68, 'Uranus', NULL, 27, 51118, 1271, NULL, NULL, 297);
INSERT INTO public.planet VALUES (69, 'Neptune', NULL, 14, 49528, 1638, NULL, NULL, 297);
INSERT INTO public.planet VALUES (70, 'Pluto', NULL, 5, 2370, 2095, NULL, NULL, 297);
INSERT INTO public.planet VALUES (71, 'Fakeus', NULL, 5, 5460, 2095, NULL, NULL, 299);
INSERT INTO public.planet VALUES (72, 'Madeupiter', NULL, 5, 3333, 5456, NULL, NULL, 305);
INSERT INTO public.planet VALUES (73, 'Isafakeplanet', NULL, 5, 1545, 3344, NULL, NULL, 300);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (297, 'Sun', 193, 'G2V', NULL);
INSERT INTO public.star VALUES (298, 'Brachium', 193, 'HR 5603', NULL);
INSERT INTO public.star VALUES (299, 'Capella', 193, 'HR 1708', NULL);
INSERT INTO public.star VALUES (300, 'Atria', 193, 'HR 6217', NULL);
INSERT INTO public.star VALUES (301, 'Cebalrai', 193, 'HR 6603', NULL);
INSERT INTO public.star VALUES (302, 'Hatysa', 193, 'HR 1899', NULL);
INSERT INTO public.star VALUES (303, 'Gomeisa', 193, 'HR 2845', NULL);
INSERT INTO public.star VALUES (304, 'Chara', 193, 'HR 4785', NULL);
INSERT INTO public.star VALUES (305, 'Denebola', 193, 'HR 4534', NULL);
INSERT INTO public.star VALUES (306, 'Enif', 193, 'HR 8308', NULL);
INSERT INTO public.star VALUES (307, 'Chalawan', 193, 'HR 4277', NULL);
INSERT INTO public.star VALUES (308, 'Rasalgethi', 193, 'HR 6406', NULL);
INSERT INTO public.star VALUES (309, 'Sualocin', 193, 'HR 7906', NULL);
INSERT INTO public.star VALUES (310, 'Sadalsuud', 193, 'HR 8232', NULL);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 480, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 208, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 139, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 73, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 310, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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
-- Name: star star_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

