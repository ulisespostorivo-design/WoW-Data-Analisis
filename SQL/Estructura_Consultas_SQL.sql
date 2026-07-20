--
-- PostgreSQL database dump
--

\restrict Fwq6wsp7V7JTC9nzQMu9zL9SutLMIjM646BwWvkppcA5pGLSC2rsDWJtcuAaaIa

-- Dumped from database version 18.4
-- Dumped by pg_dump version 18.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: d_categoria_producto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.d_categoria_producto (
    id_categoria_producto integer NOT NULL,
    categoria_producto_nombre character varying(50) NOT NULL
);


ALTER TABLE public.d_categoria_producto OWNER TO postgres;

--
-- Name: d_convertibilidad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.d_convertibilidad (
    convertibilidad_moneda character varying(10) NOT NULL,
    convertibilidad_valor_cobre integer NOT NULL
);


ALTER TABLE public.d_convertibilidad OWNER TO postgres;

--
-- Name: d_correo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.d_correo (
    id_correo integer NOT NULL,
    comision_correo numeric(6,5) NOT NULL,
    comision real
);


ALTER TABLE public.d_correo OWNER TO postgres;

--
-- Name: d_deposito; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.d_deposito (
    tiempo_deposito integer NOT NULL,
    porcentaje_deposito numeric(6,5) NOT NULL
);


ALTER TABLE public.d_deposito OWNER TO postgres;

--
-- Name: d_gema_valor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.d_gema_valor (
    id_gema_valor integer NOT NULL,
    calidad_gema_valor character varying(50) NOT NULL,
    precio_valor_cobre integer NOT NULL
);


ALTER TABLE public.d_gema_valor OWNER TO postgres;

--
-- Name: d_gemas_atributos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.d_gemas_atributos (
    id_gemas_atributos integer NOT NULL,
    gemas_atributos character varying(100) NOT NULL,
    nombre_gemas_atributos character varying(100) NOT NULL
);


ALTER TABLE public.d_gemas_atributos OWNER TO postgres;

--
-- Name: d_id_objectos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.d_id_objectos (
    id_objectos integer NOT NULL,
    nombre_objectos character varying(100) NOT NULL,
    categoria_objectos character varying(50)
);


ALTER TABLE public.d_id_objectos OWNER TO postgres;

--
-- Name: d_recetas_id; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.d_recetas_id (
    id_recetas integer NOT NULL,
    recetas_nombre character varying(50) NOT NULL,
    categoria_recetas_id integer NOT NULL
);


ALTER TABLE public.d_recetas_id OWNER TO postgres;

--
-- Name: d_recetas_materiales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.d_recetas_materiales (
    id_recetas_materiales integer NOT NULL,
    id_objectos_receta_materiales integer NOT NULL,
    cantidad_recetas_materiales integer NOT NULL
);


ALTER TABLE public.d_recetas_materiales OWNER TO postgres;

--
-- Name: d_tipo_recoleccion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.d_tipo_recoleccion (
    id_tipo_recoleccion integer NOT NULL,
    tipo_recoleccion character varying(30) NOT NULL
);


ALTER TABLE public.d_tipo_recoleccion OWNER TO postgres;

--
-- Name: d_venta_estado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.d_venta_estado (
    id_venta_estado integer NOT NULL,
    venta_estado character varying(50) NOT NULL
);


ALTER TABLE public.d_venta_estado OWNER TO postgres;

--
-- Name: d_venta_metodo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.d_venta_metodo (
    id_venta_metodo integer NOT NULL,
    venta_metodo character varying(50) NOT NULL
);


ALTER TABLE public.d_venta_metodo OWNER TO postgres;

--
-- Name: r_consumo_lotes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.r_consumo_lotes (
    orden_consumo_lotes integer NOT NULL,
    id_consumo_lotes integer NOT NULL,
    cantidad_consumo_lotes integer NOT NULL,
    fecha_consumo_lotes date NOT NULL
);


ALTER TABLE public.r_consumo_lotes OWNER TO postgres;

--
-- Name: r_consumos_objectos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.r_consumos_objectos (
    orden_consumos_objectos integer NOT NULL,
    id_consumos_objectos integer NOT NULL,
    consumos_objectos_cantidad integer NOT NULL,
    obtengo_consumos_objectos_id integer NOT NULL,
    obtengo_consumos_objectos_cantidad integer NOT NULL,
    fecha_consumos_objectos date NOT NULL,
    categoria_consumos_objectos integer NOT NULL
);


ALTER TABLE public.r_consumos_objectos OWNER TO postgres;

--
-- Name: r_gasto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.r_gasto (
    orden_gasto integer NOT NULL,
    gasto_id integer NOT NULL,
    gasto_cantidad integer NOT NULL,
    gasto_precio integer NOT NULL,
    gasto_fecha date NOT NULL
);


ALTER TABLE public.r_gasto OWNER TO postgres;

--
-- Name: r_gemas_pulidas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.r_gemas_pulidas (
    orden_gemas_pulidas integer NOT NULL,
    id_gemas_pulidas integer NOT NULL,
    cantidad_gemas_pulidas integer NOT NULL,
    atributos_1_gemas_pulidas integer NOT NULL,
    atributos_2_gemas_pulidas integer NOT NULL,
    fecha_gemas_pulidas date NOT NULL
);


ALTER TABLE public.r_gemas_pulidas OWNER TO postgres;

--
-- Name: r_prospeccion_lotes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.r_prospeccion_lotes (
    orden_prospeccion_lotes integer NOT NULL,
    id_mineral_prospeccion_lotes integer NOT NULL,
    cantidad_menas_prospeccion_lotes integer NOT NULL,
    fecha_prospeccion_lotes date NOT NULL
);


ALTER TABLE public.r_prospeccion_lotes OWNER TO postgres;

--
-- Name: r_prospeccion_resultados; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.r_prospeccion_resultados (
    orden_prospeccion_resultados integer NOT NULL,
    lote_prospeccion_resultados integer NOT NULL,
    id_gema_prospeccion_resultados integer CONSTRAINT r_prospeccion_resultados_id_gema_prospeccion_resultado_not_null NOT NULL,
    cantidad_prospeccion_resultados integer CONSTRAINT r_prospeccion_resultados_cantidad_prospeccion_resultad_not_null NOT NULL
);


ALTER TABLE public.r_prospeccion_resultados OWNER TO postgres;

--
-- Name: r_recetas_consumo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.r_recetas_consumo (
    orden_recetas_consumo integer NOT NULL,
    id_recetas_consumo integer NOT NULL,
    cantidad_recetas_consumo integer NOT NULL,
    fecha_recetas_consumo date NOT NULL
);


ALTER TABLE public.r_recetas_consumo OWNER TO postgres;

--
-- Name: r_recoleccion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.r_recoleccion (
    orden_recoleccion integer NOT NULL,
    id_objecto_recoleccion integer NOT NULL,
    cantidad_recoleccion integer NOT NULL,
    fecha_recoleccion date NOT NULL,
    hora_inicio time without time zone NOT NULL,
    hora_fin time without time zone NOT NULL,
    categoria_recoleccion integer NOT NULL,
    metodo_recoleccion integer NOT NULL
);


ALTER TABLE public.r_recoleccion OWNER TO postgres;

--
-- Name: r_registro_poblacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.r_registro_poblacion (
    orden_poblacion integer NOT NULL,
    fecha_poblacion date NOT NULL,
    hora_poblacion time without time zone NOT NULL,
    total_poblacion integer NOT NULL,
    poblacion_80 integer NOT NULL
);


ALTER TABLE public.r_registro_poblacion OWNER TO postgres;

--
-- Name: r_transmutaciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.r_transmutaciones (
    orden_transmutaciones integer NOT NULL,
    receta_transmutaciones integer NOT NULL,
    cantidad_transmutaciones integer NOT NULL,
    fecha_transmutaciones date NOT NULL
);


ALTER TABLE public.r_transmutaciones OWNER TO postgres;

--
-- Name: r_transmutaciones_resultados; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.r_transmutaciones_resultados (
    orden_transmutaciones_resultados integer CONSTRAINT r_transmutaciones_resultado_orden_transmutaciones_resu_not_null NOT NULL,
    orden_transmutacion integer NOT NULL,
    obtengo_objecto_transmutaciones_resultados integer CONSTRAINT r_transmutaciones_resultado_obtengo_objecto_transmutac_not_null NOT NULL,
    obtengo_cantidad_transmutaciones_resultados integer CONSTRAINT r_transmutaciones_resultado_obtengo_cantidad_transmuta_not_null NOT NULL
);


ALTER TABLE public.r_transmutaciones_resultados OWNER TO postgres;

--
-- Name: r_valor_subasta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.r_valor_subasta (
    orden_valor_subasta integer NOT NULL,
    id_objecto_valor_subasta integer NOT NULL,
    precio_valor_subasta integer NOT NULL,
    fecha_valor_subasta date NOT NULL,
    hora_valor_subasta time without time zone NOT NULL
);


ALTER TABLE public.r_valor_subasta OWNER TO postgres;

--
-- Name: r_venta_gemas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.r_venta_gemas (
    orden_venta_gemas integer NOT NULL,
    orden_pulida_venta_gemas integer NOT NULL,
    id_valor_venta_gemas integer NOT NULL,
    tiempo_venta_gemas integer NOT NULL,
    precio_deposito_venta_gemas integer NOT NULL,
    valor_venta_gemas integer NOT NULL,
    estado_venta_gemas integer NOT NULL,
    resultado_venta_gemas integer NOT NULL,
    fecha_venta_gemas date NOT NULL,
    hora_venta_gemas time without time zone NOT NULL,
    metodo_venta_gemas integer NOT NULL
);


ALTER TABLE public.r_venta_gemas OWNER TO postgres;

--
-- Name: v_compras; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_compras AS
 SELECT d_id_objectos.id_objectos,
    d_id_objectos.nombre_objectos,
    sum(r_gasto.gasto_cantidad) AS sum
   FROM (public.r_gasto
     LEFT JOIN public.d_id_objectos ON ((r_gasto.gasto_id = d_id_objectos.id_objectos)))
  WHERE (d_id_objectos.id_objectos <> ALL (ARRAY[800, 904]))
  GROUP BY d_id_objectos.id_objectos, d_id_objectos.nombre_objectos;


ALTER VIEW public.v_compras OWNER TO postgres;

--
-- Name: v_gemas_pulidas; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_gemas_pulidas AS
 SELECT d_id_objectos.id_objectos,
    d_id_objectos.nombre_objectos,
    sum(r_gemas_pulidas.cantidad_gemas_pulidas) AS sum
   FROM (public.r_gemas_pulidas
     LEFT JOIN public.d_id_objectos ON ((r_gemas_pulidas.id_gemas_pulidas = d_id_objectos.id_objectos)))
  GROUP BY d_id_objectos.id_objectos, d_id_objectos.nombre_objectos;


ALTER VIEW public.v_gemas_pulidas OWNER TO postgres;

--
-- Name: v_gemas_total; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_gemas_total AS
 SELECT minerales.nombre_objectos AS nombre_mineral,
    gemas.id_objectos AS id_gema,
    gemas.nombre_objectos AS nombre_gema,
    sum(resultados.cantidad_prospeccion_resultados) AS sum
   FROM (((public.r_prospeccion_resultados resultados
     JOIN public.r_prospeccion_lotes lotes ON ((resultados.lote_prospeccion_resultados = lotes.orden_prospeccion_lotes)))
     LEFT JOIN public.d_id_objectos minerales ON ((lotes.id_mineral_prospeccion_lotes = minerales.id_objectos)))
     LEFT JOIN public.d_id_objectos gemas ON ((resultados.id_gema_prospeccion_resultados = gemas.id_objectos)))
  WHERE (lotes.id_mineral_prospeccion_lotes <> 30)
  GROUP BY minerales.nombre_objectos, gemas.id_objectos, gemas.nombre_objectos;


ALTER VIEW public.v_gemas_total OWNER TO postgres;

--
-- Name: v_prospeccion_cantidad; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_prospeccion_cantidad AS
 SELECT d_id_objectos.id_objectos,
    d_id_objectos.nombre_objectos,
    sum(r_prospeccion_lotes.cantidad_menas_prospeccion_lotes) AS sum
   FROM (public.r_prospeccion_lotes
     LEFT JOIN public.d_id_objectos ON ((r_prospeccion_lotes.id_mineral_prospeccion_lotes = d_id_objectos.id_objectos)))
  WHERE (d_id_objectos.id_objectos <> 30)
  GROUP BY d_id_objectos.id_objectos, d_id_objectos.nombre_objectos;


ALTER VIEW public.v_prospeccion_cantidad OWNER TO postgres;

--
-- Name: v_recetas_cantidad_consumo; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_recetas_cantidad_consumo AS
 SELECT r_recetas_consumo.id_recetas_consumo,
    d_recetas_id.recetas_nombre,
    sum(r_recetas_consumo.cantidad_recetas_consumo) AS sum
   FROM (public.r_recetas_consumo
     LEFT JOIN public.d_recetas_id ON ((r_recetas_consumo.id_recetas_consumo = d_recetas_id.id_recetas)))
  GROUP BY r_recetas_consumo.id_recetas_consumo, d_recetas_id.recetas_nombre;


ALTER VIEW public.v_recetas_cantidad_consumo OWNER TO postgres;

--
-- Name: v_recetas_consumo; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_recetas_consumo AS
 SELECT d_id_objectos.id_objectos,
    d_id_objectos.nombre_objectos,
    sum((r_recetas_consumo.cantidad_recetas_consumo * d_recetas_materiales.cantidad_recetas_materiales)) AS sum
   FROM ((public.r_recetas_consumo
     LEFT JOIN public.d_recetas_materiales ON ((r_recetas_consumo.id_recetas_consumo = d_recetas_materiales.id_recetas_materiales)))
     LEFT JOIN public.d_id_objectos ON ((d_recetas_materiales.id_objectos_receta_materiales = d_id_objectos.id_objectos)))
  GROUP BY d_id_objectos.id_objectos, d_id_objectos.nombre_objectos;


ALTER VIEW public.v_recetas_consumo OWNER TO postgres;

--
-- Name: v_total_consumo; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_total_consumo AS
 SELECT d_id_objectos.id_objectos,
    d_id_objectos.nombre_objectos,
    sum(r_consumos_objectos.consumos_objectos_cantidad) AS sum
   FROM (public.r_consumos_objectos
     LEFT JOIN public.d_id_objectos ON ((r_consumos_objectos.id_consumos_objectos = d_id_objectos.id_objectos)))
  GROUP BY d_id_objectos.id_objectos, d_id_objectos.nombre_objectos;


ALTER VIEW public.v_total_consumo OWNER TO postgres;

--
-- Name: v_total_obtengo; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_total_obtengo AS
 SELECT d_id_objectos.id_objectos,
    d_id_objectos.nombre_objectos,
    sum(r_consumos_objectos.obtengo_consumos_objectos_cantidad) AS sum
   FROM (public.r_consumos_objectos
     LEFT JOIN public.d_id_objectos ON ((r_consumos_objectos.obtengo_consumos_objectos_id = d_id_objectos.id_objectos)))
  GROUP BY d_id_objectos.id_objectos, d_id_objectos.nombre_objectos;


ALTER VIEW public.v_total_obtengo OWNER TO postgres;

--
-- Name: v_total_prospeccion_resultados; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_total_prospeccion_resultados AS
 SELECT d_id_objectos.id_objectos,
    d_id_objectos.nombre_objectos,
    sum(r_prospeccion_resultados.cantidad_prospeccion_resultados) AS sum
   FROM (public.r_prospeccion_resultados
     LEFT JOIN public.d_id_objectos ON ((r_prospeccion_resultados.id_gema_prospeccion_resultados = d_id_objectos.id_objectos)))
  GROUP BY d_id_objectos.id_objectos, d_id_objectos.nombre_objectos;


ALTER VIEW public.v_total_prospeccion_resultados OWNER TO postgres;

--
-- Name: v_total_recoleccion; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_total_recoleccion AS
 SELECT d_id_objectos.id_objectos,
    d_id_objectos.nombre_objectos,
    sum(r_recoleccion.cantidad_recoleccion) AS sum,
    d_tipo_recoleccion.tipo_recoleccion
   FROM ((public.r_recoleccion
     LEFT JOIN public.d_id_objectos ON ((r_recoleccion.id_objecto_recoleccion = d_id_objectos.id_objectos)))
     LEFT JOIN public.d_tipo_recoleccion ON ((d_tipo_recoleccion.id_tipo_recoleccion = r_recoleccion.metodo_recoleccion)))
  GROUP BY d_id_objectos.id_objectos, d_id_objectos.nombre_objectos, d_tipo_recoleccion.tipo_recoleccion;


ALTER VIEW public.v_total_recoleccion OWNER TO postgres;

--
-- Name: v_transmutaciones_consumo; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_transmutaciones_consumo AS
 SELECT d_id_objectos.id_objectos,
    d_id_objectos.nombre_objectos,
    sum((r_transmutaciones.cantidad_transmutaciones * d_recetas_materiales.cantidad_recetas_materiales)) AS sum
   FROM ((public.r_transmutaciones
     LEFT JOIN public.d_recetas_materiales ON ((r_transmutaciones.receta_transmutaciones = d_recetas_materiales.id_recetas_materiales)))
     LEFT JOIN public.d_id_objectos ON ((d_recetas_materiales.id_objectos_receta_materiales = d_id_objectos.id_objectos)))
  GROUP BY d_id_objectos.id_objectos, d_id_objectos.nombre_objectos;


