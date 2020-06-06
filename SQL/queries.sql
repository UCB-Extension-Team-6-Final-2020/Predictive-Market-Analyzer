--select * from US_Data ORDER BY txtdate ASC

--select * from dim_time

--select * from public.fact_recession_indicator_by_day where country = 'US'

select * from public.fact_ticker_price_by_day

where ticker in ('SPY', 'SPX', 'DJI')

group by ticker

select count(*), min(intdate), max(intdate) from us_data_df

describe table us_data_df;
