CREATE TABLE categoria
(
    id integer NOT NULL DEFAULT,
    nome character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT categoria_pkey PRIMARY KEY (id)
)