ALTER VIEW public.v_transmutaciones_consumo OWNER TO postgres;

--
-- Name: v_transmutaciones_obtengo; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_transmutaciones_obtengo AS
 SELECT d_id_objectos.id_objectos,
    d_id_objectos.nombre_objectos,
    sum(r_transmutaciones_resultados.obtengo_cantidad_transmutaciones_resultados) AS sum
   FROM (public.r_transmutaciones_resultados
     LEFT JOIN public.d_id_objectos ON ((r_transmutaciones_resultados.obtengo_objecto_transmutaciones_resultados = d_id_objectos.id_objectos)))
  GROUP BY d_id_objectos.id_objectos, d_id_objectos.nombre_objectos;


ALTER VIEW public.v_transmutaciones_obtengo OWNER TO postgres;

--
-- Data for Name: d_categoria_producto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.d_categoria_producto (id_categoria_producto, categoria_producto_nombre) FROM stdin;
1	mineria
2	botin
3	joyeria
10	fabricacion
11	mision
101	anillo
102	collar
103	abalorio
200	transmutacion
\.


--
-- Data for Name: d_convertibilidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.d_convertibilidad (convertibilidad_moneda, convertibilidad_valor_cobre) FROM stdin;
cobre	1
plata	100
oro	10000
\.


--
-- Data for Name: d_correo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.d_correo (id_correo, comision_correo, comision) FROM stdin;
1	0.00750	\N
\.


--
-- Data for Name: d_deposito; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.d_deposito (tiempo_deposito, porcentaje_deposito) FROM stdin;
0	0.00000
12	0.03750
24	0.07500
48	0.15000
\.


--
-- Data for Name: d_gema_valor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.d_gema_valor (id_gema_valor, calidad_gema_valor, precio_valor_cobre) FROM stdin;
1	comun	5000
2	rara	45000
3	epica	90000
4	meta	60000
\.


--
-- Data for Name: d_gemas_atributos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.d_gemas_atributos (id_gemas_atributos, gemas_atributos, nombre_gemas_atributos) FROM stdin;
0	nada	nada
1	fuerza	propiedades
2	agilidad	propiedades
3	aguante	propiedades
4	intelecto	propiedades
5	espiritu	propiedades
6	poder con hechizos	propiedades
7	poder de ataque	propiedades
8	indice de golpe critico	propiedades
9	indice de celeridad	propiedades
10	indice de penetracion de armadura	propiedades
11	indice de golpe	propiedades
12	indice de pericia	propiedades
13	indice de defensa	propiedades
14	indice de esquive	propiedades
15	indice de parada	propiedades
16	indice de temple	propiedades
17	penetracion de hechizos	propiedades
18	mana por 5 segundos mp5	propiedades
19	indice de bloqueo con escudo	propiedades
20	valor de bloqueo de escudo	propiedades
21	% dano critico aumentado	propiedades
22	% efecto de sanacion aumentado	propiedades
23	% reduccion de duracion de aturdimiento	propiedades
24	% reduccion de duracion de polimorfia	propiedades
25	velocidad de movimiento aumentada	propiedades
26	resistencia a la magia	propiedades
27	+32 aguante y 2% mas armadura de objetos	diamante de asedio de tierra austero
28	+21 indice de golpe critico y +2% mana	diamante de asedio de tierra radiante
29	+25 poder con hechizos y 2% menos amenaza	diamante de asedio de tierra protector
30	+21 indice de golpe critico y 3% mas dano critico	diamante de resplandor celeste caotico
31	+25 indice de golpe critico y 1% reflejo de hechizos	diamante de resplandor celeste destructivo
32	+32 aguante y 2% menos dano magico recibido	diamante de resplandor celeste escudado
33	+25 poder con hechizos y +2% intelecto	diamante de resplandor celeste de ascuas
34	+21 indice de golpe critico y 10% menos duracion de raices/lentitud	diamante de resplandor celeste enigmatico
35	+17 indice de golpe critico y 10% menos duracion de raices/lentitud	diamante de resplandor estelar enigmatico
36	+21 defensa y +5% valor de bloqueo	diamante de asedio de tierra eterno
37	+25 poder con hechizos y 10% menos duracion de silencio	diamante de resplandor celeste desolado
38	+20 poder con hechizos y 10% menos duracion de silencio	diamante de resplandor estelar desolado
39	+21 indice de golpe critico y 10% menos duracion de miedo	diamante de resplandor celeste impasible
40	+17 indice de golpe critico y 10% menos duracion de miedo	diamante de resplandor estelar impasible
41	+21 intelecto y probabilidad de restaurar mana al lanzar hechizos	diamante de asedio de tierra perspicaz
42	+42 poder de ataque y posibilidad de curarte en criticos	diamante de asedio de tierra vigorizante
43	+34 poder de ataque y 10% menos duracion de stun	diamante de machacatierra persistente
44	+42 poder de ataque y 10% menos duracion de stun	diamante de asedio de tierra persistente
45	+26 aguante y 10% menos duracion de stun	diamante de machacatierra poderoso
46	+32 aguante y 10% menos duracion de stun	diamante de asedio de tierra poderoso
47	+21 agilidad y 3% mas dano critico	diamante de asedio de tierra implacable
48	+11 mana cada 5 s y 3% mas sanacion critica	diamante de resplandor celeste revitalizante
49	+42 poder de ataque y velocidad de movimiento menor aumentada	diamante de resplandor celeste veloz
50	+34 poder de ataque y velocidad de movimiento menor aumentada	diamante de resplandor estelar veloz
51	probabilidad de aumentar velocidad de ataque cuerpo a cuerpo/distancia	diamante de resplandor celeste atronador
52	+25 poder con hechizos y velocidad de movimiento menor aumentada	diamante de resplandor celeste incansable
53	+20 poder con hechizos y velocidad de movimiento menor aumentada	diamante de resplandor estelar incansable
54	+20 poder con hechizos y 10% menos duracion de stun	diamante de machacatierra penetrante
55	+25 poder con hechizos y 10% menos duracion de stun	diamante de asedio de tierra penetrante
\.


--
-- Data for Name: d_id_objectos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.d_id_objectos (id_objectos, nombre_objectos, categoria_objectos) FROM stdin;
1	mena de cobalto	mineral
2	mena de saronita	mineral
3	mena de titanio	mineral
4	tierra cristalizada	elemental
5	agua cristalizada	elemental
6	sombra cristalizada	elemental
7	fuego cristalizado	elemental
8	aire cristalizado	elemental
9	gema roja	gema
10	gema roja rara	gema
11	gema roja epica	gema
12	gema azul	gema
13	gema azul rara	gema
14	gema azul epica	gema
15	gema amarilla	gema
16	gema amarilla rara	gema
17	gema amarilla epica	gema
18	gema morada	gema
19	gema morada rara	gema
20	gema morada epica	gema
21	gema naranja	gema
22	gema naranja rara	gema
23	gema naranja epica	gema
24	gema verde	gema
25	gema verde rara	gema
26	gema verde epica	gema
27	orbe congelado	orbe
28	vida cristalizada	elemental
29	ojo de dragon	gema
30	Prisma helado	contenedor
98	cobre	dinero
99	plata	dinero
100	oro	dinero
101	lingote cobalto	lingote
102	lingote saronita	lingote
103	lingote titanio	lingote
104	tierra eterna	eterno
105	agua eterna	eterno
106	sombra eterna	eterno
107	fuego eterno	eterno
108	aire eterno	eterno
128	vida eterna	eterno
300	diamante de llama celeste	gema
301	diamante de asedio de tierra	gema
800	montura	montura
900	mision	mision
901	muestra de joyero	dinero
902	collar danado	mision
903	receta	receta
904	blindaje de titanio	mejora
200	trebol de oro	planta
201	ortiga mortal	planta
202	lirio atigrado	planta
203	rosa de talandra	planta
204	lengua de viboris	planta
205	espina de hielo	planta
206	flor exanime	planta
207	loto de escarcha	planta
\.


--
-- Data for Name: d_recetas_id; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.d_recetas_id (id_recetas, recetas_nombre, categoria_recetas_id) FROM stdin;
1	prisma helado	3
100	anillo de guardian de tierra de titanio101	101
800	sortija de sangrita	101
801	anillo de poder de sombra	101
802	cangrejo monarca	103
200	Titanio	200
201	rubi cardeno	200
202	ametrino	200
203	piedra de terror	200
204	ojo de zul	200
205	ambar del rey	200
206	circon majestuoso	200
207	diamante de asedio de tierra	200
208	diamante de llama celeste	200
\.


--
-- Data for Name: d_recetas_materiales; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.d_recetas_materiales (id_recetas_materiales, id_objectos_receta_materiales, cantidad_recetas_materiales) FROM stdin;
800	4	2
800	9	1
801	104	1
801	106	1
802	104	2
1	27	1
1	12	1
1	18	1
1	24	1
802	103	2
802	22	2
802	25	1
100	103	2
100	104	4
100	27	1
100	29	4
100	128	4
200	102	8
201	10	1
201	107	1
202	22	1
202	106	1
203	19	1
203	106	1
204	25	3
205	16	1
205	128	1
206	13	1
206	108	1
207	24	1
207	21	1
207	107	1
208	9	1
208	12	1
208	108	1
\.


--
-- Data for Name: d_tipo_recoleccion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.d_tipo_recoleccion (id_tipo_recoleccion, tipo_recoleccion) FROM stdin;
0	pasivo
1	activo
\.


--
-- Data for Name: d_venta_estado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.d_venta_estado (id_venta_estado, venta_estado) FROM stdin;
0	pendiente
1	vendido
2	expirado
3	cancelado
\.


--
-- Data for Name: d_venta_metodo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.d_venta_metodo (id_venta_metodo, venta_metodo) FROM stdin;
1	subasta
2	servicio
3	regalo
\.


--
-- Data for Name: r_consumo_lotes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.r_consumo_lotes (orden_consumo_lotes, id_consumo_lotes, cantidad_consumo_lotes, fecha_consumo_lotes) FROM stdin;
1	8	5	2026-05-24
2	9	2	2026-05-24
\.


--
-- Data for Name: r_consumos_objectos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.r_consumos_objectos (orden_consumos_objectos, id_consumos_objectos, consumos_objectos_cantidad, obtengo_consumos_objectos_id, obtengo_consumos_objectos_cantidad, fecha_consumos_objectos, categoria_consumos_objectos) FROM stdin;
1	1	12	101	12	2026-05-15	10
2	4	20	104	2	2026-05-17	10
3	5	20	105	2	2026-05-17	10
4	4	40	104	4	2026-05-18	10
5	5	10	105	1	2026-05-18	10
6	4	40	104	4	2026-05-18	10
7	6	30	106	3	2026-05-18	10
8	4	50	104	5	2026-05-19	10
9	6	40	106	4	2026-05-19	10
10	5	10	105	1	2026-05-19	10
11	12	1	901	1	2026-05-19	11
12	15	1	901	1	2026-05-19	11
13	18	1	901	0	2026-05-19	11
14	15	1	901	1	2026-05-20	11
15	24	1	901	0	2026-05-20	11
16	15	1	901	1	2026-05-21	11
17	21	1	901	0	2026-05-21	11
18	6	10	106	1	2026-05-21	10
19	9	1	901	1	2026-05-22	11
20	24	1	901	0	2026-05-22	11
21	4	50	104	5	2026-05-22	10
22	6	50	106	5	2026-05-22	10
23	5	10	105	1	2026-05-22	10
24	7	10	107	1	2026-05-22	10
25	8	20	108	2	2026-05-22	10
26	15	1	901	1	2026-05-23	11
27	21	1	901	0	2026-05-23	11
28	15	1	901	1	2026-05-24	11
29	21	1	901	0	2026-05-24	11
30	3	8	103	4	2026-05-24	10
31	12	1	901	1	2026-05-24	11
32	901	6	903	1	2026-05-24	10
33	901	3	29	3	2026-05-24	10
34	15	1	901	1	2026-05-25	11
35	24	1	901	0	2026-05-25	11
36	9	1	901	1	2026-05-26	11
37	24	1	901	0	2026-05-26	11
38	15	1	901	1	2026-05-27	11
39	21	1	901	0	2026-05-27	11
40	12	1	901	1	2026-05-28	11
41	18	1	901	0	2026-05-28	11
42	15	1	901	1	2026-05-29	11
43	24	1	901	0	2026-05-29	11
44	15	1	901	1	2026-05-30	11
45	21	1	901	0	2026-05-30	11
46	12	1	901	1	2026-05-31	11
47	18	1	901	0	2026-05-31	11
48	9	1	901	1	2026-06-01	11
49	21	1	901	0	2026-06-01	11
50	9	1	901	1	2026-06-02	11
51	24	1	901	0	2026-06-02	11
52	15	1	901	1	2026-06-03	11
53	24	1	901	0	2026-06-03	11
54	12	1	901	1	2026-06-04	11
55	18	1	901	0	2026-06-04	11
56	15	1	901	1	2026-06-05	11
57	24	1	901	0	2026-06-05	11
58	21	1	901	1	2026-06-06	11
59	15	1	901	0	2026-06-06	11
60	4	70	104	7	2026-06-06	10
61	6	40	106	4	2026-06-06	10
62	5	20	105	2	2026-06-06	10
63	7	10	107	1	2026-06-06	10
64	8	20	108	2	2026-06-06	10
65	2	16	102	8	2026-06-06	10
66	2	352	102	176	2026-06-06	10
67	9	1	901	1	2026-06-07	11
68	24	1	901	0	2026-06-07	11
69	12	1	901	1	2026-06-08	11
70	18	1	901	0	2026-06-08	11
71	15	1	901	1	2026-06-09	11
72	24	1	901	0	2026-06-09	11
73	9	1	901	1	2026-06-10	11
74	24	1	901	0	2026-06-10	11
75	12	1	901	1	2026-06-11	11
76	18	1	901	0	2026-06-11	11
77	15	1	901	1	2026-06-12	11
78	24	1	901	0	2026-06-12	11
79	4	110	104	11	2026-06-13	10
80	5	30	105	3	2026-06-13	10
81	6	100	106	10	2026-06-13	10
82	7	30	107	3	2026-06-13	10
83	8	20	108	2	2026-06-13	10
84	12	1	901	1	2026-06-13	11
85	18	1	901	0	2026-06-13	11
86	9	1	901	1	2026-06-14	11
87	24	1	901	0	2026-06-14	11
88	12	1	901	1	2026-06-15	11
89	18	1	901	0	2026-06-15	11
90	18	1	901	0	2026-06-16	11
91	15	1	901	1	2026-06-16	11
92	9	1	901	1	2026-06-17	11
93	21	1	901	0	2026-06-17	11
94	15	1	901	1	2026-06-18	11
95	18	1	901	0	2026-06-18	11
\.


--
-- Data for Name: r_gasto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.r_gasto (orden_gasto, gasto_id, gasto_cantidad, gasto_precio, gasto_fecha) FROM stdin;
1	800	1	10000000	2026-05-22
2	300	2	470000	2026-05-23
3	27	5	1000000	2026-05-23
4	902	1	2500000	2026-05-24
5	29	1	1500000	2026-05-24
6	128	4	1900000	2026-05-24
7	27	1	300000	2026-05-26
8	904	1	2110000	2026-05-26
9	27	2	480000	2026-05-28
10	27	2	1450000	2026-05-30
11	27	4	1040000	2026-06-04
12	27	9	2600000	2026-06-08
13	800	1	14000000	2026-06-12
\.


--
-- Data for Name: r_gemas_pulidas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.r_gemas_pulidas (orden_gemas_pulidas, id_gemas_pulidas, cantidad_gemas_pulidas, atributos_1_gemas_pulidas, atributos_2_gemas_pulidas, fecha_gemas_pulidas) FROM stdin;
1	15	4	9	0	2026-05-19
2	15	3	11	0	2026-05-19
3	18	6	6	5	2026-05-19
4	18	3	7	3	2026-05-19
5	21	4	6	4	2026-05-19
6	21	4	7	8	2026-05-19
7	300	2	51	0	2026-05-23
8	15	5	13	0	2026-05-24
9	24	2	13	4	2026-05-24
\.


--
-- Data for Name: r_prospeccion_lotes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.r_prospeccion_lotes (orden_prospeccion_lotes, id_mineral_prospeccion_lotes, cantidad_menas_prospeccion_lotes, fecha_prospeccion_lotes) FROM stdin;
1	1	220	2026-05-19
2	2	355	2026-05-21
3	30	1	2026-05-23
4	30	1	2026-05-24
5	30	1	2026-05-25
6	30	1	2026-05-26
7	30	1	2026-05-27
8	30	1	2026-05-28
9	30	1	2026-05-29
10	30	1	2026-05-30
11	30	1	2026-05-31
12	30	1	2026-06-01
13	30	1	2026-06-02
14	30	1	2026-06-03
15	30	1	2026-06-04
16	30	1	2026-06-05
17	30	1	2026-06-06
18	30	1	2026-06-07
19	30	1	2026-06-08
20	30	1	2026-06-09
21	30	1	2026-06-10
22	30	1	2026-06-11
23	30	1	2026-06-12
24	30	1	2026-06-13
25	30	1	2026-06-14
26	30	1	2026-06-15
27	30	1	2026-06-16
28	30	1	2026-06-17
29	30	1	2026-06-18
\.


