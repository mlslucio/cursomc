--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.6
-- Dumped by pg_dump version 9.6.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: categoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE categoria (
    id integer NOT NULL,
    nome character varying(255)
);


ALTER TABLE categoria OWNER TO postgres;

--
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
-- Name: categoria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE categoria_id_seq OWNED BY categoria.id;


--
-- Name: cidade; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cidade (
    id integer NOT NULL,
    nome character varying(255),
    estado_id integer
);


ALTER TABLE cidade OWNER TO postgres;

--
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
-- Name: cidade_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cidade_id_seq OWNED BY cidade.id;


--
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
-- Name: cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cliente_id_seq OWNED BY cliente.id;


--
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
-- Name: endereco_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE endereco_id_seq OWNED BY endereco.id;


--
-- Name: estado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE estado (
    id integer NOT NULL,
    nome character varying(255)
);


ALTER TABLE estado OWNER TO postgres;

--
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
-- Name: estado_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE estado_id_seq OWNED BY estado.id;


--
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
-- Name: pagamento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE pagamento (
    pedido_id integer NOT NULL,
    estado integer
);


ALTER TABLE pagamento OWNER TO postgres;

--
-- Name: pagamento_com_boleto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE pagamento_com_boleto (
    data_pagamento timestamp without time zone,
    data_vencimento timestamp without time zone,
    pedido_id integer NOT NULL
);


ALTER TABLE pagamento_com_boleto OWNER TO postgres;

--
-- Name: pagamento_com_cartao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE pagamento_com_cartao (
    numero_de_parcelas integer,
    pedido_id integer NOT NULL
);


ALTER TABLE pagamento_com_cartao OWNER TO postgres;

--
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
-- Name: pedido_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pedido_id_seq OWNED BY pedido.id;


--
-- Name: produto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE produto (
    id integer NOT NULL,
    nome character varying(255),
    preco double precision NOT NULL
);


ALTER TABLE produto OWNER TO postgres;

--
-- Name: produto_categoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE produto_categoria (
    produto_id integer NOT NULL,
    categoria_id integer NOT NULL
);


ALTER TABLE produto_categoria OWNER TO postgres;

--
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
-- Name: produto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE produto_id_seq OWNED BY produto.id;


--
-- Name: telefone; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE telefone (
    cliente_id integer NOT NULL,
    telefones character varying(255)
);


ALTER TABLE telefone OWNER TO postgres;

--
-- Name: categoria id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categoria ALTER COLUMN id SET DEFAULT nextval('categoria_id_seq'::regclass);


--
-- Name: cidade id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cidade ALTER COLUMN id SET DEFAULT nextval('cidade_id_seq'::regclass);


--
-- Name: cliente id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cliente ALTER COLUMN id SET DEFAULT nextval('cliente_id_seq'::regclass);


--
-- Name: endereco id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY endereco ALTER COLUMN id SET DEFAULT nextval('endereco_id_seq'::regclass);


--
-- Name: estado id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY estado ALTER COLUMN id SET DEFAULT nextval('estado_id_seq'::regclass);


--
-- Name: pedido id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pedido ALTER COLUMN id SET DEFAULT nextval('pedido_id_seq'::regclass);


--
-- Name: produto id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produto ALTER COLUMN id SET DEFAULT nextval('produto_id_seq'::regclass);


--
-- Name: categoria categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (id);


--
-- Name: cidade cidade_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cidade
    ADD CONSTRAINT cidade_pkey PRIMARY KEY (id);


--
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id);


--
-- Name: endereco endereco_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY endereco
    ADD CONSTRAINT endereco_pkey PRIMARY KEY (id);


--
-- Name: estado estado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY estado
    ADD CONSTRAINT estado_pkey PRIMARY KEY (id);


--
-- Name: item_pedido item_pedido_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY item_pedido
    ADD CONSTRAINT item_pedido_pkey PRIMARY KEY (pedido_id, produto_id);


--
-- Name: pagamento_com_boleto pagamento_com_boleto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pagamento_com_boleto
    ADD CONSTRAINT pagamento_com_boleto_pkey PRIMARY KEY (pedido_id);


