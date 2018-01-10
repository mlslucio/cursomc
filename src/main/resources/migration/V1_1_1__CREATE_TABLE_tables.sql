--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.6
-- Dumped by pg_dump version 9.6.6

-- Started on 2018-01-10 15:56:32

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12387)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2248 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 186 (class 1259 OID 18471)
-- Name: categoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE categoria (
    id integer NOT NULL,
    nome character varying(255)
);


ALTER TABLE categoria OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 18469)
-- Name: categoria_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE categoria_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE categoria_id_seq OWNER TO postgres;

--
-- TOC entry 2249 (class 0 OID 0)
-- Dependencies: 185
-- Name: categoria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE categoria_id_seq OWNED BY categoria.id;


--
-- TOC entry 188 (class 1259 OID 18479)
-- Name: cidade; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cidade (
    id integer NOT NULL,
    nome character varying(255),
    estado_id integer
);


ALTER TABLE cidade OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 18477)
-- Name: cidade_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cidade_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cidade_id_seq OWNER TO postgres;

--
-- TOC entry 2250 (class 0 OID 0)
-- Dependencies: 187
-- Name: cidade_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cidade_id_seq OWNED BY cidade.id;


--
-- TOC entry 190 (class 1259 OID 18487)
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cliente (
    id integer NOT NULL,
    cpf character varying(255),
    email character varying(255),
    nome character varying(255),
    tipo integer
);


ALTER TABLE cliente OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 18485)
-- Name: cliente_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cliente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cliente_id_seq OWNER TO postgres;

--
-- TOC entry 2251 (class 0 OID 0)
-- Dependencies: 189
-- Name: cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cliente_id_seq OWNED BY cliente.id;


--
-- TOC entry 192 (class 1259 OID 18498)
-- Name: endereco; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE endereco (
    id integer NOT NULL,
    bairro character varying(255),
    cep character varying(255),
    complemento character varying(255),
    lorgadoura character varying(255),
    numero character varying(255),
    cidade_id integer,
    cliente_id integer
);


ALTER TABLE endereco OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 18496)
-- Name: endereco_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE endereco_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE endereco_id_seq OWNER TO postgres;

--
-- TOC entry 2252 (class 0 OID 0)
-- Dependencies: 191
-- Name: endereco_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE endereco_id_seq OWNED BY endereco.id;


--
-- TOC entry 194 (class 1259 OID 18509)
-- Name: estado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE estado (
    id integer NOT NULL,
    nome character varying(255)
);


ALTER TABLE estado OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 18507)
-- Name: estado_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE estado_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE estado_id_seq OWNER TO postgres;

--
-- TOC entry 2253 (class 0 OID 0)
-- Dependencies: 193
-- Name: estado_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE estado_id_seq OWNED BY estado.id;


--
-- TOC entry 195 (class 1259 OID 18515)
-- Name: item_pedido; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE item_pedido (
    desconto double precision NOT NULL,
    preco double precision NOT NULL,
    quantidade integer,
    pedido_id integer NOT NULL,
    produto_id integer NOT NULL
);


ALTER TABLE item_pedido OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 18520)
-- Name: pagamento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE pagamento (
    pedido_id integer NOT NULL,
    estado integer
);


ALTER TABLE pagamento OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 18525)
-- Name: pagamento_com_boleto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE pagamento_com_boleto (
    data_pagamento timestamp without time zone,
    data_vencimento timestamp without time zone,
    pedido_id integer NOT NULL
);


ALTER TABLE pagamento_com_boleto OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 18530)
-- Name: pagamento_com_cartao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE pagamento_com_cartao (
    numero_de_parcelas integer,
    pedido_id integer NOT NULL
);


ALTER TABLE pagamento_com_cartao OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 18537)
-- Name: pedido; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE pedido (
    id integer NOT NULL,
    instante timestamp without time zone,
    cliente_id integer,
    endereco_de_entrega_id integer
);


ALTER TABLE pedido OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 18535)
-- Name: pedido_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pedido_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pedido_id_seq OWNER TO postgres;

--
-- TOC entry 2254 (class 0 OID 0)
-- Dependencies: 199
-- Name: pedido_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pedido_id_seq OWNED BY pedido.id;


--
-- TOC entry 202 (class 1259 OID 18545)
-- Name: produto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE produto (
    id integer NOT NULL,
    nome character varying(255),
    preco double precision NOT NULL
);


