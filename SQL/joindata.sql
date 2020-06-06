create view US_Data as 

With spy as
	(select date as spy_date, open as spy_open, high as spy_high, low as spy_low, close as spy_close
	from public.historical_price_by_day where ticker='SPY' )
	
	, spx as
	(select date as spx_date, open as spx_open, high as spx_high, low as spx_low, close as spx_close
	from public.historical_price_by_day where ticker='SPX' )
	
	, dji as
	(select date as dji_date, open as dji_open, high as dji_high, low as dji_low, close as dji_close
	from public.historical_price_by_day where ticker='DJI' )
	
	
	select dt.datefield, ri.*, spy.*, spx.*, dji.*, fact_cpi.cpi, fact_gdp.gdp, fact_inflation.inflation , fact_unemployment.unemployment
	
	from public.recession_indicator_by_day ri
	inner join dim_time dt
	on ri.date = dt.txtdate
	left outer join spy
	on ri.date = spy.spy_date
	left outer join spx
	on ri.date = spx.spx_date
	left outer join dji
	on ri.date = dji.dji_date
	left outer join fact_cpi
	on ri.date = fact_cpi.txtdate
	left outer join fact_gdp
	on ri.date = fact_gdp.txtdate
	left outer join fact_inflation
	on ri.date = fact_inflation.txtdate
	left outer join fact_unemployment
	on ri.date = fact_unemployment.txtdate
	
	where ri.country = 'us'
	
	
--	select count(*) from public.fact_cpi
-- select count(*) from public.fact_gdp
-- select count(*) from public.fact_inflation
-- select count(*) from public.fact_unemployment