--
-- Data for Name: r_prospeccion_resultados; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.r_prospeccion_resultados (orden_prospeccion_resultados, lote_prospeccion_resultados, id_gema_prospeccion_resultados, cantidad_prospeccion_resultados) FROM stdin;
1	1	9	9
2	1	21	8
3	1	18	7
4	1	15	14
5	1	24	8
6	1	12	11
7	1	13	2
8	1	25	2
9	2	9	29
10	2	12	19
11	2	15	25
12	2	18	45
13	2	21	27
14	2	24	32
15	2	10	8
16	2	13	3
17	2	16	2
18	2	19	3
19	2	22	1
20	3	13	1
21	3	22	2
22	4	19	2
23	4	25	1
24	5	13	1
25	5	25	1
26	6	16	1
27	6	19	1
28	7	10	1
29	7	13	1
30	7	16	1
31	8	10	1
32	8	19	1
33	8	22	1
34	9	13	2
35	10	19	1
36	10	22	1
37	10	25	1
38	11	13	1
39	11	16	1
40	11	19	1
41	12	13	1
42	12	19	1
43	13	10	1
44	13	19	1
45	13	25	1
46	14	13	1
47	14	19	1
48	14	25	1
49	14	29	1
50	15	10	1
51	15	13	1
52	15	22	1
53	16	10	1
54	16	16	1
55	17	16	2
56	17	25	1
57	18	22	1
58	18	16	1
59	19	25	2
60	19	22	1
61	20	16	1
62	20	22	1
63	21	13	1
64	21	19	1
65	22	16	1
66	22	22	1
67	23	22	2
68	24	22	1
69	24	16	1
70	24	10	1
71	25	13	1
72	25	22	1
73	26	13	1
74	26	25	1
75	27	25	1
76	27	16	1
77	27	19	1
78	28	10	1
79	28	13	1
80	28	19	1
81	29	10	1
82	29	13	1
83	29	22	1
\.


--
-- Data for Name: r_recetas_consumo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.r_recetas_consumo (orden_recetas_consumo, id_recetas_consumo, cantidad_recetas_consumo, fecha_recetas_consumo) FROM stdin;
1	800	3	2026-05-21
2	801	8	2026-05-21
3	801	4	2026-05-22
4	1	1	2026-05-23
5	1	1	2026-05-24
6	802	1	2026-05-24
7	100	1	2026-05-24
8	1	1	2026-05-25
9	1	1	2026-05-26
10	1	1	2026-05-27
11	1	1	2026-05-28
12	1	1	2026-05-29
13	1	1	2026-05-30
14	1	1	2026-05-31
15	1	1	2026-06-01
16	1	1	2026-06-02
17	1	1	2026-06-03
18	1	1	2026-06-04
19	1	1	2026-06-05
20	1	1	2026-06-06
21	1	1	2026-06-07
22	1	1	2026-06-08
23	1	1	2026-06-09
24	1	1	2026-06-10
25	1	1	2026-06-11
26	1	1	2026-06-12
27	1	1	2026-06-13
28	1	1	2026-06-14
29	1	1	2026-06-15
30	1	1	2026-06-16
31	1	1	2026-06-17
32	1	1	2026-06-18
\.


--
-- Data for Name: r_recoleccion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.r_recoleccion (orden_recoleccion, id_objecto_recoleccion, cantidad_recoleccion, fecha_recoleccion, hora_inicio, hora_fin, categoria_recoleccion, metodo_recoleccion) FROM stdin;
1	1	55	2026-05-14	00:00:00	00:00:00	1	0
2	15	1	2026-05-14	00:00:00	00:00:00	1	0
3	4	10	2026-05-14	00:00:00	00:00:00	1	0
4	5	12	2026-05-14	00:00:00	00:00:00	1	0
5	7	1	2026-05-14	00:00:00	00:00:00	1	0
6	1	22	2026-05-15	00:00:00	00:00:00	1	0
7	18	1	2026-05-15	00:00:00	00:00:00	1	0
8	4	5	2026-05-15	00:00:00	00:00:00	1	0
9	5	6	2026-05-15	00:00:00	00:00:00	1	0
10	1	21	2026-05-16	00:00:00	00:00:00	1	0
11	4	5	2026-05-16	00:00:00	00:00:00	1	0
12	5	4	2026-05-16	00:00:00	00:00:00	1	0
13	1	40	2026-05-17	00:00:00	00:00:00	1	0
14	4	8	2026-05-17	00:00:00	00:00:00	1	0
15	1	96	2026-05-18	00:00:00	00:00:00	1	0
16	2	86	2026-05-18	00:00:00	00:00:00	1	0
17	4	37	2026-05-18	00:00:00	00:00:00	1	0
18	5	11	2026-05-18	00:00:00	00:00:00	1	0
19	6	16	2026-05-18	00:00:00	00:00:00	1	0
20	9	1	2026-05-18	00:00:00	00:00:00	1	0
21	12	1	2026-05-18	00:00:00	00:00:00	1	0
22	15	1	2026-05-18	00:00:00	00:00:00	1	0
23	18	1	2026-05-18	00:00:00	00:00:00	1	0
24	24	1	2026-05-18	00:00:00	00:00:00	1	0
25	2	143	2026-05-18	00:00:00	00:00:00	1	0
26	3	13	2026-05-18	00:00:00	00:00:00	1	0
27	4	44	2026-05-18	00:00:00	00:00:00	1	0
28	5	3	2026-05-18	00:00:00	00:00:00	1	0
29	6	15	2026-05-18	00:00:00	00:00:00	1	0
30	7	8	2026-05-18	00:00:00	00:00:00	1	0
31	8	13	2026-05-18	00:00:00	00:00:00	1	0
32	9	4	2026-05-18	00:00:00	00:00:00	1	0
33	2	112	2026-05-19	00:00:00	00:00:00	1	0
34	3	5	2026-05-19	00:00:00	00:00:00	1	0
35	4	41	2026-05-19	00:00:00	00:00:00	1	0
36	5	4	2026-05-19	00:00:00	00:00:00	1	0
37	6	39	2026-05-19	00:00:00	00:00:00	1	0
38	7	3	2026-05-19	00:00:00	00:00:00	1	0
39	9	1	2026-05-19	00:00:00	00:00:00	1	0
40	12	1	2026-05-19	00:00:00	00:00:00	1	0
41	15	2	2026-05-19	00:00:00	00:00:00	1	0
42	2	15	2026-05-21	00:00:00	00:00:00	1	0
43	4	2	2026-05-21	00:00:00	00:00:00	1	0
44	6	9	2026-05-21	00:00:00	00:00:00	1	0
45	2	3	2026-05-19	00:00:00	00:00:00	1	0
46	4	10	2026-05-21	00:00:00	00:00:00	1	0
47	5	10	2026-05-21	00:00:00	00:00:00	1	0
48	6	2	2026-05-21	00:00:00	00:00:00	1	0
49	1	6	2026-05-21	00:00:00	00:00:00	1	0
50	4	2	2026-05-21	00:00:00	00:00:00	1	0
51	12	1	2026-05-21	00:00:00	00:00:00	1	0
52	6	8	2026-05-22	13:07:00	13:13:00	2	1
53	2	164	2026-05-22	13:16:00	13:48:00	1	1
54	4	49	2026-05-22	13:16:00	13:48:00	1	1
55	6	48	2026-05-22	13:16:00	13:48:00	1	1
56	5	6	2026-05-22	13:16:00	13:48:00	1	1
57	7	8	2026-05-22	13:16:00	13:48:00	1	1
58	8	9	2026-05-22	13:16:00	13:48:00	1	1
59	3	10	2026-05-22	13:16:00	13:48:00	1	1
60	12	1	2026-05-22	13:16:00	13:48:00	1	1
61	2	98	2026-05-23	00:00:00	00:00:00	1	0
62	3	11	2026-05-23	00:00:00	00:00:00	1	0
63	4	19	2026-05-23	00:00:00	00:00:00	1	0
64	5	13	2026-05-23	00:00:00	00:00:00	1	0
65	6	15	2026-05-23	00:00:00	00:00:00	1	0
66	7	3	2026-05-23	00:00:00	00:00:00	1	0
67	8	10	2026-05-23	00:00:00	00:00:00	1	0
68	9	1	2026-05-23	00:00:00	00:00:00	1	0
69	12	2	2026-05-23	00:00:00	00:00:00	1	0
70	15	1	2026-05-23	00:00:00	00:00:00	1	0
71	21	1	2026-05-23	00:00:00	00:00:00	1	0
72	2	7	2026-05-23	00:00:00	00:00:00	1	0
73	4	9	2026-05-23	00:00:00	00:00:00	1	0
74	2	12	2026-05-27	00:00:00	00:00:00	1	0
75	4	6	2026-05-27	00:00:00	00:00:00	1	0
76	902	2	2026-05-27	00:00:00	00:00:00	2	0
77	6	3	2026-05-27	00:00:00	00:00:00	1	0
78	2	15	2026-05-31	00:00:00	00:00:00	1	0
79	4	18	2026-05-31	00:00:00	00:00:00	1	0
80	5	1	2026-05-31	00:00:00	00:00:00	1	0
81	6	5	2026-05-31	00:00:00	00:00:00	1	0
82	1	5	2026-06-03	00:00:00	00:00:00	1	0
83	2	51	2026-06-03	00:00:00	00:00:00	1	0
84	4	12	2026-06-03	00:00:00	00:00:00	1	0
85	5	3	2026-06-03	00:00:00	00:00:00	1	0
86	6	7	2026-06-03	00:00:00	00:00:00	1	0
87	8	3	2026-06-03	00:00:00	00:00:00	1	0
88	15	1	2026-06-03	00:00:00	00:00:00	1	0
89	24	1	2026-06-03	00:00:00	00:00:00	1	0
90	2	24	2026-06-06	00:00:00	00:00:00	1	0
91	4	10	2026-06-06	00:00:00	00:00:00	1	0
92	6	7	2026-06-06	00:00:00	00:00:00	1	0
93	9	1	2026-06-06	00:00:00	00:00:00	1	0
94	902	1	2026-06-10	00:00:00	00:00:00	2	0
95	2	11	2026-06-10	00:00:00	00:00:00	1	0
96	4	6	2026-06-10	00:00:00	00:00:00	1	0
97	6	4	2026-06-10	00:00:00	00:00:00	1	0
98	7	7	2026-06-10	00:00:00	00:00:00	2	0
99	4	2	2026-06-12	00:00:00	00:00:00	2	0
100	5	5	2026-06-12	00:00:00	00:00:00	2	0
101	7	4	2026-06-12	00:00:00	00:00:00	2	0
102	8	4	2026-06-12	00:00:00	00:00:00	2	0
103	2	380	2026-06-12	23:13:00	00:25:00	1	1
104	3	26	2026-06-12	23:13:00	00:25:00	1	1
105	4	96	2026-06-12	23:13:00	00:25:00	1	1
106	5	24	2026-06-12	23:13:00	00:25:00	1	1
107	6	98	2026-06-12	23:13:00	00:25:00	1	1
108	7	19	2026-06-12	23:13:00	00:25:00	1	1
109	8	24	2026-06-12	23:13:00	00:25:00	1	1
110	9	3	2026-06-12	23:13:00	00:25:00	1	1
111	12	3	2026-06-12	23:13:00	00:25:00	1	1
112	15	1	2026-06-12	23:13:00	00:25:00	1	1
113	21	1	2026-06-12	23:13:00	00:25:00	1	1
114	24	1	2026-06-12	23:13:00	00:25:00	1	1
115	16	1	2026-06-12	23:13:00	00:25:00	1	1
116	22	1	2026-06-12	23:13:00	00:25:00	1	1
117	27	4	2026-06-17	00:00:00	00:00:00	2	0
\.


--
-- Data for Name: r_registro_poblacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.r_registro_poblacion (orden_poblacion, fecha_poblacion, hora_poblacion, total_poblacion, poblacion_80) FROM stdin;
1	2026-05-15	09:14:00	205	114
2	2026-05-15	10:51:00	408	206
3	2026-05-15	14:08:00	535	300
4	2026-05-15	19:53:00	1101	578
5	2026-05-15	23:00:00	1411	828
6	2026-05-16	02:16:00	892	423
7	2026-05-16	14:28:00	886	478
8	2026-05-16	20:44:00	1242	699
9	2026-05-16	23:24:00	1555	936
10	2026-05-17	03:18:00	800	456
11	2026-05-17	13:10:00	744	406
12	2026-05-17	21:59:00	1607	955
13	2026-05-18	12:30:00	554	312
14	2026-05-18	17:24:00	940	521
15	2026-05-18	20:42:00	1240	687
16	2026-05-19	12:23:00	586	312
17	2026-05-19	17:26:00	869	466
18	2026-05-19	20:22:00	1277	748
19	2026-05-20	01:27:00	949	551
20	2026-05-20	09:17:00	221	126
21	2026-05-20	22:27:00	1299	845
22	2026-05-21	01:40:00	1389	539
23	2026-05-21	11:24:00	506	276
24	2026-05-21	19:16:00	1189	716
25	2026-05-22	00:07:00	1419	810
26	2026-05-22	09:51:00	269	155
27	2026-05-22	23:23:00	1519	942
28	2026-05-23	12:39:00	412	217
29	2026-05-23	18:34:00	1085	630
30	2026-05-24	10:33:00	313	160
31	2026-05-24	13:47:00	769	429
32	2026-05-24	17:53:00	1128	650
33	2026-05-24	22:43:00	1510	915
34	2026-05-25	13:31:00	643	337
35	2026-05-26	00:02:00	1376	807
36	2026-05-26	10:29:00	304	163
37	2026-05-26	16:19:00	781	437
38	2026-05-26	23:52:00	1414	846
39	2026-05-27	09:28:00	206	115
40	2026-05-27	19:11:00	1072	647
41	2026-05-27	22:03:00	1432	882
42	2026-05-28	10:40:00	343	195
43	2026-05-28	17:19:00	845	494
44	2026-05-29	00:35:00	1220	736
45	2026-05-29	19:42:00	1096	637
46	2026-05-30	03:20:00	640	365
47	2026-05-30	12:43:00	590	319
48	2026-05-31	01:47:00	1158	691
49	2026-05-31	14:39:00	826	451
50	2026-05-31	20:38:00	1524	906
51	2026-06-01	01:27:00	862	479
52	2026-06-01	10:15:00	281	153
53	2026-06-01	17:33:00	861	468
54	2026-06-02	02:23:00	672	385
55	2026-06-02	11:59:00	441	256
56	2026-06-02	22:13:00	1317	812
57	2026-06-03	12:17:00	456	254
58	2026-06-03	21:59:00	1203	781
59	2026-06-04	08:29:00	135	80
60	2026-06-04	16:52:00	762	433
61	2026-06-05	03:33:00	396	198
62	2026-06-05	11:36:00	419	219
63	2026-06-06	15:27:00	768	438
64	2026-06-07	11:56:00	464	275
65	2026-06-07	22:54:00	1394	895
66	2026-06-08	12:26:00	471	267
67	2026-06-08	21:43:00	1333	846
68	2026-06-09	09:35:00	195	117
69	2026-06-09	19:49:00	1042	647
70	2026-06-10	10:21:00	260	157
71	2026-06-10	16:33:00	677	405
72	2026-06-10	23:03:00	1341	866
73	2026-06-11	07:00:00	86	47
74	2026-06-11	20:00:00	990	593
75	2026-06-12	08:59:00	135	93
76	2026-06-12	16:53:00	618	382
77	2026-06-13	03:08:00	655	417
78	2026-06-13	13:29:00	530	323
79	2026-06-13	22:17:00	1191	809
80	2026-06-14	12:10:00	471	272
81	2026-06-14	20:54:00	1234	775
82	2026-06-15	11:07:00	309	190
83	2026-06-15	19:01:00	984	597
84	2026-06-16	00:31:00	976	597
85	2026-06-16	09:55:00	212	134
86	2026-06-16	17:17:00	629	377
87	2026-06-16	22:07:00	826	513
88	2026-06-16	22:38:00	778	486
89	2026-06-16	23:14:00	839	515
90	2026-06-17	00:26:00	889	546
91	2026-06-17	12:09:00	381	233
92	2026-06-17	19:29:00	817	523
93	2026-06-17	22:53:00	1210	807
94	2026-06-18	11:45:00	397	256
\.


--
-- Data for Name: r_transmutaciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.r_transmutaciones (orden_transmutaciones, receta_transmutaciones, cantidad_transmutaciones, fecha_transmutaciones) FROM stdin;
1	200	23	2026-06-06
\.


--
-- Data for Name: r_transmutaciones_resultados; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.r_transmutaciones_resultados (orden_transmutaciones_resultados, orden_transmutacion, obtengo_objecto_transmutaciones_resultados, obtengo_cantidad_transmutaciones_resultados) FROM stdin;
1	1	103	26
\.


