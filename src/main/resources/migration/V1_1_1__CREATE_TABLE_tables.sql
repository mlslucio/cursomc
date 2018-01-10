CREATE TABLE public.categoria
(
    id integer NOT NULL DEFAULT nextval('categoria_id_seq'::regclass),
    nome character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT categoria_pkey PRIMARY KEY (id)
)