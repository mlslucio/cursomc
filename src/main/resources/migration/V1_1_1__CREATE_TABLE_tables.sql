CREATE TABLE categoria
(
    id integer NOT NULL,
    nome character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT categoria_pkey PRIMARY KEY (id)
);
CREATE TABLE cliente
(
    id integer NOT NULL,
    cpf character varying(255) COLLATE pg_catalog."default",
    email character varying(255) COLLATE pg_catalog."default",
    nome character varying(255) COLLATE pg_catalog."default",
    tipo integer,
    CONSTRAINT cliente_pkey PRIMARY KEY (id)
);
CREATE TABLE endereco
(
    id integer NOT NULL,
    bairro character varying(255) COLLATE pg_catalog."default",
    cep character varying(255) COLLATE pg_catalog."default",
    complemento character varying(255) COLLATE pg_catalog."default",
    lorgadoura character varying(255) COLLATE pg_catalog."default",
    numero character varying(255) COLLATE pg_catalog."default",
    cidade_id integer,
    cliente_id integer,
    CONSTRAINT endereco_pkey PRIMARY KEY (id),
    CONSTRAINT fk8b1kcb3wucapb8dejshyn5fsx FOREIGN KEY (cidade_id)
        REFERENCES public.cidade (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk8s7ivtl4foyhrfam9xqom73n9 FOREIGN KEY (cliente_id)
        REFERENCES public.cliente (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);
CREATE TABLE estado
(
    id integer NOT NULL,
    nome character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT estado_pkey PRIMARY KEY (id)
);
CREATE TABLE cidade
(
    id integer NOT NULL,
    nome character varying(255) COLLATE pg_catalog."default",
    estado_id integer,
    CONSTRAINT cidade_pkey PRIMARY KEY (id),
    CONSTRAINT fkkworrwk40xj58kevvh3evi500 FOREIGN KEY (estado_id)
        REFERENCES public.estado (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);
CREATE TABLE pedido
(
    id integer NOT NULL,
    instante timestamp without time zone,
    cliente_id integer,
    endereco_de_entrega_id integer,
    CONSTRAINT pedido_pkey PRIMARY KEY (id),
    CONSTRAINT fk1fihyy2fnocpuwc74674qmfkv FOREIGN KEY (endereco_de_entrega_id)
        REFERENCES public.endereco (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk30s8j2ktpay6of18lbyqn3632 FOREIGN KEY (cliente_id)
        REFERENCES public.cliente (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);
CREATE TABLE item_pedido
(
    desconto double precision NOT NULL,
    preco double precision NOT NULL,
    quantidade integer,
    pedido_id integer NOT NULL,
    produto_id integer NOT NULL,
    CONSTRAINT item_pedido_pkey PRIMARY KEY (pedido_id, produto_id),
    CONSTRAINT fk60ym08cfoysa17wrn1swyiuda FOREIGN KEY (pedido_id)
        REFERENCES public.pedido (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fktk55mn6d6bvl5h0no5uagi3sf FOREIGN KEY (produto_id)
        REFERENCES public.produto (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);
CREATE TABLE pagamento
(
    pedido_id integer NOT NULL,
    estado integer,
    CONSTRAINT pagamento_pkey PRIMARY KEY (pedido_id),
    CONSTRAINT fkthad9tkw4188hb3qo1lm5ueb0 FOREIGN KEY (pedido_id)
        REFERENCES public.pedido (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);
CREATE TABLE pagamento_com_boleto
(
    data_pagamento timestamp without time zone,
    data_vencimento timestamp without time zone,
    pedido_id integer NOT NULL,
    CONSTRAINT pagamento_com_boleto_pkey PRIMARY KEY (pedido_id),
    CONSTRAINT fkcr74vrxf8nfph0knq2bho8doo FOREIGN KEY (pedido_id)
        REFERENCES public.pagamento (pedido_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);
CREATE TABLE pagamento_com_cartao
(
    numero_de_parcelas integer,
    pedido_id integer NOT NULL,
    CONSTRAINT pagamento_com_cartao_pkey PRIMARY KEY (pedido_id),
    CONSTRAINT fkta3cdnuuxclwfh52t4qi432ow FOREIGN KEY (pedido_id)
        REFERENCES public.pagamento (pedido_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);
CREATE TABLE produto
(
    id integer NOT NULL,
    nome character varying(255) COLLATE pg_catalog."default",
    preco double precision NOT NULL,
    CONSTRAINT produto_pkey PRIMARY KEY (id)
);
CREATE TABLE produto_categoria
(
    produto_id integer NOT NULL,
    categoria_id integer NOT NULL,
    CONSTRAINT fk1c0y58d3n6x3m6euv2j3h64vt FOREIGN KEY (produto_id)
        REFERENCES public.produto (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fkq3g33tp7xk2juh53fbw6y4y57 FOREIGN KEY (categoria_id)
        REFERENCES public.categoria (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);
CREATE TABLE telefone
(
    cliente_id integer NOT NULL,
    telefones character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT fk8aafha0njkoyoe3kvrwsy3g8u FOREIGN KEY (cliente_id)
        REFERENCES public.cliente (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);
