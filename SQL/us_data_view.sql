-- select * from us_data order by intdate desc limit 100
-- select min(intdate), max(intdate) from US_Data
create or replace view US_Data as 

With spy as
		(select intdate, open as spy_open, high as spy_high, low as spy_low, close as spy_close
		from public.fact_ticker_price_by_day where ticker='SPY' )

	, spx as
		(select intdate, open as spx_open, high as spx_high, low as spx_low, close as spx_close
		from public.fact_ticker_price_by_day where ticker='SPX' )

	, dji as
		(select intdate, open as dji_open, high as dji_high, low as dji_low, close as dji_close
		from public.fact_ticker_price_by_day where ticker='DJI' )

	, cpi as
		(with minmax as (	
			select max(intdate) as maxd, min(intdate) as mind from fact_cpi cpi
			)
			select dt.intdate, cpi.cpi from dim_time dt
				inner join fact_cpi cpi
				on dt.monthdt = cpi.intdate,
				minmax
			where 
				dt.intdate between minmax.mind and minmax.maxd)
	, gdp as
		(with minmax as (	
			select max(intdate) as maxd, min(intdate) as mind from fact_gdp gdp
			)
			select dt.intdate, gdp.gdp from dim_time dt
				inner join fact_gdp gdp
				on dt.monthdt = gdp.intdate,
				minmax
			where 
				dt.intdate between minmax.mind and minmax.maxd)
				
	, inf as
		(with minmax as (	
			select max(intdate) as maxd, min(intdate) as mind from fact_inflation inf
			)
			select dt.intdate, inf.inflation from dim_time dt
				inner join fact_inflation inf
				on dt.yeardt = inf.intdate,
				minmax
			where 
				dt.intdate between minmax.mind and minmax.maxd)
	
	select dt.txtdate, dt.intdate, ri.recession_indicator, ri.country,
			spy.spy_open, spy.spy_high, spy.spy_low, spy.spy_close,
			spx.spx_open, spx.spx_high, spx.spx_low, spx.spx_close,
			dji.dji_open, dji.dji_high, dji.dji_low, dji.dji_close,
 			cpi.cpi, gdp.gdp, inf.inflation , unp.unemployment
	
	from dim_time dt
	left outer join public.fact_recession_indicator_by_day ri
	on dt.intdate = ri.intdate
	and ri.country = 'US'
	left outer join spy
	on dt.intdate = spy.intdate
	left outer join spx
	on dt.intdate = spx.intdate
	left outer join dji
	on dt.intdate = dji.intdate
	left outer join cpi
	on dt.intdate = cpi.intdate
	left outer join gdp
	on dt.intdate = gdp.intdate
	left outer join inf 
	on dt.intdate = inf.intdate
	left outer join fact_unemployment unp
	on dt.intdate = unp.intdate
	
	where  
	dt.intdate >= 19700101


			
order by dt.intdate asc	
