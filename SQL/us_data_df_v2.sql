with fed as (
	Select
		intdate,
		recession_indicator ri,
		cpi,
		gdp,
		inflation as inf,
		unemployment as unp
	from us_data_df 
	
	where 
		cpi is not null or
		gdp is not null or
		inflation is not null or
		unemployment is not null
	
	order by intdate asc
) -- end fed
, dji as (
	Select 
		intdate,
		dji_open,
		dji_close,
		dji_close - dji_open as dji_opcl_diff,
		dji_high, 
		dji_low, 
		dji_high - dji_low as dji_hilo_diff
	from us_data_df 
	Where 
		dji_open is not null or
		dji_high is not null or
		dji_low is not null or
		dji_close is not null 
	
	order by intdate asc
)

-- insert into us_data_df_v2

Select
	fed.intdate,
	fed.ri,
	fed.cpi,
	lag(fed.cpi,1) over (order by fed.intdate) as cpi_lag,
	fed.gdp,
	lag(fed.gdp,1) over (order by fed.intdate) as gdp_lag,
	fed.inf,
	lag(fed.inf,1) over (order by fed.intdate) as inf_lag,
	fed.unp,
	lag(fed.unp, 1)  over (order by fed.intdate) as unp_lag,
	dji.dji_open,
	lag(dji.dji_open, 1) over (order by fed.intdate) as dji_open_lag,
	dji.dji_close,
	lag(dji.dji_close, 1) over (order by fed.intdate) as dji_close_lag,
	dji.dji_opcl_diff,
	lag(dji.dji_opcl_diff, 1) over (order by fed.intdate) as dji_diff_lag,
	dji.dji_high, 
	lag(dji.dji_high,  1) over (order by fed.intdate) as dji_high_lag,
	dji.dji_low, 
	lag(dji.dji_low,  1) over (order by fed.intdate) as dji_lo_lag,
	dji.dji_hilo_diff,
	lag(dji.dji_hilo_diff, 1) over (order by fed.intdate) as dji_hilo_lag

from 
	fed 
	inner join dji on 
	fed.intdate = dji.intdate





