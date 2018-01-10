--
-- PostgreSQL database dump
CREATE TABLE categoria (
    id integer NOT NULL,
    nome character varying(255)
);

CREATE TABLE cidade (
    id integer NOT NULL,
    nome character varying(255),
    estado_id integer
);

CREATE SEQUENCE cidade_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


CREATE TABLE cliente (
    id integer NOT NULL,
    cpf character varying(255),
    email character varying(255),
    nome character varying(255),
    tipo integer
);


CREATE SEQUENCE cliente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


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


CREATE TABLE estado (
    id integer NOT NULL,
    nome character varying(255)
);

CREATE TABLE item_pedido (
    desconto double precision NOT NULL,
    preco double precision NOT NULL,
    quantidade integer,
    pedido_id integer NOT NULL,
    produto_id integer NOT NULL
);

CREATE TABLE pagamento (
    pedido_id integer NOT NULL,
    estado integer
);

CREATE TABLE pagamento_com_boleto (
    data_pagamento timestamp without time zone,
    data_vencimento timestamp without time zone,
    pedido_id integer NOT NULL
);
--
CREATE TABLE pagamento_com_cartao (
    numero_de_parcelas integer,
    pedido_id integer NOT NULL
);

CREATE TABLE pedido (
    id integer NOT NULL,
    instante timestamp without time zone,
    cliente_id integer,
    endereco_de_entrega_id integer
);

CREATE TABLE produto (
    id integer NOT NULL,
    nome character varying(255),
    preco double precision NOT NULL
);

CREATE TABLE produto_categoria (
    produto_id integer NOT NULL,
    categoria_id integer NOT NULL
);
--
CREATE TABLE telefone (
    cliente_id integer NOT NULL,
    telefones character varying(255)
);

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