--
-- Name: pagamento_com_cartao pagamento_com_cartao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pagamento_com_cartao
    ADD CONSTRAINT pagamento_com_cartao_pkey PRIMARY KEY (pedido_id);


--
-- Name: pagamento pagamento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pagamento
    ADD CONSTRAINT pagamento_pkey PRIMARY KEY (pedido_id);


--
-- Name: pedido pedido_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (id);


--
-- Name: produto produto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produto
    ADD CONSTRAINT produto_pkey PRIMARY KEY (id);


--
-- Name: produto_categoria fk1c0y58d3n6x3m6euv2j3h64vt; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produto_categoria
    ADD CONSTRAINT fk1c0y58d3n6x3m6euv2j3h64vt FOREIGN KEY (produto_id) REFERENCES produto(id);


--
-- Name: pedido fk1fihyy2fnocpuwc74674qmfkv; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pedido
    ADD CONSTRAINT fk1fihyy2fnocpuwc74674qmfkv FOREIGN KEY (endereco_de_entrega_id) REFERENCES endereco(id);


--
-- Name: pedido fk30s8j2ktpay6of18lbyqn3632; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pedido
    ADD CONSTRAINT fk30s8j2ktpay6of18lbyqn3632 FOREIGN KEY (cliente_id) REFERENCES cliente(id);


--
-- Name: item_pedido fk60ym08cfoysa17wrn1swyiuda; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY item_pedido
    ADD CONSTRAINT fk60ym08cfoysa17wrn1swyiuda FOREIGN KEY (pedido_id) REFERENCES pedido(id);


--
-- Name: telefone fk8aafha0njkoyoe3kvrwsy3g8u; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY telefone
    ADD CONSTRAINT fk8aafha0njkoyoe3kvrwsy3g8u FOREIGN KEY (cliente_id) REFERENCES cliente(id);


--
-- Name: endereco fk8b1kcb3wucapb8dejshyn5fsx; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY endereco
    ADD CONSTRAINT fk8b1kcb3wucapb8dejshyn5fsx FOREIGN KEY (cidade_id) REFERENCES cidade(id);


--
-- Name: endereco fk8s7ivtl4foyhrfam9xqom73n9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY endereco
    ADD CONSTRAINT fk8s7ivtl4foyhrfam9xqom73n9 FOREIGN KEY (cliente_id) REFERENCES cliente(id);


--
-- Name: pagamento_com_boleto fkcr74vrxf8nfph0knq2bho8doo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pagamento_com_boleto
    ADD CONSTRAINT fkcr74vrxf8nfph0knq2bho8doo FOREIGN KEY (pedido_id) REFERENCES pagamento(pedido_id);


--
-- Name: cidade fkkworrwk40xj58kevvh3evi500; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cidade
    ADD CONSTRAINT fkkworrwk40xj58kevvh3evi500 FOREIGN KEY (estado_id) REFERENCES estado(id);


--
-- Name: produto_categoria fkq3g33tp7xk2juh53fbw6y4y57; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produto_categoria
    ADD CONSTRAINT fkq3g33tp7xk2juh53fbw6y4y57 FOREIGN KEY (categoria_id) REFERENCES categoria(id);


--
-- Name: pagamento_com_cartao fkta3cdnuuxclwfh52t4qi432ow; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pagamento_com_cartao
    ADD CONSTRAINT fkta3cdnuuxclwfh52t4qi432ow FOREIGN KEY (pedido_id) REFERENCES pagamento(pedido_id);


--
-- Name: pagamento fkthad9tkw4188hb3qo1lm5ueb0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pagamento
    ADD CONSTRAINT fkthad9tkw4188hb3qo1lm5ueb0 FOREIGN KEY (pedido_id) REFERENCES pedido(id);


--
-- Name: item_pedido fktk55mn6d6bvl5h0no5uagi3sf; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY item_pedido
    ADD CONSTRAINT fktk55mn6d6bvl5h0no5uagi3sf FOREIGN KEY (produto_id) REFERENCES produto(id);


--
-- PostgreSQL database dump complete
--