--
-- Data for Name: r_valor_subasta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.r_valor_subasta (orden_valor_subasta, id_objecto_valor_subasta, precio_valor_subasta, fecha_valor_subasta, hora_valor_subasta) FROM stdin;
1	9	8800	2026-05-20	10:57:00
2	12	11950	2026-05-20	10:57:00
3	15	12000	2026-05-20	10:57:00
4	18	11500	2026-05-20	10:57:00
5	21	12000	2026-05-20	10:57:00
6	24	4995	2026-05-20	10:57:00
7	9	4600	2026-05-22	09:55:00
8	12	15800	2026-05-22	09:55:00
9	15	7200	2026-05-22	09:55:00
10	18	2400	2026-05-22	09:55:00
11	21	5400	2026-05-22	09:55:00
12	24	2400	2026-05-22	09:55:00
13	9	3900	2026-05-22	16:24:00
14	12	6400	2026-05-22	16:24:00
15	15	3800	2026-05-22	16:24:00
16	18	2400	2026-05-22	16:24:00
17	21	3900	2026-05-22	16:24:00
18	24	7500	2026-05-22	16:25:00
19	9	8400	2026-05-24	22:54:00
20	12	10200	2026-05-24	22:54:00
21	15	7900	2026-05-24	22:54:00
22	18	9500	2026-05-24	22:54:00
23	21	9600	2026-05-24	22:54:00
24	24	3900	2026-05-24	22:54:00
25	9	31800	2026-05-26	00:08:00
26	12	9700	2026-05-26	00:08:00
27	15	9200	2026-05-26	00:08:00
28	18	9500	2026-05-26	00:08:00
29	21	9400	2026-05-26	00:08:00
30	24	9100	2026-05-26	00:08:00
31	9	31400	2026-05-26	12:24:00
32	12	9400	2026-05-26	12:24:00
33	15	8700	2026-05-26	12:24:00
34	18	8700	2026-05-26	12:24:00
35	21	9400	2026-05-26	12:24:00
36	24	9100	2026-05-26	12:24:00
37	9	7900	2026-05-28	10:46:00
38	12	12400	2026-05-28	10:46:00
39	15	10000	2026-05-28	10:46:00
40	18	5400	2026-05-28	10:46:00
41	21	7240	2026-05-28	10:46:00
42	24	5500	2026-05-28	10:46:00
43	9	6000	2026-05-29	21:10:00
44	12	8900	2026-05-29	21:10:00
45	15	6000	2026-05-29	21:10:00
46	18	6000	2026-05-29	21:10:00
47	21	6000	2026-05-29	21:10:00
48	24	3800	2026-05-29	21:10:00
49	1	15000	2026-05-31	01:49:35
50	2	8400	2026-05-31	01:49:35
51	3	80000	2026-05-31	01:49:35
52	9	12800	2026-05-31	01:49:35
53	10	653000	2026-05-31	01:49:35
54	11	807692	2026-05-31	01:49:35
55	12	29200	2026-05-31	01:49:35
56	13	44800	2026-05-31	01:49:35
57	14	750000	2026-05-31	01:49:35
58	15	9000	2026-05-31	01:49:35
59	16	138500	2026-05-31	01:49:35
60	17	872625	2026-05-31	01:49:35
61	18	3900	2026-05-31	01:49:35
62	19	480000	2026-05-31	01:49:35
63	20	750000	2026-05-31	01:49:35
64	21	7700	2026-05-31	01:49:35
65	22	445000	2026-05-31	01:49:35
66	23	828000	2026-05-31	01:49:35
67	24	3000	2026-05-31	01:49:35
68	25	99400	2026-05-31	01:49:35
69	26	578999	2026-05-31	01:49:35
70	101	13600	2026-05-31	01:49:35
71	102	19000	2026-05-31	01:49:35
72	103	86030	2026-05-31	01:49:35
73	1	14600	2026-05-31	14:40:32
74	2	8400	2026-05-31	14:40:32
75	3	82500	2026-05-31	14:40:32
76	9	11600	2026-05-31	14:40:32
77	10	589000	2026-05-31	14:40:32
78	11	807692	2026-05-31	14:40:32
79	12	18800	2026-05-31	14:40:32
80	13	44800	2026-05-31	14:40:32
81	14	750000	2026-05-31	14:40:32
82	15	9000	2026-05-31	14:40:32
83	16	138500	2026-05-31	14:40:32
84	17	872625	2026-05-31	14:40:32
85	18	11600	2026-05-31	14:40:32
86	19	448999	2026-05-31	14:40:32
87	20	750000	2026-05-31	14:40:32
88	21	9100	2026-05-31	14:40:32
89	22	290000	2026-05-31	14:40:32
90	23	828000	2026-05-31	14:40:32
91	24	2500	2026-05-31	14:40:32
92	25	97000	2026-05-31	14:40:32
93	26	578999	2026-05-31	14:40:32
94	101	13600	2026-05-31	14:40:32
95	102	19000	2026-05-31	14:40:32
96	103	86030	2026-05-31	14:40:32
97	1	13000	2026-05-31	20:39:51
98	2	8400	2026-05-31	20:39:51
99	3	100000	2026-05-31	20:39:51
100	9	9900	2026-05-31	20:39:51
101	10	898000	2026-05-31	20:39:51
102	11	807692	2026-05-31	20:39:51
103	12	18599	2026-05-31	20:39:51
104	13	44800	2026-05-31	20:39:51
105	14	750000	2026-05-31	20:39:51
106	15	9000	2026-05-31	20:39:51
107	16	138500	2026-05-31	20:39:51
108	17	872625	2026-05-31	20:39:51
109	18	9600	2026-05-31	20:39:51
110	19	82000	2026-05-31	20:39:51
111	20	750000	2026-05-31	20:39:51
112	21	8900	2026-05-31	20:39:51
113	22	290000	2026-05-31	20:39:51
114	23	828000	2026-05-31	20:39:51
115	24	2600	2026-05-31	20:39:51
116	25	98499	2026-05-31	20:39:51
117	26	578999	2026-05-31	20:39:51
118	101	13600	2026-05-31	20:39:51
119	102	19000	2026-05-31	20:39:51
120	103	86030	2026-05-31	20:39:51
121	1	11800	2026-06-01	01:28:52
122	2	8100	2026-06-01	01:28:52
123	3	78999	2026-06-01	01:28:52
124	9	7900	2026-06-01	01:28:52
125	10	569000	2026-06-01	01:28:52
126	11	807692	2026-06-01	01:28:52
127	12	13000	2026-06-01	01:28:52
128	13	44800	2026-06-01	01:28:52
129	14	750000	2026-06-01	01:28:52
130	15	9000	2026-06-01	01:28:52
131	16	138500	2026-06-01	01:28:52
132	17	872625	2026-06-01	01:28:52
133	18	4800	2026-06-01	01:28:52
134	19	446000	2026-06-01	01:28:52
135	20	750000	2026-06-01	01:28:52
136	21	3666	2026-06-01	01:28:52
137	22	383000	2026-06-01	01:28:52
138	23	828000	2026-06-01	01:28:52
139	24	2500	2026-06-01	01:28:52
140	25	97000	2026-06-01	01:28:52
141	26	578999	2026-06-01	01:28:52
142	101	13600	2026-06-01	01:28:52
143	102	19000	2026-06-01	01:28:52
144	103	86030	2026-06-01	01:28:52
145	1	11000	2026-06-01	10:16:33
146	2	7900	2026-06-01	10:16:33
147	3	78000	2026-06-01	10:16:33
148	9	7700	2026-06-01	10:16:33
149	10	550000	2026-06-01	10:16:33
150	11	807692	2026-06-01	10:16:33
151	12	18200	2026-06-01	10:16:33
152	13	44800	2026-06-01	10:16:33
153	14	750000	2026-06-01	10:16:33
154	15	9000	2026-06-01	10:16:33
155	16	138500	2026-06-01	10:16:33
156	17	872625	2026-06-01	10:16:33
157	18	4799	2026-06-01	10:16:33
158	19	397000	2026-06-01	10:16:33
159	20	750000	2026-06-01	10:16:33
160	21	7800	2026-06-01	10:16:33
161	22	383000	2026-06-01	10:16:33
162	23	828000	2026-06-01	10:16:33
163	24	2500	2026-06-01	10:16:33
164	25	89500	2026-06-01	10:16:33
165	26	578999	2026-06-01	10:16:33
166	101	13600	2026-06-01	10:16:33
167	102	19000	2026-06-01	10:16:33
168	103	86030	2026-06-01	10:16:33
169	1	11200	2026-06-01	17:34:15
170	2	11600	2026-06-01	17:34:15
171	3	69000	2026-06-01	17:34:15
172	9	10600	2026-06-01	17:34:15
173	10	550000	2026-06-01	17:34:15
174	11	807692	2026-06-01	17:34:15
175	12	17799	2026-06-01	17:34:15
176	13	44800	2026-06-01	17:34:15
177	14	750000	2026-06-01	17:34:15
178	15	9000	2026-06-01	17:34:15
179	16	138500	2026-06-01	17:34:15
180	17	872625	2026-06-01	17:34:15
181	18	4500	2026-06-01	17:34:15
182	19	390000	2026-06-01	17:34:15
183	20	750000	2026-06-01	17:34:15
184	21	9200	2026-06-01	17:34:15
185	22	359000	2026-06-01	17:34:15
186	23	828000	2026-06-01	17:34:15
187	24	2600	2026-06-01	17:34:15
188	25	83333	2026-06-01	17:34:15
189	26	578999	2026-06-01	17:34:15
190	101	13600	2026-06-01	17:34:15
191	102	19000	2026-06-01	17:34:15
192	103	86030	2026-06-01	17:34:15
193	1	15400	2026-06-02	02:24:29
194	2	8800	2026-06-02	02:24:29
195	3	69500	2026-06-02	02:24:29
196	9	10600	2026-06-02	02:24:29
197	10	500000	2026-06-02	02:24:29
198	11	807692	2026-06-02	02:24:29
199	12	14800	2026-06-02	02:24:29
200	13	44800	2026-06-02	02:24:29
201	14	750000	2026-06-02	02:24:29
202	15	9000	2026-06-02	02:24:29
203	16	138500	2026-06-02	02:24:29
204	17	872625	2026-06-02	02:24:30
205	18	4300	2026-06-02	02:24:30
206	19	330000	2026-06-02	02:24:30
207	20	750000	2026-06-02	02:24:30
208	21	8800	2026-06-02	02:24:30
209	22	299000	2026-06-02	02:24:30
210	23	828000	2026-06-02	02:24:30
211	24	2600	2026-06-02	02:24:30
212	25	81000	2026-06-02	02:24:30
213	26	578999	2026-06-02	02:24:30
214	101	13600	2026-06-02	02:24:30
215	102	19000	2026-06-02	02:24:30
216	103	86030	2026-06-02	02:24:30
217	1	15400	2026-06-02	12:01:06
218	2	8600	2026-06-02	12:01:06
219	3	69000	2026-06-02	12:01:06
220	9	10399	2026-06-02	12:01:06
221	10	498000	2026-06-02	12:01:06
222	11	807692	2026-06-02	12:01:06
223	12	17799	2026-06-02	12:01:06
224	13	44800	2026-06-02	12:01:06
225	14	750000	2026-06-02	12:01:06
226	15	9000	2026-06-02	12:01:06
227	16	138500	2026-06-02	12:01:06
228	17	872625	2026-06-02	12:01:06
229	18	4299	2026-06-02	12:01:06
230	19	330000	2026-06-02	12:01:06
231	20	750000	2026-06-02	12:01:06
232	21	8799	2026-06-02	12:01:06
233	22	359999	2026-06-02	12:01:06
234	23	828000	2026-06-02	12:01:06
235	24	9999	2026-06-02	12:01:06
236	25	80999	2026-06-02	12:01:06
237	26	578999	2026-06-02	12:01:06
238	101	13600	2026-06-02	12:01:06
239	102	19000	2026-06-02	12:01:06
240	103	86030	2026-06-02	12:01:06
241	1	14833	2026-06-02	22:15:14
242	2	8400	2026-06-02	22:15:14
243	3	60000	2026-06-02	22:15:14
244	9	13000	2026-06-02	22:15:14
245	10	499900	2026-06-02	22:15:14
246	11	807692	2026-06-02	22:15:14
247	12	12600	2026-06-02	22:15:14
248	13	44800	2026-06-02	22:15:14
249	14	750000	2026-06-02	22:15:14
250	15	9000	2026-06-02	22:15:14
251	16	138500	2026-06-02	22:15:14
252	17	872625	2026-06-02	22:15:14
253	18	3900	2026-06-02	22:15:14
254	19	307000	2026-06-02	22:15:14
255	20	750000	2026-06-02	22:15:14
256	21	8500	2026-06-02	22:15:14
257	22	359999	2026-06-02	22:15:14
258	23	828000	2026-06-02	22:15:14
259	24	9999	2026-06-02	22:15:14
260	25	289000	2026-06-02	22:15:14
261	26	578999	2026-06-02	22:15:14
262	101	13600	2026-06-02	22:15:14
263	102	19000	2026-06-02	22:15:14
264	103	86030	2026-06-02	22:15:14
265	1	14699	2026-06-03	12:44:36
266	2	9900	2026-06-03	12:44:36
267	3	57500	2026-06-03	12:44:36
268	9	12000	2026-06-03	12:44:36
269	10	469000	2026-06-03	12:44:36
270	11	807692	2026-06-03	12:44:36
271	12	9900	2026-06-03	12:44:36
272	13	44800	2026-06-03	12:44:36
273	14	750000	2026-06-03	12:44:36
274	15	9000	2026-06-03	12:44:36
275	16	138500	2026-06-03	12:44:36
276	17	872625	2026-06-03	12:44:36
277	18	9800	2026-06-03	12:44:36
278	19	305000	2026-06-03	12:44:36
279	20	750000	2026-06-03	12:44:36
280	21	7800	2026-06-03	12:44:36
281	22	359999	2026-06-03	12:44:36
282	23	828000	2026-06-03	12:44:36
283	24	9800	2026-06-03	12:44:36
284	25	153500	2026-06-03	12:44:36
285	26	578999	2026-06-03	12:44:36
286	101	13600	2026-06-03	12:44:36
287	102	19000	2026-06-03	12:44:36
288	103	86030	2026-06-03	12:44:36
289	1	39200	2026-06-03	22:00:27
290	2	11500	2026-06-03	22:00:27
291	3	111000	2026-06-03	22:00:27
292	9	10200	2026-06-03	22:00:27
293	10	450000	2026-06-03	22:00:27
294	11	807692	2026-06-03	22:00:27
295	12	7900	2026-06-03	22:00:27
296	13	44800	2026-06-03	22:00:27
297	14	750000	2026-06-03	22:00:27
298	15	9000	2026-06-03	22:00:27
299	16	138500	2026-06-03	22:00:27
300	17	872625	2026-06-03	22:00:27
301	18	9600	2026-06-03	22:00:27
302	19	150000	2026-06-03	22:00:27
303	20	750000	2026-06-03	22:00:27
304	21	7200	2026-06-03	22:00:27
305	22	309000	2026-06-03	22:00:27
306	23	828000	2026-06-03	22:00:27
307	24	9900	2026-06-03	22:00:27
308	25	152000	2026-06-03	22:00:27
309	26	578999	2026-06-03	22:00:27
310	101	13600	2026-06-03	22:00:27
311	102	19000	2026-06-03	22:00:27
312	103	86030	2026-06-03	22:00:27
313	1	11800	2026-06-04	08:30:35
314	2	9900	2026-06-04	08:30:35
315	3	90000	2026-06-04	08:30:35
316	9	4500	2026-06-04	08:30:35
317	10	448000	2026-06-04	08:30:35
318	11	807692	2026-06-04	08:30:35
319	12	116500	2026-06-04	08:30:35
320	13	44800	2026-06-04	08:30:35
321	14	750000	2026-06-04	08:30:35
322	15	9000	2026-06-04	08:30:35
323	16	138500	2026-06-04	08:30:35
324	17	872625	2026-06-04	08:30:35
325	18	9700	2026-06-04	08:30:35
326	19	472000	2026-06-04	08:30:35
327	20	750000	2026-06-04	08:30:35
328	21	6900	2026-06-04	08:30:35
329	22	310000	2026-06-04	08:30:35
330	23	828000	2026-06-04	08:30:35
331	24	18500	2026-06-04	08:30:35
332	25	90000	2026-06-04	08:30:35
333	26	578999	2026-06-04	08:30:35
334	101	13600	2026-06-04	08:30:35
335	102	19000	2026-06-04	08:30:35
336	103	86030	2026-06-04	08:30:35
337	1	10800	2026-06-04	16:53:04
338	2	9300	2026-06-04	16:53:04
339	3	89000	2026-06-04	16:53:04
340	9	10000	2026-06-04	16:53:04
341	10	449000	2026-06-04	16:53:04
342	11	807692	2026-06-04	16:53:04
343	12	15000	2026-06-04	16:53:04
344	13	44800	2026-06-04	16:53:04
345	14	750000	2026-06-04	16:53:04
346	15	9000	2026-06-04	16:53:04
347	16	138500	2026-06-04	16:53:04
348	17	872625	2026-06-04	16:53:04
349	18	9300	2026-06-04	16:53:04
350	19	408000	2026-06-04	16:53:04
351	20	750000	2026-06-04	16:53:04
352	21	6700	2026-06-04	16:53:04
353	22	808000	2026-06-04	16:53:04
354	23	828000	2026-06-04	16:53:04
355	24	18200	2026-06-04	16:53:04
356	25	89000	2026-06-04	16:53:04
357	26	578999	2026-06-04	16:53:04
358	101	13600	2026-06-04	16:53:04
359	102	19000	2026-06-04	16:53:04
360	103	86030	2026-06-04	16:53:04
361	1	11000	2026-06-05	03:34:20
362	2	9899	2026-06-05	03:34:20
363	3	94500	2026-06-05	03:34:20
364	9	9099	2026-06-05	03:34:20
365	10	389999	2026-06-05	03:34:20
366	11	807692	2026-06-05	03:34:20
367	12	14450	2026-06-05	03:34:20
368	13	44800	2026-06-05	03:34:20
369	14	750000	2026-06-05	03:34:20
370	15	9000	2026-06-05	03:34:20
371	16	138500	2026-06-05	03:34:20
372	17	872625	2026-06-05	03:34:20
373	18	9100	2026-06-05	03:34:20
374	19	399899	2026-06-05	03:34:20
375	20	750000	2026-06-05	03:34:20
376	21	7499	2026-06-05	03:34:20
377	22	794999	2026-06-05	03:34:20
378	23	828000	2026-06-05	03:34:20
379	24	17000	2026-06-05	03:34:20
380	25	79499	2026-06-05	03:34:20
381	26	578999	2026-06-05	03:34:20
382	101	13600	2026-06-05	03:34:20
383	102	19000	2026-06-05	03:34:20
384	103	86030	2026-06-05	03:34:20
385	1	11000	2026-06-05	11:37:04
386	2	9700	2026-06-05	11:37:04
387	3	80000	2026-06-05	11:37:04
388	9	4900	2026-06-05	11:37:04
389	10	657000	2026-06-05	11:37:04
390	11	807692	2026-06-05	11:37:04
391	12	12000	2026-06-05	11:37:04
392	13	44800	2026-06-05	11:37:04
393	14	750000	2026-06-05	11:37:04
394	15	9000	2026-06-05	11:37:04
395	16	138500	2026-06-05	11:37:04
396	17	872625	2026-06-05	11:37:04
397	18	9000	2026-06-05	11:37:04
398	19	399000	2026-06-05	11:37:04
399	20	750000	2026-06-05	11:37:04
400	21	7300	2026-06-05	11:37:04
401	22	794999	2026-06-05	11:37:04
402	23	828000	2026-06-05	11:37:04
403	24	16600	2026-06-05	11:37:04
404	25	78999	2026-06-05	11:37:04
405	26	578999	2026-06-05	11:37:04
406	101	13600	2026-06-05	11:37:04
407	102	19000	2026-06-05	11:37:04
408	103	86030	2026-06-05	11:37:04
409	1	11500	2026-06-06	15:27:54
410	2	8300	2026-06-06	15:27:54
411	3	59000	2026-06-06	15:27:54
412	9	3700	2026-06-06	15:27:54
413	10	302000	2026-06-06	15:27:54
414	11	807692	2026-06-06	15:27:54
415	12	5400	2026-06-06	15:27:54
416	13	44800	2026-06-06	15:27:54
417	14	750000	2026-06-06	15:27:54
418	15	9000	2026-06-06	15:27:54
419	16	138500	2026-06-06	15:27:54
420	17	872625	2026-06-06	15:27:54
421	18	5400	2026-06-06	15:27:54
422	19	390000	2026-06-06	15:27:54
423	20	750000	2026-06-06	15:27:54
424	21	5400	2026-06-06	15:27:54
425	22	425000	2026-06-06	15:27:54
426	23	828000	2026-06-06	15:27:54
427	24	5400	2026-06-06	15:27:54
428	25	99500	2026-06-06	15:27:54
429	26	578999	2026-06-06	15:27:54
430	101	13600	2026-06-06	15:27:54
431	102	19000	2026-06-06	15:27:54
432	103	86030	2026-06-06	15:27:54
433	1	17676	2026-06-07	11:57:11
434	2	12499	2026-06-07	11:57:11
435	3	150000	2026-06-07	11:57:11
436	9	100000	2026-06-07	11:57:11
437	10	800000	2026-06-07	11:57:11
438	11	807692	2026-06-07	11:57:11
439	12	5400	2026-06-07	11:57:11
440	13	44800	2026-06-07	11:57:11
441	14	750000	2026-06-07	11:57:11
442	15	9000	2026-06-07	11:57:11
443	16	138500	2026-06-07	11:57:11
444	17	872625	2026-06-07	11:57:11
445	18	3499	2026-06-07	11:57:11
446	19	406999	2026-06-07	11:57:11
447	20	750000	2026-06-07	11:57:11
448	21	9900	2026-06-07	11:57:11
449	22	203999	2026-06-07	11:57:11
450	23	828000	2026-06-07	11:57:11
451	24	3799	2026-06-07	11:57:11
452	25	258999	2026-06-07	11:57:11
453	26	578999	2026-06-07	11:57:11
454	101	13600	2026-06-07	11:57:11
455	102	19000	2026-06-07	11:57:11
456	103	86030	2026-06-07	11:57:11
457	1	17500	2026-06-07	22:54:55
458	2	248999	2026-06-07	22:54:55
459	3	138500	2026-06-07	22:54:55
460	9	43600	2026-06-07	22:54:55
461	10	650000	2026-06-07	22:54:55
462	11	807692	2026-06-07	22:54:55
463	12	180000	2026-06-07	22:54:55
464	13	44800	2026-06-07	22:54:55
465	14	750000	2026-06-07	22:54:55
466	15	9000	2026-06-07	22:54:55
467	16	138500	2026-06-07	22:54:55
468	17	872625	2026-06-07	22:54:55
469	18	2400	2026-06-07	22:54:55
470	19	305000	2026-06-07	22:54:55
471	20	750000	2026-06-07	22:54:55
472	21	149000	2026-06-07	22:54:55
473	22	789900	2026-06-07	22:54:55
474	23	828000	2026-06-07	22:54:55
475	24	6400	2026-06-07	22:54:55
476	25	178500	2026-06-07	22:54:55
477	26	578999	2026-06-07	22:54:55
478	101	13600	2026-06-07	22:54:55
479	102	19000	2026-06-07	22:54:55
480	103	86030	2026-06-07	22:54:55
481	1	14300	2026-06-08	12:27:17
482	2	19800	2026-06-08	12:27:17
483	3	79500	2026-06-08	12:27:17
484	9	10000	2026-06-08	12:27:17
485	10	498000	2026-06-08	12:27:17
486	11	807692	2026-06-08	12:27:17
487	12	20000	2026-06-08	12:27:17
488	13	44800	2026-06-08	12:27:17
489	14	750000	2026-06-08	12:27:17
490	15	9000	2026-06-08	12:27:17
491	16	138500	2026-06-08	12:27:17
492	17	872625	2026-06-08	12:27:17
493	18	17000	2026-06-08	12:27:17
494	19	277000	2026-06-08	12:27:17
495	20	750000	2026-06-08	12:27:17
496	21	134500	2026-06-08	12:27:17
497	22	628000	2026-06-08	12:27:17
498	23	828000	2026-06-08	12:27:17
499	24	79000	2026-06-08	12:27:17
500	25	109000	2026-06-08	12:27:17
501	26	578999	2026-06-08	12:27:17
502	101	13600	2026-06-08	12:27:17
503	102	19000	2026-06-08	12:27:17
504	103	86030	2026-06-08	12:27:17
505	1	50000	2026-08-06	21:42:24
506	2	11000	2026-08-06	21:42:24
507	3	73500	2026-08-06	21:42:24
508	9	11000	2026-08-06	21:42:24
509	10	429000	2026-08-06	21:42:24
510	11	807692	2026-08-06	21:42:24
511	12	11000	2026-08-06	21:42:24
512	13	44800	2026-08-06	21:42:24
513	14	750000	2026-08-06	21:42:24
514	15	9000	2026-08-06	21:42:24
515	16	138500	2026-08-06	21:42:24
516	17	872625	2026-08-06	21:42:24
517	18	11000	2026-08-06	21:42:24
518	19	297000	2026-08-06	21:42:24
519	20	750000	2026-08-06	21:42:24
520	21	10800	2026-08-06	21:42:24
521	22	529000	2026-08-06	21:42:24
522	23	828000	2026-08-06	21:42:24
523	24	11000	2026-08-06	21:42:24
524	25	77500	2026-08-06	21:42:24
525	26	578999	2026-08-06	21:42:24
526	101	13600	2026-08-06	21:42:24
527	102	19000	2026-08-06	21:42:24
528	103	86030	2026-08-06	21:42:24
529	1	34399	2026-09-06	09:32:00
530	2	9000	2026-09-06	09:32:00
531	3	69000	2026-09-06	09:32:00
532	9	10400	2026-09-06	09:32:00
533	10	428000	2026-09-06	09:32:00
534	11	807692	2026-09-06	09:32:00
535	12	19000	2026-09-06	09:32:00
536	13	44800	2026-09-06	09:32:00
537	14	750000	2026-09-06	09:32:00
538	15	9000	2026-09-06	09:32:00
539	16	138500	2026-09-06	09:32:00
540	17	872625	2026-09-06	09:32:00
541	18	9900	2026-09-06	09:32:00
542	19	240000	2026-09-06	09:32:00
543	20	750000	2026-09-06	09:32:00
544	21	10000	2026-09-06	09:32:00
545	22	440000	2026-09-06	09:32:00
546	23	828000	2026-09-06	09:32:00
547	24	18000	2026-09-06	09:32:00
548	25	75000	2026-09-06	09:32:00
549	26	578999	2026-09-06	09:32:00
550	101	13600	2026-09-06	09:32:00
551	102	19000	2026-09-06	09:32:00
552	103	86030	2026-09-06	09:32:00
553	1	12500	2026-09-06	19:48:56
554	2	8900	2026-09-06	19:48:56
555	3	61500	2026-09-06	19:48:56
556	9	9800	2026-09-06	19:48:56
557	10	409999	2026-09-06	19:48:56
558	11	807692	2026-09-06	19:48:56
559	12	9900	2026-09-06	19:48:56
560	13	44800	2026-09-06	19:48:56
561	14	750000	2026-09-06	19:48:56
562	15	9000	2026-09-06	19:48:56
563	16	138500	2026-09-06	19:48:56
564	17	872625	2026-09-06	19:48:56
565	18	9399	2026-09-06	19:48:56
566	19	300000	2026-09-06	19:48:56
567	20	750000	2026-09-06	19:48:56
568	21	8900	2026-09-06	19:48:56
569	22	306000	2026-09-06	19:48:56
570	23	828000	2026-09-06	19:48:56
571	24	10000	2026-09-06	19:48:56
572	25	107000	2026-09-06	19:48:56
573	26	578999	2026-09-06	19:48:56
574	101	13600	2026-09-06	19:48:56
575	102	19000	2026-09-06	19:48:56
576	103	86030	2026-09-06	19:48:56
577	1	12500	2026-10-06	09:58:59
578	2	7200	2026-10-06	09:58:59
579	3	60500	2026-10-06	09:58:59
580	9	9100	2026-10-06	09:58:59
581	10	347000	2026-10-06	09:58:59
582	11	807692	2026-10-06	09:58:59
583	12	9800	2026-10-06	09:58:59
584	13	44800	2026-10-06	09:58:59
585	14	750000	2026-10-06	09:58:59
586	15	9000	2026-10-06	09:58:59
587	16	138500	2026-10-06	09:58:59
588	17	872625	2026-10-06	09:58:59
589	18	4800	2026-10-06	09:58:59
590	19	296000	2026-10-06	09:58:59
591	20	750000	2026-10-06	09:58:59
592	21	8100	2026-10-06	09:58:59
593	22	253000	2026-10-06	09:58:59
594	23	828000	2026-10-06	09:58:59
595	24	11400	2026-10-06	09:58:59
596	25	98500	2026-10-06	09:58:59
597	26	578999	2026-10-06	09:58:59
598	101	13600	2026-10-06	09:58:59
599	102	19000	2026-10-06	09:58:59
600	103	86030	2026-10-06	09:58:59
601	1	12400	2026-10-06	16:32:43
602	2	6900	2026-10-06	16:32:43
603	3	59500	2026-10-06	16:32:43
604	9	9100	2026-10-06	16:32:43
605	10	408000	2026-10-06	16:32:43
606	11	807692	2026-10-06	16:32:43
607	12	9800	2026-10-06	16:32:43
608	13	44800	2026-10-06	16:32:43
609	14	750000	2026-10-06	16:32:43
610	15	9000	2026-10-06	16:32:43
611	16	138500	2026-10-06	16:32:43
612	17	872625	2026-10-06	16:32:43
613	18	4700	2026-10-06	16:32:43
614	19	296000	2026-10-06	16:32:43
615	20	750000	2026-10-06	16:32:43
616	21	7700	2026-10-06	16:32:43
617	22	249999	2026-10-06	16:32:43
618	23	828000	2026-10-06	16:32:43
619	24	11200	2026-10-06	16:32:43
620	25	97000	2026-10-06	16:32:43
621	26	578999	2026-10-06	16:32:43
622	101	13600	2026-10-06	16:32:43
623	102	19000	2026-10-06	16:32:43
624	103	86030	2026-10-06	16:32:43
625	1	29800	2026-10-06	23:02:00
626	2	9800	2026-10-06	23:02:00
627	3	61500	2026-10-06	23:02:00
628	9	9100	2026-10-06	23:02:00
629	10	407000	2026-10-06	23:02:00
630	11	807692	2026-10-06	23:02:00
631	12	17000	2026-10-06	23:02:00
632	13	44800	2026-10-06	23:02:00
633	14	750000	2026-10-06	23:02:00
634	15	9000	2026-10-06	23:02:00
635	16	138500	2026-10-06	23:02:00
636	17	872625	2026-10-06	23:02:00
637	18	4300	2026-10-06	23:02:00
638	19	289900	2026-10-06	23:02:00
639	20	750000	2026-10-06	23:02:00
640	21	7400	2026-10-06	23:02:00
641	22	103333	2026-10-06	23:02:00
642	23	828000	2026-10-06	23:02:00
643	24	16800	2026-10-06	23:02:00
644	25	98500	2026-10-06	23:02:00
645	26	578999	2026-10-06	23:02:00
646	101	13600	2026-10-06	23:02:00
647	102	19000	2026-10-06	23:02:00
648	103	86030	2026-10-06	23:02:00
649	1	20000	2026-11-06	07:01:09
650	2	9400	2026-11-06	07:01:09
651	3	74500	2026-11-06	07:01:09
652	9	9000	2026-11-06	07:01:09
653	10	480000	2026-11-06	07:01:09
654	11	807692	2026-11-06	07:01:09
655	12	10800	2026-11-06	07:01:09
656	13	79000	2026-11-06	07:01:09
657	14	750000	2026-11-06	07:01:09
658	15	7755	2026-11-06	07:01:09
659	16	299000	2026-11-06	07:01:09
660	17	872625	2026-11-06	07:01:09
661	18	4100	2026-11-06	07:01:09
662	19	295000	2026-11-06	07:01:09
663	20	750000	2026-11-06	07:01:09
664	21	7000	2026-11-06	07:01:09
665	22	252000	2026-11-06	07:01:09
666	23	828000	2026-11-06	07:01:09
667	24	11000	2026-11-06	07:01:09
668	25	99250	2026-11-06	07:01:09
669	26	578999	2026-11-06	07:01:09
670	101	54699	2026-11-06	07:01:09
671	102	18799	2026-11-06	07:01:09
672	103	100000	2026-11-06	07:01:09
673	200	15400	2026-11-06	07:01:09
674	201	9800	2026-11-06	07:01:09
675	202	18600	2026-11-06	07:01:09
676	203	11800	2026-11-06	07:01:09
677	204	25000	2026-11-06	07:01:09
678	205	26600	2026-11-06	07:01:09
679	206	79200	2026-11-06	07:01:09
680	207	38000	2026-11-06	07:01:09
681	1	19400	2026-11-06	19:59:11
682	2	7700	2026-11-06	19:59:11
683	3	56500	2026-11-06	19:59:11
684	9	10400	2026-11-06	19:59:11
685	10	969000	2026-11-06	19:59:11
686	11	807692	2026-11-06	19:59:11
687	12	16800	2026-11-06	19:59:11
688	13	90000	2026-11-06	19:59:11
689	14	750000	2026-11-06	19:59:11
690	15	7499	2026-11-06	19:59:11
691	16	389000	2026-11-06	19:59:11
692	17	872625	2026-11-06	19:59:11
693	18	7300	2026-11-06	19:59:11
694	19	290000	2026-11-06	19:59:11
695	20	750000	2026-11-06	19:59:11
696	21	6250	2026-11-06	19:59:11
697	22	498000	2026-11-06	19:59:11
698	23	828000	2026-11-06	19:59:11
699	24	10599	2026-11-06	19:59:11
700	25	98500	2026-11-06	19:59:11
701	26	578999	2026-11-06	19:59:11
702	101	23400	2026-11-06	19:59:11
703	102	14000	2026-11-06	19:59:11
704	103	98000	2026-11-06	19:59:11
705	200	15000	2026-11-06	19:59:11
706	201	10200	2026-11-06	19:59:11
707	202	17000	2026-11-06	19:59:11
708	203	34600	2026-11-06	19:59:11
709	204	24800	2026-11-06	19:59:11
710	205	17400	2026-11-06	19:59:11
711	206	37400	2026-11-06	19:59:11
712	207	36999	2026-11-06	19:59:11
713	1	18200	2026-12-06	08:54:34
714	2	7900	2026-12-06	08:54:34
715	3	50000	2026-12-06	08:54:34
716	9	9700	2026-12-06	08:54:34
717	10	399000	2026-12-06	08:54:34
718	11	807692	2026-12-06	08:54:34
719	12	16200	2026-12-06	08:54:34
720	13	300000	2026-12-06	08:54:34
721	14	750000	2026-12-06	08:54:34
722	15	7100	2026-12-06	08:54:34
723	16	330000	2026-12-06	08:54:34
724	17	872625	2026-12-06	08:54:34
725	18	6900	2026-12-06	08:54:34
726	19	253999	2026-12-06	08:54:34
727	20	750000	2026-12-06	08:54:34
728	21	10000	2026-12-06	08:54:34
729	22	474999	2026-12-06	08:54:34
730	23	828000	2026-12-06	08:54:34
731	24	29400	2026-12-06	08:54:34
732	25	258000	2026-12-06	08:54:34
733	26	578999	2026-12-06	08:54:34
734	101	19800	2026-12-06	08:54:34
735	102	12999	2026-12-06	08:54:34
736	103	96999	2026-12-06	08:54:34
737	200	15400	2026-12-06	08:54:34
738	201	9800	2026-12-06	08:54:34
739	202	15999	2026-12-06	08:54:34
740	203	25399	2026-12-06	08:54:34
741	204	23000	2026-12-06	08:54:34
742	205	22000	2026-12-06	08:54:34
743	206	49399	2026-12-06	08:54:34
744	207	35799	2026-12-06	08:54:34
745	1	10000	2026-06-12	16:51:59
746	2	7200	2026-06-12	16:51:59
747	3	74500	2026-06-12	16:51:59
748	9	7600	2026-06-12	16:51:59
749	10	460000	2026-06-12	16:51:59
750	11	807692	2026-06-12	16:51:59
751	12	10400	2026-06-12	16:51:59
752	13	257000	2026-06-12	16:51:59
753	14	750000	2026-06-12	16:51:59
754	15	7100	2026-06-12	16:51:59
755	16	258000	2026-06-12	16:51:59
756	17	872625	2026-06-12	16:51:59
757	18	6500	2026-06-12	16:51:59
758	19	254000	2026-06-12	16:51:59
759	20	750000	2026-06-12	16:51:59
760	21	7900	2026-06-12	16:51:59
761	22	466000	2026-06-12	16:51:59
762	23	828000	2026-06-12	16:51:59
763	24	25000	2026-06-12	16:51:59
764	25	209000	2026-06-12	16:51:59
765	26	578999	2026-06-12	16:51:59
766	101	17894	2026-06-12	16:51:59
767	102	12800	2026-06-12	16:51:59
768	103	149500	2026-06-12	16:51:59
769	200	13200	2026-06-12	16:51:59
770	201	19200	2026-06-12	16:51:59
771	202	15200	2026-06-12	16:51:59
772	203	25199	2026-06-12	16:51:59
773	204	24200	2026-06-12	16:51:59
774	205	25000	2026-06-12	16:51:59
775	206	49399	2026-06-12	16:51:59
776	207	34200	2026-06-12	16:51:59
777	1	17600	2027-01-06	03:07:28
778	2	5900	2027-01-06	03:07:28
779	3	65750	2027-01-06	03:07:28
780	9	6600	2027-01-06	03:07:28
781	10	400000	2027-01-06	03:07:28
782	11	807692	2027-01-06	03:07:28
783	12	10400	2027-01-06	03:07:28
784	13	190000	2027-01-06	03:07:28
785	14	750000	2027-01-06	03:07:28
786	15	6600	2027-01-06	03:07:28
787	16	170000	2027-01-06	03:07:28
788	17	872625	2027-01-06	03:07:28
789	18	5700	2027-01-06	03:07:28
790	19	252000	2027-01-06	03:07:28
791	20	750000	2027-01-06	03:07:28
792	21	6800	2027-01-06	03:07:28
793	22	259000	2027-01-06	03:07:28
794	23	828000	2027-01-06	03:07:28
795	24	13000	2027-01-06	03:07:28
796	25	217000	2027-01-06	03:07:28
797	26	578999	2027-01-06	03:07:28
798	101	23000	2027-01-06	03:07:28
799	102	14800	2027-01-06	03:07:28
800	103	105000	2027-01-06	03:07:28
801	200	14000	2027-01-06	03:07:28
802	201	12000	2027-01-06	03:07:28
803	202	9800	2027-01-06	03:07:28
804	203	19800	2027-01-06	03:07:28
805	204	24200	2027-01-06	03:07:28
806	205	22200	2027-01-06	03:07:28
807	206	54500	2027-01-06	03:07:28
808	207	30000	2027-01-06	03:07:28
809	1	10000	2027-01-06	13:27:43
810	2	8200	2027-01-06	13:27:43
811	3	60000	2027-01-06	13:27:43
812	9	6100	2027-01-06	13:27:43
813	10	910000	2027-01-06	13:27:43
814	11	807692	2027-01-06	13:27:43
815	12	9500	2027-01-06	13:27:43
816	13	607000	2027-01-06	13:27:43
817	14	750000	2027-01-06	13:27:43
818	15	6500	2027-01-06	13:27:43
819	16	250000	2027-01-06	13:27:43
820	17	872625	2027-01-06	13:27:43
821	18	5600	2027-01-06	13:27:43
822	19	295000	2027-01-06	13:27:43
823	20	750000	2027-01-06	13:27:43
824	21	6500	2027-01-06	13:27:43
825	22	390000	2027-01-06	13:27:43
826	23	828000	2027-01-06	13:27:43
827	24	10800	2027-01-06	13:27:43
828	25	213000	2027-01-06	13:27:43
829	26	578999	2027-01-06	13:27:43
830	101	22000	2027-01-06	13:27:43
831	102	14005	2027-01-06	13:27:43
832	103	107500	2027-01-06	13:27:43
833	200	27399	2027-01-06	13:27:43
834	201	11000	2027-01-06	13:27:43
835	202	13600	2027-01-06	13:27:43
836	203	17499	2027-01-06	13:27:43
837	204	34400	2027-01-06	13:27:43
838	205	21200	2027-01-06	13:27:43
839	206	49500	2027-01-06	13:27:43
840	207	30400	2027-01-06	13:27:43
841	1	15400	2027-01-06	22:18:56
842	2	9400	2027-01-06	22:18:56
843	3	62499	2027-01-06	22:18:56
844	9	5600	2027-01-06	22:18:56
845	10	450000	2027-01-06	22:18:56
846	11	807692	2027-01-06	22:18:56
847	12	9900	2027-01-06	22:18:56
848	13	418000	2027-01-06	22:18:56
849	14	750000	2027-01-06	22:18:56
850	15	5450	2027-01-06	22:18:56
851	16	249000	2027-01-06	22:18:56
852	17	872625	2027-01-06	22:18:56
853	18	5000	2027-01-06	22:18:56
854	19	239000	2027-01-06	22:18:56
855	20	750000	2027-01-06	22:18:56
856	21	5800	2027-01-06	22:18:56
857	22	389000	2027-01-06	22:18:56
858	23	828000	2027-01-06	22:18:56
859	24	9495	2027-01-06	22:18:56
860	25	180000	2027-01-06	22:18:56
861	26	578999	2027-01-06	22:18:56
862	101	14799	2027-01-06	22:18:56
863	102	19000	2027-01-06	22:18:56
864	103	105000	2027-01-06	22:18:56
865	200	25000	2027-01-06	22:18:56
866	201	8500	2027-01-06	22:18:56
867	202	10500	2027-01-06	22:18:56
868	203	15000	2027-01-06	22:18:56
869	204	29400	2027-01-06	22:18:56
870	205	20800	2027-01-06	22:18:56
871	206	53500	2027-01-06	22:18:56
872	207	25000	2027-01-06	22:18:56
873	1	16000	2027-02-06	12:20:22
874	2	7400	2027-02-06	12:20:22
875	3	62499	2027-02-06	12:20:22
876	9	5499	2027-02-06	12:20:22
877	10	609999	2027-02-06	12:20:22
878	11	807692	2027-02-06	12:20:22
879	12	9999	2027-02-06	12:20:22
880	13	175499	2027-02-06	12:20:22
881	14	750000	2027-02-06	12:20:22
882	15	5300	2027-02-06	12:20:22
883	16	248000	2027-02-06	12:20:22
884	17	872625	2027-02-06	12:20:22
885	18	4800	2027-02-06	12:20:22
886	19	209999	2027-02-06	12:20:22
887	20	750000	2027-02-06	12:20:22
888	21	7900	2027-02-06	12:20:22
889	22	448000	2027-02-06	12:20:22
890	23	828000	2027-02-06	12:20:22
891	24	9000	2027-02-06	12:20:22
892	25	75499	2027-02-06	12:20:22
893	26	578999	2027-02-06	12:20:22
894	101	20500	2027-02-06	12:20:22
895	102	12000	2027-02-06	12:20:22
896	103	105000	2027-02-06	12:20:22
897	200	22100	2027-02-06	12:20:22
898	201	11200	2027-02-06	12:20:22
899	202	10000	2027-02-06	12:20:22
900	203	10000	2027-02-06	12:20:22
901	204	29000	2027-02-06	12:20:22
902	205	20200	2027-02-06	12:20:22
903	206	50500	2027-02-06	12:20:22
904	207	25000	2027-02-06	12:20:22
905	1	15200	2027-02-06	20:51:45
906	2	7200	2027-02-06	20:51:45
907	3	48600	2027-02-06	20:51:45
908	9	4800	2027-02-06	20:51:45
909	10	419000	2027-02-06	20:51:45
910	11	807692	2027-02-06	20:51:45
911	12	12000	2027-02-06	20:51:45
912	13	149500	2027-02-06	20:51:45
913	14	750000	2027-02-06	20:51:45
914	15	4400	2027-02-06	20:51:45
915	16	150000	2027-02-06	20:51:45
916	17	872625	2027-02-06	20:51:45
917	18	5100	2027-02-06	20:51:45
918	19	174500	2027-02-06	20:51:45
919	20	750000	2027-02-06	20:51:45
920	21	5200	2027-02-06	20:51:45
921	22	390000	2027-02-06	20:51:45
922	23	828000	2027-02-06	20:51:45
923	24	14000	2027-02-06	20:51:45
924	25	73000	2027-02-06	20:51:45
925	26	578999	2027-02-06	20:51:45
926	101	22400	2027-02-06	20:51:45
927	102	13000	2027-02-06	20:51:45
928	103	104000	2027-02-06	20:51:45
929	200	25000	2027-02-06	20:51:45
930	201	9800	2027-02-06	20:51:45
931	202	10000	2027-02-06	20:51:45
932	203	10000	2027-02-06	20:51:45
933	204	22500	2027-02-06	20:51:45
934	205	17200	2027-02-06	20:51:45
935	206	47500	2027-02-06	20:51:45
936	207	23500	2027-02-06	20:51:45
937	1	17800	2027-03-06	11:10:21
938	2	9700	2027-03-06	11:10:21
939	3	99900	2027-03-06	11:10:21
940	9	11300	2027-03-06	11:10:21
941	10	445000	2027-03-06	11:10:21
942	11	807692	2027-03-06	11:10:21
943	12	17500	2027-03-06	11:10:21
944	13	249000	2027-03-06	11:10:21
945	14	750000	2027-03-06	11:10:21
946	15	4399	2027-03-06	11:10:21
947	16	650000	2027-03-06	11:10:21
948	17	872625	2027-03-06	11:10:21
949	18	9999	2027-03-06	11:10:21
950	19	500000	2027-03-06	11:10:21
951	20	750000	2027-03-06	11:10:21
952	21	7999	2027-03-06	11:10:21
953	22	399900	2027-03-06	11:10:21
954	23	828000	2027-03-06	11:10:21
955	24	14000	2027-03-06	11:10:21
956	25	348000	2027-03-06	11:10:21
957	26	578999	2027-03-06	11:10:21
958	101	24800	2027-03-06	11:10:21
959	102	15000	2027-03-06	11:10:21
960	103	100150	2027-03-06	11:10:21
961	200	20600	2027-03-06	11:10:21
962	201	8300	2027-03-06	11:10:21
963	202	9600	2027-03-06	11:10:21
964	203	17200	2027-03-06	11:10:21
965	204	23599	2027-03-06	11:10:21
966	205	19200	2027-03-06	11:10:21
967	206	42000	2027-03-06	11:10:21
968	207	22500	2027-03-06	11:10:21
969	1	11600	2027-03-06	19:00:25
970	2	8700	2027-03-06	19:00:25
971	3	99000	2027-03-06	19:00:25
972	9	12500	2027-03-06	19:00:25
973	10	559000	2027-03-06	19:00:25
974	11	807692	2027-03-06	19:00:25
975	12	17500	2027-03-06	19:00:25
976	13	237000	2027-03-06	19:00:25
977	14	750000	2027-03-06	19:00:25
978	15	10600	2027-03-06	19:00:25
979	16	607000	2027-03-06	19:00:25
980	17	872625	2027-03-06	19:00:25
981	18	10000	2027-03-06	19:00:25
982	19	332000	2027-03-06	19:00:25
983	20	750000	2027-03-06	19:00:25
984	21	10700	2027-03-06	19:00:25
985	22	288000	2027-03-06	19:00:25
986	23	828000	2027-03-06	19:00:25
987	24	14000	2027-03-06	19:00:25
988	25	336000	2027-03-06	19:00:25
989	26	578999	2027-03-06	19:00:25
990	101	24800	2027-03-06	19:00:25
991	102	15000	2027-03-06	19:00:25
992	103	100150	2027-03-06	19:00:25
993	200	18000	2027-03-06	19:00:25
994	201	7700	2027-03-06	19:00:25
995	202	9000	2027-03-06	19:00:25
996	203	17400	2027-03-06	19:00:25
997	204	22000	2027-03-06	19:00:25
998	205	13800	2027-03-06	19:00:25
999	206	41600	2027-03-06	19:00:25
1000	207	52499	2027-03-06	19:00:25
1001	1	15800	2027-04-06	00:32:03
1002	2	10000	2027-04-06	00:32:03
1003	3	49800	2027-04-06	00:32:03
1004	9	10000	2027-04-06	00:32:03
1005	10	609999	2027-04-06	00:32:03
1006	11	807692	2027-04-06	00:32:03
1007	12	16000	2027-04-06	00:32:03
1008	13	237000	2027-04-06	00:32:03
1009	14	750000	2027-04-06	00:32:03
1010	15	10000	2027-04-06	00:32:03
1011	16	605000	2027-04-06	00:32:03
1012	17	872625	2027-04-06	00:32:03
1013	18	9500	2027-04-06	00:32:03
1014	19	419000	2027-04-06	00:32:03
1015	20	750000	2027-04-06	00:32:03
1016	21	8400	2027-04-06	00:32:03
1017	22	446000	2027-04-06	00:32:03
1018	23	828000	2027-04-06	00:32:03
1019	24	13800	2027-04-06	00:32:03
1020	25	300000	2027-04-06	00:32:03
1021	26	578999	2027-04-06	00:32:03
1022	101	24800	2027-04-06	00:32:03
1023	102	14800	2027-04-06	00:32:03
1024	103	200000	2027-04-06	00:32:03
1025	200	17600	2027-04-06	00:32:03
1026	201	7400	2027-04-06	00:32:03
1027	202	9000	2027-04-06	00:32:03
1028	203	17400	2027-04-06	00:32:03
1029	204	22000	2027-04-06	00:32:03
1030	205	13500	2027-04-06	00:32:03
1031	206	40000	2027-04-06	00:32:03
1032	207	49800	2027-04-06	00:32:03
1033	1	15800	2027-04-06	09:54:18
1034	2	10000	2027-04-06	09:54:18
1035	3	50000	2027-04-06	09:54:18
1036	9	9500	2027-04-06	09:54:18
1037	10	700000	2027-04-06	09:54:18
1038	11	807692	2027-04-06	09:54:18
1039	12	29600	2027-04-06	09:54:18
1040	13	239949	2027-04-06	09:54:18
1041	14	750000	2027-04-06	09:54:18
1042	15	9400	2027-04-06	09:54:18
1043	16	602999	2027-04-06	09:54:18
1044	17	872625	2027-04-06	09:54:18
1045	18	9500	2027-04-06	09:54:18
1046	19	459999	2027-04-06	09:54:18
1047	20	750000	2027-04-06	09:54:18
1048	21	8400	2027-04-06	09:54:18
1049	22	250000	2027-04-06	09:54:18
1050	23	828000	2027-04-06	09:54:18
1051	24	13800	2027-04-06	09:54:18
1052	25	249999	2027-04-06	09:54:18
1053	26	578999	2027-04-06	09:54:18
1054	101	22800	2027-04-06	09:54:18
1055	102	14999	2027-04-06	09:54:18
1056	103	125000	2027-04-06	09:54:18
1057	200	17500	2027-04-06	09:54:18
1058	201	8000	2027-04-06	09:54:18
1059	202	9000	2027-04-06	09:54:18
1060	203	23392	2027-04-06	09:54:18
1061	204	22200	2027-04-06	09:54:18
1062	205	11600	2027-04-06	09:54:18
1063	206	35000	2027-04-06	09:54:18
1064	207	49200	2027-04-06	09:54:18
1065	1	15000	2027-04-06	17:18:09
1066	2	6900	2027-04-06	17:18:09
1067	3	50000	2027-04-06	17:18:09
1068	9	9400	2027-04-06	17:18:09
1069	10	755500	2027-04-06	17:18:09
1070	11	807692	2027-04-06	17:18:09
1071	12	15700	2027-04-06	17:18:09
1072	13	187100	2027-04-06	17:18:09
1073	14	750000	2027-04-06	17:18:09
1074	15	8855	2027-04-06	17:18:09
1075	16	546000	2027-04-06	17:18:09
1076	17	872625	2027-04-06	17:18:09
1077	18	9400	2027-04-06	17:18:09
1078	19	459999	2027-04-06	17:18:09
1079	20	750000	2027-04-06	17:18:09
1080	21	8300	2027-04-06	17:18:09
1081	22	389000	2027-04-06	17:18:09
1082	23	828000	2027-04-06	17:18:09
1083	24	10805	2027-04-06	17:18:09
1084	25	186100	2027-04-06	17:18:09
1085	26	578999	2027-04-06	17:18:09
1086	101	18400	2027-04-06	17:18:09
1087	102	13333	2027-04-06	17:18:09
1088	103	110000	2027-04-06	17:18:09
1089	200	16400	2027-04-06	17:18:09
1090	201	7800	2027-04-06	17:18:09
1091	202	8600	2027-04-06	17:18:09
1092	203	23200	2027-04-06	17:18:09
1093	204	21000	2027-04-06	17:18:09
1094	205	11800	2027-04-06	17:18:09
1095	206	40000	2027-04-06	17:18:09
1096	207	49200	2027-04-06	17:18:09
1097	1	16033	2027-04-06	22:10:06
1098	2	15400	2027-04-06	22:10:06
1099	3	49400	2027-04-06	22:10:06
1100	9	9300	2027-04-06	22:10:06
1101	10	375000	2027-04-06	22:10:06
1102	11	807692	2027-04-06	22:10:06
1103	12	15600	2027-04-06	22:10:06
1104	13	183333	2027-04-06	22:10:06
1105	14	750000	2027-04-06	22:10:06
1106	15	8800	2027-04-06	22:10:06
1107	16	499000	2027-04-06	22:10:06
1108	17	872625	2027-04-06	22:10:06
1109	18	9300	2027-04-06	22:10:06
1110	19	399000	2027-04-06	22:10:06
1111	20	750000	2027-04-06	22:10:06
1112	21	8100	2027-04-06	22:10:06
1113	22	408000	2027-04-06	22:10:06
1114	23	828000	2027-04-06	22:10:06
1115	24	19200	2027-04-06	22:10:06
1116	25	185750	2027-04-06	22:10:06
1117	26	578999	2027-04-06	22:10:06
1118	101	18495	2027-04-06	22:10:06
1119	102	14000	2027-04-06	22:10:06
1120	103	104750	2027-04-06	22:10:06
1121	200	16200	2027-04-06	22:10:06
1122	201	22400	2027-04-06	22:10:06
1123	202	8500	2027-04-06	22:10:06
1124	203	22500	2027-04-06	22:10:06
1125	204	21800	2027-04-06	22:10:06
1126	205	11399	2027-04-06	22:10:06
1127	206	39600	2027-04-06	22:10:06
1128	207	49200	2027-04-06	22:10:06
1129	1	14600	2027-05-06	12:10:56
1130	2	10800	2027-05-06	12:10:56
1131	3	75000	2027-05-06	12:10:56
1132	9	9400	2027-05-06	12:10:56
1133	10	699999	2027-05-06	12:10:56
1134	11	807692	2027-05-06	12:10:56
1135	12	15600	2027-05-06	12:10:56
1136	13	318000	2027-05-06	12:10:56
1137	14	750000	2027-05-06	12:10:56
1138	15	8700	2027-05-06	12:10:56
1139	16	310000	2027-05-06	12:10:56
1140	17	872625	2027-05-06	12:10:56
1141	18	9000	2027-05-06	12:10:56
1142	19	373000	2027-05-06	12:10:56
1143	20	750000	2027-05-06	12:10:56
1144	21	9500	2027-05-06	12:10:56
1145	22	387000	2027-05-06	12:10:56
1146	23	828000	2027-05-06	12:10:56
1147	24	18800	2027-05-06	12:10:56
1148	25	148000	2027-05-06	12:10:56
1149	26	578999	2027-05-06	12:10:56
1150	101	21600	2027-05-06	12:10:56
1151	102	20000	2027-05-06	12:10:56
1152	103	104500	2027-05-06	12:10:56
1153	200	14400	2027-05-06	12:10:56
1154	201	20400	2027-05-06	12:10:56
1155	202	14600	2027-05-06	12:10:56
1156	203	21800	2027-05-06	12:10:56
1157	204	21600	2027-05-06	12:10:56
1158	205	32250	2027-05-06	12:10:56
1159	206	36400	2027-05-06	12:10:56
1160	207	42000	2027-05-06	12:10:56
1161	1	40000	2027-05-06	19:28:33
1162	2	9900	2027-05-06	19:28:33
1163	3	63999	2027-05-06	19:28:33
1164	9	9200	2027-05-06	19:28:33
1165	10	590000	2027-05-06	19:28:33
1166	11	807692	2027-05-06	19:28:33
1167	12	20000	2027-05-06	19:28:33
1168	13	296000	2027-05-06	19:28:33
1169	14	750000	2027-05-06	19:28:33
1170	15	8205	2027-05-06	19:28:33
1171	16	248000	2027-05-06	19:28:33
1172	17	872625	2027-05-06	19:28:33
1173	18	8000	2027-05-06	19:28:33
1174	19	371000	2027-05-06	19:28:33
1175	20	750000	2027-05-06	19:28:33
1176	21	9300	2027-05-06	19:28:33
1177	22	387000	2027-05-06	19:28:33
1178	23	828000	2027-05-06	19:28:33
1179	24	14800	2027-05-06	19:28:33
1180	25	137500	2027-05-06	19:28:33
1181	26	578999	2027-05-06	19:28:33
1182	101	21000	2027-05-06	19:28:33
1183	102	19000	2027-05-06	19:28:33
1184	103	165000	2027-05-06	19:28:33
1185	200	13200	2027-05-06	19:28:33
1186	201	19200	2027-05-06	19:28:33
1187	202	10000	2027-05-06	19:28:33
1188	203	16500	2027-05-06	19:28:33
1189	204	19800	2027-05-06	19:28:33
1190	205	17200	2027-05-06	19:28:33
1191	206	35000	2027-05-06	19:28:33
1192	207	40000	2027-05-06	19:28:33
1193	1	5000	2027-05-06	22:53:19
1194	2	9600	2027-05-06	22:53:19
1195	3	64000	2027-05-06	22:53:19
1196	9	3800	2027-05-06	22:53:19
1197	10	497800	2027-05-06	22:53:19
1198	11	807692	2027-05-06	22:53:19
1199	12	17088	2027-05-06	22:53:19
1200	13	274000	2027-05-06	22:53:19
1201	14	750000	2027-05-06	22:53:19
1202	15	7227	2027-05-06	22:53:19
1203	16	358000	2027-05-06	22:53:19
1204	17	872625	2027-05-06	22:53:19
1205	18	7500	2027-05-06	22:53:19
1206	19	368000	2027-05-06	22:53:19
1207	20	750000	2027-05-06	22:53:19
1208	21	9200	2027-05-06	22:53:19
1209	22	387000	2027-05-06	22:53:19
1210	23	828000	2027-05-06	22:53:19
1211	24	14137	2027-05-06	22:53:19
1212	25	135500	2027-05-06	22:53:19
1213	26	578999	2027-05-06	22:53:19
1214	101	20600	2027-05-06	22:53:19
1215	102	15000	2027-05-06	22:53:19
1216	103	165000	2027-05-06	22:53:19
1217	200	14400	2027-05-06	22:53:19
1218	201	16500	2027-05-06	22:53:19
1219	202	10200	2027-05-06	22:53:19
1220	203	14500	2027-05-06	22:53:19
1221	204	5000	2027-05-06	22:53:19
1222	205	9500	2027-05-06	22:53:19
1223	206	34400	2027-05-06	22:53:19
1224	207	39400	2027-05-06	22:53:19
1225	1	21000	2027-06-06	11:47:42
1226	2	10500	2027-06-06	11:47:42
1227	3	63500	2027-06-06	11:47:42
1228	9	3200	2027-06-06	11:47:42
1229	10	520000	2027-06-06	11:47:42
1230	11	807692	2027-06-06	11:47:42
1231	12	17000	2027-06-06	11:47:42
1232	13	247000	2027-06-06	11:47:42
1233	14	750000	2027-06-06	11:47:42
1234	15	6300	2027-06-06	11:47:42
1235	16	269000	2027-06-06	11:47:42
1236	17	872625	2027-06-06	11:47:42
1237	18	6399	2027-06-06	11:47:42
1238	19	387999	2027-06-06	11:47:42
1239	20	750000	2027-06-06	11:47:42
1240	21	7400	2027-06-06	11:47:42
1241	22	348000	2027-06-06	11:47:42
1242	23	828000	2027-06-06	11:47:42
1243	24	10500	2027-06-06	11:47:42
1244	25	97999	2027-06-06	11:47:42
1245	26	578999	2027-06-06	11:47:42
1246	101	19800	2027-06-06	11:47:42
1247	102	18000	2027-06-06	11:47:42
1248	103	138500	2027-06-06	11:47:42
1249	200	14000	2027-06-06	11:47:42
1250	201	9900	2027-06-06	11:47:42
1251	202	9700	2027-06-06	11:47:42
1252	203	13300	2027-06-06	11:47:42
1253	204	19400	2027-06-06	11:47:42
1254	205	24200	2027-06-06	11:47:42
1255	206	29800	2027-06-06	11:47:42
1256	207	37400	2027-06-06	11:47:42
\.