ALTER TABLE produto OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 18551)
-- Name: produto_categoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE produto_categoria (
    produto_id integer NOT NULL,
    categoria_id integer NOT NULL
);


ALTER TABLE produto_categoria OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 18543)
-- Name: produto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE produto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE produto_id_seq OWNER TO postgres;

--
-- TOC entry 2255 (class 0 OID 0)
-- Dependencies: 201
-- Name: produto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE produto_id_seq OWNED BY produto.id;


--
-- TOC entry 204 (class 1259 OID 18554)
-- Name: telefone; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE telefone (
    cliente_id integer NOT NULL,
    telefones character varying(255)
);


ALTER TABLE telefone OWNER TO postgres;

--
-- TOC entry 2063 (class 2604 OID 18474)
-- Name: categoria id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categoria ALTER COLUMN id SET DEFAULT nextval('categoria_id_seq'::regclass);


--
-- TOC entry 2064 (class 2604 OID 18482)
-- Name: cidade id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cidade ALTER COLUMN id SET DEFAULT nextval('cidade_id_seq'::regclass);


--
-- TOC entry 2065 (class 2604 OID 18490)
-- Name: cliente id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cliente ALTER COLUMN id SET DEFAULT nextval('cliente_id_seq'::regclass);


--
-- TOC entry 2066 (class 2604 OID 18501)
-- Name: endereco id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY endereco ALTER COLUMN id SET DEFAULT nextval('endereco_id_seq'::regclass);


--
-- TOC entry 2067 (class 2604 OID 18512)
-- Name: estado id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY estado ALTER COLUMN id SET DEFAULT nextval('estado_id_seq'::regclass);


--
-- TOC entry 2068 (class 2604 OID 18540)
-- Name: pedido id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pedido ALTER COLUMN id SET DEFAULT nextval('pedido_id_seq'::regclass);


--
-- TOC entry 2069 (class 2604 OID 18548)
-- Name: produto id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produto ALTER COLUMN id SET DEFAULT nextval('produto_id_seq'::regclass);


--
-- TOC entry 2223 (class 0 OID 18471)
-- Dependencies: 186
-- Data for Name: categoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY categoria (id, nome) FROM stdin;
1 Informática
2 Escritório
3 Jardinagem
4 Pesca
5 Cama, mesa e banho
6 Alimentação
7 Informática
8 Escritório
9 Jardinagem
10  Pesca
11  Cama, mesa e banho
12  Alimentação
13  Informática
14  Escritório
15  Jardinagem
16  Pesca
17  Cama, mesa e banho
18  Alimentação
19  Informática
20  Escritório
21  Jardinagem
22  Pesca
23  Cama, mesa e banho
24  Alimentação
25  Informática
26  Escritório
27  Jardinagem
28  Pesca
29  Cama, mesa e banho
30  Alimentação
31  Informática
32  Escritório
33  Jardinagem
34  Pesca
35  Cama, mesa e banho
36  Alimentação
\.


--
-- TOC entry 2256 (class 0 OID 0)
-- Dependencies: 185
-- Name: categoria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('categoria_id_seq', 36, true);


--
-- TOC entry 2225 (class 0 OID 18479)
-- Dependencies: 188
-- Data for Name: cidade; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cidade (id, nome, estado_id) FROM stdin;
1 Uberlândia  1
2 São Paulo 2
3 Campinas  2
4 Uberlândia  3
5 São Paulo 4
6 Campinas  4
7 Uberlândia  5
8 São Paulo 6
9 Campinas  6
10  Uberlândia  7
11  São Paulo 8
12  Campinas  8
13  Uberlândia  9
14  São Paulo 10
15  Campinas  10
16  Uberlândia  11
17  São Paulo 12
18  Campinas  12
\.


--
-- TOC entry 2257 (class 0 OID 0)
-- Dependencies: 187
-- Name: cidade_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cidade_id_seq', 18, true);


--
-- TOC entry 2227 (class 0 OID 18487)
-- Dependencies: 190
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cliente (id, cpf, email, nome, tipo) FROM stdin;
1 123123123 maria@gmail.com Maria Silva 1
2 123123123 maria@gmail.com Maria Silva 1
3 123123123 maria@gmail.com Maria Silva 1
4 123123123 maria@gmail.com Maria Silva 1
5 123123123 maria@gmail.com Maria Silva 1
6 123123123 maria@gmail.com Maria Silva 1
\.


