-- Table: public.recession_indicator_by_day

-- DROP TABLE public.recession_indicator_by_day;

CREATE TABLE public.recession_indicator_by_day
(
    date integer NOT NULL,
    recession_indicator boolean NOT NULL,
    country character varying(10) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT recession_indicator_by_day_pkey PRIMARY KEY (date, country)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.recession_indicator_by_day
    OWNER to caladmin;