--
-- Data for Name: r_venta_gemas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.r_venta_gemas (orden_venta_gemas, orden_pulida_venta_gemas, id_valor_venta_gemas, tiempo_venta_gemas, precio_deposito_venta_gemas, valor_venta_gemas, estado_venta_gemas, resultado_venta_gemas, fecha_venta_gemas, hora_venta_gemas, metodo_venta_gemas) FROM stdin;
1	1	1	12	187	39800	1	39501	2026-05-20	11:10:00	1
2	1	1	12	187	39800	2	-187	2026-05-20	11:10:00	1
3	1	1	12	187	39800	2	-187	2026-05-20	11:10:00	1
4	1	1	12	187	39800	2	-187	2026-05-20	11:10:00	1
5	2	1	12	187	49800	1	49426	2026-05-20	11:10:00	1
6	2	1	12	187	49800	1	49426	2026-05-20	11:10:00	1
7	2	1	12	187	49800	1	49426	2026-05-20	11:10:00	1
8	3	1	12	187	50000	2	-187	2026-05-20	11:10:00	1
9	3	1	12	187	50000	2	-187	2026-05-20	11:10:00	1
10	3	1	12	187	50000	2	-187	2026-05-20	11:10:00	1
11	3	1	12	187	50000	2	-187	2026-05-20	11:10:00	1
12	3	1	12	187	50000	2	-187	2026-05-20	11:10:00	1
13	3	1	12	187	50000	2	-187	2026-05-20	11:10:00	1
14	4	1	12	187	39800	2	-187	2026-05-20	11:10:00	1
15	4	1	12	187	39800	2	-187	2026-05-20	11:10:00	1
16	4	1	12	187	39800	2	-187	2026-05-20	11:10:00	1
17	5	1	12	187	70000	2	-187	2026-05-20	11:10:00	1
18	5	1	12	187	70000	2	-187	2026-05-20	11:10:00	1
19	5	1	12	187	70000	2	-187	2026-05-20	11:10:00	1
20	5	1	12	187	70000	2	-187	2026-05-20	11:10:00	1
21	6	1	12	187	77500	2	-187	2026-05-20	11:10:00	1
22	6	1	12	187	77500	2	-187	2026-05-20	11:10:00	1
23	6	1	12	187	77500	2	-187	2026-05-20	11:10:00	1
24	6	1	12	187	77500	2	-187	2026-05-20	11:10:00	1
25	1	1	12	187	89000	2	-187	2026-05-22	00:06:00	1
26	1	1	12	187	89000	2	-187	2026-05-22	00:06:00	1
27	1	1	12	187	89000	2	-187	2026-05-22	00:06:00	1
28	3	1	12	187	69500	2	-187	2026-05-22	00:06:00	1
29	3	1	12	187	69500	2	-187	2026-05-22	00:06:00	1
30	3	1	12	187	69500	2	-187	2026-05-22	00:06:00	1
31	3	1	12	187	69500	2	-187	2026-05-22	00:06:00	1
32	3	1	12	187	69500	2	-187	2026-05-22	00:06:00	1
33	3	1	12	187	69500	2	-187	2026-05-22	00:06:00	1
34	4	1	12	187	23900	1	23720	2026-05-22	00:06:00	1
35	4	1	12	187	23900	1	23720	2026-05-22	00:06:00	1
36	4	1	12	187	23900	1	23720	2026-05-22	00:06:00	1
37	5	1	12	187	49500	2	-187	2026-05-22	00:06:00	1
38	5	1	12	187	49500	2	-187	2026-05-22	00:06:00	1
39	5	1	12	187	49500	2	-187	2026-05-22	00:06:00	1
40	5	1	12	187	49500	2	-187	2026-05-22	00:06:00	1
41	6	1	12	187	29600	1	29378	2026-05-22	00:06:00	1
42	6	1	12	187	29600	2	-187	2026-05-22	00:06:00	1
43	6	1	12	187	29600	2	-187	2026-05-22	00:06:00	1
44	6	1	12	187	29600	2	-187	2026-05-22	00:06:00	1
45	1	1	12	187	89000	2	-187	2026-05-22	16:28:00	1
46	1	1	12	187	89000	2	-187	2026-05-22	16:28:00	1
47	1	1	12	187	89000	2	-187	2026-05-22	16:28:00	1
48	3	1	12	187	59000	2	-187	2026-05-22	16:28:00	1
49	3	1	12	187	59000	2	-187	2026-05-22	16:28:00	1
50	3	1	12	187	59000	2	-187	2026-05-22	16:28:00	1
51	3	1	12	187	59000	2	-187	2026-05-22	16:28:00	1
52	3	1	12	187	59000	2	-187	2026-05-22	16:28:00	1
53	3	1	12	187	59000	2	-187	2026-05-22	16:28:00	1
54	5	1	12	187	39500	1	39203	2026-05-22	16:28:00	1
55	5	1	12	187	39500	2	-187	2026-05-22	16:28:00	1
56	5	1	12	187	39500	2	-187	2026-05-22	16:28:00	1
57	5	1	12	187	39500	2	-187	2026-05-22	16:28:00	1
58	6	1	12	187	29200	2	-187	2026-05-22	16:28:00	1
59	6	1	12	187	29200	2	-187	2026-05-22	16:28:00	1
60	6	1	12	187	29200	2	-187	2026-05-22	16:28:00	1
61	1	1	12	187	99000	1	98257	2026-05-23	19:30:00	1
62	1	1	12	187	99000	2	-187	2026-05-23	19:30:00	1
63	1	1	12	187	99000	2	-187	2026-05-23	19:30:00	1
64	3	1	12	187	56500	2	-187	2026-05-23	19:30:00	1
65	3	1	12	187	56500	2	-187	2026-05-23	19:30:00	1
66	3	1	12	187	56500	2	-187	2026-05-23	19:30:00	1
67	3	1	12	187	56500	2	-187	2026-05-23	19:30:00	1
68	3	1	12	187	56500	2	-187	2026-05-23	19:30:00	1
69	3	1	12	187	56500	2	-187	2026-05-23	19:30:00	1
70	5	1	12	187	49500	2	-187	2026-05-23	19:30:00	1
71	5	1	12	187	49500	2	-187	2026-05-23	19:30:00	1
72	5	1	12	187	49500	2	-187	2026-05-23	19:30:00	1
73	6	1	12	187	28800	1	28584	2026-05-23	19:30:00	1
74	6	1	12	187	28800	1	28584	2026-05-23	19:30:00	1
75	6	1	12	187	28800	1	28584	2026-05-23	19:30:00	1
76	7	4	24	4500	959000	2	-4500	2026-05-23	19:30:00	1
77	7	4	24	4500	959000	2	-4500	2026-05-23	19:30:00	1
78	1	1	12	187	87500	1	86843	2026-05-24	23:20:00	1
79	1	1	12	187	87500	2	-187	2026-05-24	23:20:00	1
80	3	1	12	187	29600	2	-187	2026-05-24	23:20:00	1
81	3	1	12	187	29600	2	-187	2026-05-24	23:20:00	1
82	3	1	12	187	29600	2	-187	2026-05-24	23:20:00	1
83	3	1	12	187	29600	2	-187	2026-05-24	23:20:00	1
84	3	1	12	187	29600	2	-187	2026-05-24	23:20:00	1
85	3	1	12	187	29600	2	-187	2026-05-24	23:20:00	1
86	5	1	12	187	39500	2	-187	2026-05-24	23:20:00	1
87	5	1	12	187	39500	2	-187	2026-05-24	23:20:00	1
88	5	1	12	187	39500	2	-187	2026-05-24	23:20:00	1
89	7	4	24	4500	957000	2	-4500	2026-05-24	23:20:00	1
90	7	4	24	4500	957000	2	-4500	2026-05-24	23:20:00	1
91	1	1	12	187	85000	1	84362	2026-05-26	00:05:00	1
92	3	1	12	187	12500	1	12406	2026-05-26	00:05:00	1
93	3	1	12	187	12500	2	-187	2026-05-26	00:05:00	1
94	3	1	12	187	12500	2	-187	2026-05-26	00:05:00	1
95	3	1	12	187	12500	2	-187	2026-05-26	00:05:00	1
96	3	1	12	187	12500	2	-187	2026-05-26	00:05:00	1
97	3	1	12	187	12500	2	-187	2026-05-26	00:05:00	1
98	5	1	12	187	29500	1	29278	2026-05-26	00:05:00	1
99	5	1	12	187	29500	1	29278	2026-05-26	00:05:00	1
100	5	1	12	187	29500	1	29278	2026-05-26	00:05:00	1
101	7	4	12	2250	749900	2	-2250	2026-05-26	00:05:00	1
102	7	4	12	2250	749900	2	-2250	2026-05-26	00:05:00	1
103	3	1	12	187	15000	1	14887	2026-05-26	12:26:00	1
104	3	1	12	187	15000	1	14887	2026-05-26	12:26:00	1
105	3	1	12	187	15000	1	14887	2026-05-26	12:26:00	1
106	3	1	12	187	15000	1	14887	2026-05-26	12:26:00	1
107	3	1	12	187	15000	1	14887	2026-05-26	12:26:00	1
108	7	4	24	4500	899900	2	-4500	2026-05-26	12:26:00	1
109	7	4	24	4500	899900	2	-4500	2026-05-26	12:26:00	1
110	7	4	12	2250	749900	2	-2250	2026-05-28	10:48:00	1
111	7	4	12	2250	749900	2	-2250	2026-05-28	10:48:00	1
112	7	4	12	2250	699900	2	-2250	2026-05-29	20:25:00	1
113	7	4	12	2250	699900	2	-2250	2026-05-29	20:25:00	1
\.