--
-- TOC entry 2258 (class 0 OID 0)
-- Dependencies: 189
-- Name: cliente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cliente_id_seq', 6, true);


--
-- TOC entry 2229 (class 0 OID 18498)
-- Dependencies: 192
-- Data for Name: endereco; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY endereco (id, bairro, cep, complemento, lorgadoura, numero, cidade_id, cliente_id) FROM stdin;
1 jardim  123123  apto 303  Rua flores  304 1 1
2 foresta 2342432 casa  Rua arvores 453 2 1
3 jardim  123123  apto 303  Rua flores  304 4 2
4 foresta 2342432 casa  Rua arvores 453 5 2
5 jardim  123123  apto 303  Rua flores  304 7 3
6 foresta 2342432 casa  Rua arvores 453 8 3
7 jardim  123123  apto 303  Rua flores  304 10  4
8 foresta 2342432 casa  Rua arvores 453 11  4
9 jardim  123123  apto 303  Rua flores  304 13  5
10  foresta 2342432 casa  Rua arvores 453 14  5
11  jardim  123123  apto 303  Rua flores  304 16  6
12  foresta 2342432 casa  Rua arvores 453 17  6
\.


--
-- TOC entry 2259 (class 0 OID 0)
-- Dependencies: 191
-- Name: endereco_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('endereco_id_seq', 12, true);


--
-- TOC entry 2231 (class 0 OID 18509)
-- Dependencies: 194
-- Data for Name: estado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY estado (id, nome) FROM stdin;
1 Minas Gerais
2 São Paulo
3 Minas Gerais
4 São Paulo
5 Minas Gerais
6 São Paulo
7 Minas Gerais
8 São Paulo
9 Minas Gerais
10  São Paulo
11  Minas Gerais
12  São Paulo
\.


--
-- TOC entry 2260 (class 0 OID 0)
-- Dependencies: 193
-- Name: estado_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('estado_id_seq', 12, true);


--
-- TOC entry 2232 (class 0 OID 18515)
-- Dependencies: 195
-- Data for Name: item_pedido; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY item_pedido (desconto, preco, quantidade, pedido_id, produto_id) FROM stdin;
0 2000  1 1 1
0 80  2 1 3
100 800 1 2 2
0 2000  1 3 4
0 80  2 3 6
100 800 1 4 5
0 2000  1 5 7
0 80  2 5 9
100 800 1 6 8
0 2000  1 7 10
0 80  2 7 12
100 800 1 8 11
0 2000  1 9 13
0 80  2 9 15
100 800 1 10  14
0 2000  1 11  16
0 80  2 11  18
100 800 1 12  17
\.


--
-- TOC entry 2233 (class 0 OID 18520)
-- Dependencies: 196
-- Data for Name: pagamento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY pagamento (pedido_id, estado) FROM stdin;
1 2
2 1
3 2
4 1
5 2
6 1
7 2
8 1
9 2
10  1
11  2
12  1
\.


--
-- TOC entry 2234 (class 0 OID 18525)
-- Dependencies: 197
-- Data for Name: pagamento_com_boleto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY pagamento_com_boleto (data_pagamento, data_vencimento, pedido_id) FROM stdin;
\N  2017-10-20 00:00:00 2
\N  2017-10-20 00:00:00 4
\N  2017-10-20 00:00:00 6
\N  2017-10-20 00:00:00 8
\N  2017-10-20 00:00:00 10
\N  2017-10-20 00:00:00 12
\.


--
-- TOC entry 2235 (class 0 OID 18530)
-- Dependencies: 198
-- Data for Name: pagamento_com_cartao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY pagamento_com_cartao (numero_de_parcelas, pedido_id) FROM stdin;
6 1
6 3
6 5
6 7
6 9
6 11
\.


