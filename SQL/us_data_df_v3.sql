https://colab.research.google.com/drive/17TQSFD7TdxdAZ_IFCAchNjh0VRYl8WZm-- Table: public.us_data_df_v3

-- DROP TABLE public.us_data_df_v3;

CREATE TABLE public.us_data_df_v3
(
    intdate integer NOT NULL,
    ri boolean,
    cpi double precision,
    gdp double precision,
    inf double precision,
    unp double precision,
    dji_open numeric(20,8),
    dji_open_lag30 numeric(20,8),
    dji_open_lag90 numeric(20,8),
    dji_open_lag365 numeric(20,8),
    dji_close numeric(20,8),
    dji_close_lag30 numeric(20,8),
    dji_close_lag90 numeric(20,8),
    dji_close_lag365 numeric(20,8),
    dji_high numeric(20,8),
    dji_high_lag30 numeric(20,8),
    dji_high_lag90 numeric(20,8),
    dji_high_lag365 numeric(20,8),
    dji_low numeric(20,8),
    dji_low_lag30 numeric(20,8),
    dji_low_lag90 numeric(20,8),
    dji_low_lag365 numeric(20,8),
    CONSTRAINT us_data_df_v3_pkey PRIMARY KEY (intdate)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.us_data_df_v3
    OWNER to caladmin;