--
-- Name: d_categoria_producto d_categoria_producto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.d_categoria_producto
    ADD CONSTRAINT d_categoria_producto_pkey PRIMARY KEY (id_categoria_producto);


--
-- Name: d_convertibilidad d_convertibilidad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.d_convertibilidad
    ADD CONSTRAINT d_convertibilidad_pkey PRIMARY KEY (convertibilidad_moneda);


--
-- Name: d_correo d_correo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.d_correo
    ADD CONSTRAINT d_correo_pkey PRIMARY KEY (id_correo);


--
-- Name: d_deposito d_deposito_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.d_deposito
    ADD CONSTRAINT d_deposito_pkey PRIMARY KEY (tiempo_deposito);


--
-- Name: d_gema_valor d_gema_valor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.d_gema_valor
    ADD CONSTRAINT d_gema_valor_pkey PRIMARY KEY (id_gema_valor);


--
-- Name: d_gemas_atributos d_gemas_atributos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.d_gemas_atributos
    ADD CONSTRAINT d_gemas_atributos_pkey PRIMARY KEY (id_gemas_atributos);


--
-- Name: d_id_objectos d_id_objectos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.d_id_objectos
    ADD CONSTRAINT d_id_objectos_pkey PRIMARY KEY (id_objectos);


--
-- Name: d_recetas_id d_recetas_id_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.d_recetas_id
    ADD CONSTRAINT d_recetas_id_pkey PRIMARY KEY (id_recetas);