--
-- TOC entry 2237 (class 0 OID 18537)
-- Dependencies: 200
-- Data for Name: pedido; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY pedido (id, instante, cliente_id, endereco_de_entrega_id) FROM stdin;
1 2017-09-30 22:32:00 1 1
2 2017-09-30 22:32:00 1 2
3 2017-09-30 22:32:00 2 3
4 2017-09-30 22:32:00 2 4
5 2017-09-30 22:32:00 3 5
6 2017-09-30 22:32:00 3 6
7 2017-09-30 22:32:00 4 7
8 2017-09-30 22:32:00 4 8
9 2017-09-30 22:32:00 5 9
10  2017-09-30 22:32:00 5 10
11  2017-09-30 22:32:00 6 11
12  2017-09-30 22:32:00 6 12
\.


--
-- TOC entry 2261 (class 0 OID 0)
-- Dependencies: 199
-- Name: pedido_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pedido_id_seq', 12, true);


--
-- TOC entry 2239 (class 0 OID 18545)
-- Dependencies: 202
-- Data for Name: produto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY produto (id, nome, preco) FROM stdin;
1 Computador  3000
2 Impressora  800
3 Mouse 80
4 Computador  3000
5 Impressora  800
6 Mouse 80
7 Computador  3000
8 Impressora  800
9 Mouse 80
10  Computador  3000
11  Impressora  800
12  Mouse 80
13  Computador  3000
14  Impressora  800
15  Mouse 80
16  Computador  3000
17  Impressora  800
18  Mouse 80
\.


--
-- TOC entry 2240 (class 0 OID 18551)
-- Dependencies: 203
-- Data for Name: produto_categoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY produto_categoria (produto_id, categoria_id) FROM stdin;
1 1
2 1
2 2
3 1
4 7
5 7
5 8
6 7
7 13
8 13
8 14
9 13
10  19
11  19
11  20
12  19
13  25
14  25
14  26
15  25
16  31
17  31
17  32
18  31
\.


--
-- TOC entry 2262 (class 0 OID 0)
-- Dependencies: 201
-- Name: produto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('produto_id_seq', 18, true);


--
-- TOC entry 2241 (class 0 OID 18554)
-- Dependencies: 204
-- Data for Name: telefone; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY telefone (cliente_id, telefones) FROM stdin;
1 31 12435422323
1 31 12312323
2 31 12435422323
2 31 12312323
3 31 12435422323
3 31 12312323
4 31 12435422323
4 31 12312323
5 31 12435422323
5 31 12312323
6 31 12435422323
6 31 12312323
\.


--
-- TOC entry 2071 (class 2606 OID 18476)
-- Name: categoria categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (id);


--
-- TOC entry 2073 (class 2606 OID 18484)
-- Name: cidade cidade_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cidade
    ADD CONSTRAINT cidade_pkey PRIMARY KEY (id);


--
-- TOC entry 2075 (class 2606 OID 18495)
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id);


--
-- TOC entry 2077 (class 2606 OID 18506)
-- Name: endereco endereco_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY endereco
    ADD CONSTRAINT endereco_pkey PRIMARY KEY (id);


--
-- TOC entry 2079 (class 2606 OID 18514)
-- Name: estado estado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY estado
    ADD CONSTRAINT estado_pkey PRIMARY KEY (id);


--
-- TOC entry 2081 (class 2606 OID 18519)
-- Name: item_pedido item_pedido_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY item_pedido
    ADD CONSTRAINT item_pedido_pkey PRIMARY KEY (pedido_id, produto_id);


--
-- TOC entry 2085 (class 2606 OID 18529)
-- Name: pagamento_com_boleto pagamento_com_boleto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pagamento_com_boleto
    ADD CONSTRAINT pagamento_com_boleto_pkey PRIMARY KEY (pedido_id);


--
-- TOC entry 2087 (class 2606 OID 18534)
-- Name: pagamento_com_cartao pagamento_com_cartao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pagamento_com_cartao
    ADD CONSTRAINT pagamento_com_cartao_pkey PRIMARY KEY (pedido_id);


--
-- TOC entry 2083 (class 2606 OID 18524)
-- Name: pagamento pagamento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pagamento
    ADD CONSTRAINT pagamento_pkey PRIMARY KEY (pedido_id);


--
-- TOC entry 2089 (class 2606 OID 18542)
-- Name: pedido pedido_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (id);


--
-- TOC entry 2091 (class 2606 OID 18550)
-- Name: produto produto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produto
    ADD CONSTRAINT produto_pkey PRIMARY KEY (id);


