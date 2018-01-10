CREATE TABLE plano
(
    id uuid NOT NULL,
    ativo boolean NOT NULL,
    descricao character varying(255) COLLATE pg_catalog."default",
    duracao_dias integer,
    removido boolean NOT NULL,
    titulo character varying(255) COLLATE pg_catalog."default",
    valor double precision NOT NULL,
    CONSTRAINT plano_pkey PRIMARY KEY (id)
)