--
-- Name: d_recetas_materiales d_recetas_materiales_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.d_recetas_materiales
    ADD CONSTRAINT d_recetas_materiales_pkey PRIMARY KEY (id_recetas_materiales, id_objectos_receta_materiales);


--
-- Name: d_tipo_recoleccion d_tipo_recoleccion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.d_tipo_recoleccion
    ADD CONSTRAINT d_tipo_recoleccion_pkey PRIMARY KEY (id_tipo_recoleccion);


--
-- Name: d_venta_estado d_venta_estado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.d_venta_estado
    ADD CONSTRAINT d_venta_estado_pkey PRIMARY KEY (id_venta_estado);


--
-- Name: d_venta_metodo d_venta_metodo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.d_venta_metodo
    ADD CONSTRAINT d_venta_metodo_pkey PRIMARY KEY (id_venta_metodo);


--
-- Name: r_consumo_lotes r_consumo_lotes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.r_consumo_lotes
    ADD CONSTRAINT r_consumo_lotes_pkey PRIMARY KEY (orden_consumo_lotes);


--
-- Name: r_consumos_objectos r_consumos_objectos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.r_consumos_objectos
    ADD CONSTRAINT r_consumos_objectos_pkey PRIMARY KEY (orden_consumos_objectos);


--
-- Name: r_gasto r_gasto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.r_gasto
    ADD CONSTRAINT r_gasto_pkey PRIMARY KEY (orden_gasto);


