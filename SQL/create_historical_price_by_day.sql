-- Table: public.historical_price_by_day

-- DROP TABLE public.historical_price_by_day;

CREATE TABLE public.historical_price_by_day
(
    date integer NOT NULL,
    open money,
    high money,
    low money,
    close money,
    ticker character varying(10) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT historical_price_by_day_pkey PRIMARY KEY (date, ticker)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.historical_price_by_day
    OWNER to caladmin;