--
-- TOC entry 2103 (class 2606 OID 18612)
-- Name: produto_categoria fk1c0y58d3n6x3m6euv2j3h64vt; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produto_categoria
    ADD CONSTRAINT fk1c0y58d3n6x3m6euv2j3h64vt FOREIGN KEY (produto_id) REFERENCES produto(id);


--
-- TOC entry 2101 (class 2606 OID 18602)
-- Name: pedido fk1fihyy2fnocpuwc74674qmfkv; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pedido
    ADD CONSTRAINT fk1fihyy2fnocpuwc74674qmfkv FOREIGN KEY (endereco_de_entrega_id) REFERENCES endereco(id);


--
-- TOC entry 2100 (class 2606 OID 18597)
-- Name: pedido fk30s8j2ktpay6of18lbyqn3632; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pedido
    ADD CONSTRAINT fk30s8j2ktpay6of18lbyqn3632 FOREIGN KEY (cliente_id) REFERENCES cliente(id);


--
-- TOC entry 2095 (class 2606 OID 18572)
-- Name: item_pedido fk60ym08cfoysa17wrn1swyiuda; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY item_pedido
    ADD CONSTRAINT fk60ym08cfoysa17wrn1swyiuda FOREIGN KEY (pedido_id) REFERENCES pedido(id);


--
-- TOC entry 2104 (class 2606 OID 18617)
-- Name: telefone fk8aafha0njkoyoe3kvrwsy3g8u; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY telefone
    ADD CONSTRAINT fk8aafha0njkoyoe3kvrwsy3g8u FOREIGN KEY (cliente_id) REFERENCES cliente(id);


--
-- TOC entry 2093 (class 2606 OID 18562)
-- Name: endereco fk8b1kcb3wucapb8dejshyn5fsx; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY endereco
    ADD CONSTRAINT fk8b1kcb3wucapb8dejshyn5fsx FOREIGN KEY (cidade_id) REFERENCES cidade(id);


--
-- TOC entry 2094 (class 2606 OID 18567)
-- Name: endereco fk8s7ivtl4foyhrfam9xqom73n9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY endereco
    ADD CONSTRAINT fk8s7ivtl4foyhrfam9xqom73n9 FOREIGN KEY (cliente_id) REFERENCES cliente(id);


--
-- TOC entry 2098 (class 2606 OID 18587)
-- Name: pagamento_com_boleto fkcr74vrxf8nfph0knq2bho8doo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pagamento_com_boleto
    ADD CONSTRAINT fkcr74vrxf8nfph0knq2bho8doo FOREIGN KEY (pedido_id) REFERENCES pagamento(pedido_id);


--
-- TOC entry 2092 (class 2606 OID 18557)
-- Name: cidade fkkworrwk40xj58kevvh3evi500; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cidade
    ADD CONSTRAINT fkkworrwk40xj58kevvh3evi500 FOREIGN KEY (estado_id) REFERENCES estado(id);


--
-- TOC entry 2102 (class 2606 OID 18607)
-- Name: produto_categoria fkq3g33tp7xk2juh53fbw6y4y57; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produto_categoria
    ADD CONSTRAINT fkq3g33tp7xk2juh53fbw6y4y57 FOREIGN KEY (categoria_id) REFERENCES categoria(id);


--
-- TOC entry 2099 (class 2606 OID 18592)
-- Name: pagamento_com_cartao fkta3cdnuuxclwfh52t4qi432ow; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pagamento_com_cartao
    ADD CONSTRAINT fkta3cdnuuxclwfh52t4qi432ow FOREIGN KEY (pedido_id) REFERENCES pagamento(pedido_id);


--
-- TOC entry 2097 (class 2606 OID 18582)
-- Name: pagamento fkthad9tkw4188hb3qo1lm5ueb0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pagamento
    ADD CONSTRAINT fkthad9tkw4188hb3qo1lm5ueb0 FOREIGN KEY (pedido_id) REFERENCES pedido(id);


--
-- TOC entry 2096 (class 2606 OID 18577)
-- Name: item_pedido fktk55mn6d6bvl5h0no5uagi3sf; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY item_pedido
    ADD CONSTRAINT fktk55mn6d6bvl5h0no5uagi3sf FOREIGN KEY (produto_id) REFERENCES produto(id);


-- Completed on 2018-01-10 15:56:32

--
-- PostgreSQL database dump complete
--