--
-- Name: r_gemas_pulidas r_gemas_pulidas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.r_gemas_pulidas
    ADD CONSTRAINT r_gemas_pulidas_pkey PRIMARY KEY (orden_gemas_pulidas);


--
-- Name: r_prospeccion_lotes r_prospeccion_lotes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.r_prospeccion_lotes
    ADD CONSTRAINT r_prospeccion_lotes_pkey PRIMARY KEY (orden_prospeccion_lotes);


--
-- Name: r_prospeccion_resultados r_prospeccion_resultados_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.r_prospeccion_resultados
    ADD CONSTRAINT r_prospeccion_resultados_pkey PRIMARY KEY (orden_prospeccion_resultados);


--
-- Name: r_recetas_consumo r_recetas_consumo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.r_recetas_consumo
    ADD CONSTRAINT r_recetas_consumo_pkey PRIMARY KEY (orden_recetas_consumo);


--
-- Name: r_recoleccion r_recoleccion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.r_recoleccion
    ADD CONSTRAINT r_recoleccion_pkey PRIMARY KEY (orden_recoleccion);


--
-- Name: r_registro_poblacion r_registro_poblacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.r_registro_poblacion
    ADD CONSTRAINT r_registro_poblacion_pkey PRIMARY KEY (orden_poblacion);


--
-- Name: r_transmutaciones r_transmutaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.r_transmutaciones
    ADD CONSTRAINT r_transmutaciones_pkey PRIMARY KEY (orden_transmutaciones);


--
-- Name: r_transmutaciones_resultados r_transmutaciones_resultados_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.r_transmutaciones_resultados
    ADD CONSTRAINT r_transmutaciones_resultados_pkey PRIMARY KEY (orden_transmutaciones_resultados);


--
-- Name: r_valor_subasta r_valor_subasta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.r_valor_subasta
    ADD CONSTRAINT r_valor_subasta_pkey PRIMARY KEY (orden_valor_subasta);


--
-- Name: r_venta_gemas r_venta_gemas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.r_venta_gemas
    ADD CONSTRAINT r_venta_gemas_pkey PRIMARY KEY (orden_venta_gemas);


--
-- Name: d_recetas_id d_recetas_id_categoria_recetas_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.d_recetas_id
    ADD CONSTRAINT d_recetas_id_categoria_recetas_id_fkey FOREIGN KEY (categoria_recetas_id) REFERENCES public.d_categoria_producto(id_categoria_producto);


--
-- Name: d_recetas_materiales d_recetas_materiales_id_objectos_receta_materiales_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.d_recetas_materiales
    ADD CONSTRAINT d_recetas_materiales_id_objectos_receta_materiales_fkey FOREIGN KEY (id_objectos_receta_materiales) REFERENCES public.d_id_objectos(id_objectos);


--
-- Name: d_recetas_materiales d_recetas_materiales_id_recetas_materiales_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.d_recetas_materiales
    ADD CONSTRAINT d_recetas_materiales_id_recetas_materiales_fkey FOREIGN KEY (id_recetas_materiales) REFERENCES public.d_recetas_id(id_recetas);


--
-- Name: r_consumo_lotes r_consumo_lotes_id_consumo_lotes_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.r_consumo_lotes
    ADD CONSTRAINT r_consumo_lotes_id_consumo_lotes_fkey FOREIGN KEY (id_consumo_lotes) REFERENCES public.d_id_objectos(id_objectos);


--
-- Name: r_consumos_objectos r_consumos_objectos_categoria_consumos_objectos_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.r_consumos_objectos
    ADD CONSTRAINT r_consumos_objectos_categoria_consumos_objectos_fkey FOREIGN KEY (categoria_consumos_objectos) REFERENCES public.d_categoria_producto(id_categoria_producto);


--
-- Name: r_consumos_objectos r_consumos_objectos_id_consumos_objectos_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.r_consumos_objectos
    ADD CONSTRAINT r_consumos_objectos_id_consumos_objectos_fkey FOREIGN KEY (id_consumos_objectos) REFERENCES public.d_id_objectos(id_objectos);


--
-- Name: r_consumos_objectos r_consumos_objectos_obtengo_consumos_objectos_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.r_consumos_objectos
    ADD CONSTRAINT r_consumos_objectos_obtengo_consumos_objectos_id_fkey FOREIGN KEY (obtengo_consumos_objectos_id) REFERENCES public.d_id_objectos(id_objectos);


--
-- Name: r_gasto r_gasto_gasto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.r_gasto
    ADD CONSTRAINT r_gasto_gasto_id_fkey FOREIGN KEY (gasto_id) REFERENCES public.d_id_objectos(id_objectos);


--
-- Name: r_gemas_pulidas r_gemas_pulidas_atributos_1_gemas_pulidas_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.r_gemas_pulidas
    ADD CONSTRAINT r_gemas_pulidas_atributos_1_gemas_pulidas_fkey FOREIGN KEY (atributos_1_gemas_pulidas) REFERENCES public.d_gemas_atributos(id_gemas_atributos);


--
-- Name: r_gemas_pulidas r_gemas_pulidas_atributos_2_gemas_pulidas_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.r_gemas_pulidas
    ADD CONSTRAINT r_gemas_pulidas_atributos_2_gemas_pulidas_fkey FOREIGN KEY (atributos_2_gemas_pulidas) REFERENCES public.d_gemas_atributos(id_gemas_atributos);


--
-- Name: r_gemas_pulidas r_gemas_pulidas_id_gemas_pulidas_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.r_gemas_pulidas
    ADD CONSTRAINT r_gemas_pulidas_id_gemas_pulidas_fkey FOREIGN KEY (id_gemas_pulidas) REFERENCES public.d_id_objectos(id_objectos);


--
-- Name: r_prospeccion_lotes r_prospeccion_lotes_id_mineral_prospeccion_lotes_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.r_prospeccion_lotes
    ADD CONSTRAINT r_prospeccion_lotes_id_mineral_prospeccion_lotes_fkey FOREIGN KEY (id_mineral_prospeccion_lotes) REFERENCES public.d_id_objectos(id_objectos);


--
-- Name: r_prospeccion_resultados r_prospeccion_resultados_id_gema_prospeccion_resultados_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.r_prospeccion_resultados
    ADD CONSTRAINT r_prospeccion_resultados_id_gema_prospeccion_resultados_fkey FOREIGN KEY (id_gema_prospeccion_resultados) REFERENCES public.d_id_objectos(id_objectos);


--
-- Name: r_prospeccion_resultados r_prospeccion_resultados_lote_prospeccion_resultados_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.r_prospeccion_resultados
    ADD CONSTRAINT r_prospeccion_resultados_lote_prospeccion_resultados_fkey FOREIGN KEY (lote_prospeccion_resultados) REFERENCES public.r_prospeccion_lotes(orden_prospeccion_lotes);


--
-- Name: r_recetas_consumo r_recetas_consumo_id_recetas_consumo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.r_recetas_consumo
    ADD CONSTRAINT r_recetas_consumo_id_recetas_consumo_fkey FOREIGN KEY (id_recetas_consumo) REFERENCES public.d_recetas_id(id_recetas);


--
-- Name: r_recoleccion r_recoleccion_categoria_recoleccion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.r_recoleccion
    ADD CONSTRAINT r_recoleccion_categoria_recoleccion_fkey FOREIGN KEY (categoria_recoleccion) REFERENCES public.d_categoria_producto(id_categoria_producto);


--
-- Name: r_recoleccion r_recoleccion_id_objecto_recoleccion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.r_recoleccion
    ADD CONSTRAINT r_recoleccion_id_objecto_recoleccion_fkey FOREIGN KEY (id_objecto_recoleccion) REFERENCES public.d_id_objectos(id_objectos);


--
-- Name: r_recoleccion r_recoleccion_metodo_recoleccion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.r_recoleccion
    ADD CONSTRAINT r_recoleccion_metodo_recoleccion_fkey FOREIGN KEY (metodo_recoleccion) REFERENCES public.d_tipo_recoleccion(id_tipo_recoleccion);


--
-- Name: r_transmutaciones r_transmutaciones_receta_transmutaciones_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.r_transmutaciones
    ADD CONSTRAINT r_transmutaciones_receta_transmutaciones_fkey FOREIGN KEY (receta_transmutaciones) REFERENCES public.d_recetas_id(id_recetas);


--
-- Name: r_transmutaciones_resultados r_transmutaciones_resultados_obtengo_objecto_transmutacion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.r_transmutaciones_resultados
    ADD CONSTRAINT r_transmutaciones_resultados_obtengo_objecto_transmutacion_fkey FOREIGN KEY (obtengo_objecto_transmutaciones_resultados) REFERENCES public.d_id_objectos(id_objectos);


--
-- Name: r_transmutaciones_resultados r_transmutaciones_resultados_orden_transmutacion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.r_transmutaciones_resultados
    ADD CONSTRAINT r_transmutaciones_resultados_orden_transmutacion_fkey FOREIGN KEY (orden_transmutacion) REFERENCES public.r_transmutaciones(orden_transmutaciones);


--
-- Name: r_valor_subasta r_valor_subasta_id_objecto_valor_subasta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.r_valor_subasta
    ADD CONSTRAINT r_valor_subasta_id_objecto_valor_subasta_fkey FOREIGN KEY (id_objecto_valor_subasta) REFERENCES public.d_id_objectos(id_objectos);


--
-- Name: r_venta_gemas r_venta_gemas_estado_venta_gemas_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.r_venta_gemas
    ADD CONSTRAINT r_venta_gemas_estado_venta_gemas_fkey FOREIGN KEY (estado_venta_gemas) REFERENCES public.d_venta_estado(id_venta_estado);


--
-- Name: r_venta_gemas r_venta_gemas_id_valor_venta_gemas_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.r_venta_gemas
    ADD CONSTRAINT r_venta_gemas_id_valor_venta_gemas_fkey FOREIGN KEY (id_valor_venta_gemas) REFERENCES public.d_gema_valor(id_gema_valor);


--
-- Name: r_venta_gemas r_venta_gemas_metodo_venta_gemas_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.r_venta_gemas
    ADD CONSTRAINT r_venta_gemas_metodo_venta_gemas_fkey FOREIGN KEY (metodo_venta_gemas) REFERENCES public.d_venta_metodo(id_venta_metodo);


--
-- Name: r_venta_gemas r_venta_gemas_orden_pulida_venta_gemas_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.r_venta_gemas
    ADD CONSTRAINT r_venta_gemas_orden_pulida_venta_gemas_fkey FOREIGN KEY (orden_pulida_venta_gemas) REFERENCES public.r_gemas_pulidas(orden_gemas_pulidas);


--
-- Name: r_venta_gemas r_venta_gemas_tiempo_venta_gemas_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.r_venta_gemas
    ADD CONSTRAINT r_venta_gemas_tiempo_venta_gemas_fkey FOREIGN KEY (tiempo_venta_gemas) REFERENCES public.d_deposito(tiempo_deposito);


--
-- PostgreSQL database dump complete
--

\unrestrict Fwq6wsp7V7JTC9nzQMu9zL9SutLMIjM646BwWvkppcA5pGLSC2rsDWJtcuAaaIa

