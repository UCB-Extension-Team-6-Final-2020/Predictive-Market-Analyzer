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

-- delete from us_data_df_v2

 insert into us_data_df_v2_lag365

Select
	fed.intdate,
	fed.ri,
	fed.cpi,
	fed.gdp,
	fed.inf,
	fed.unp,
	dji.dji_open,
	lag(dji.dji_open,1) over (order by fed.intdate) - dji.dji_open as dji_open_lag1,
	lag(dji.dji_open,7) over (order by fed.intdate) - dji.dji_open as dji_open_lag7,
	lag(dji.dji_open,14) over (order by fed.intdate) - dji.dji_open as dji_open_lag14,
	lag(dji.dji_open,30) over (order by fed.intdate) - dji.dji_open as dji_open_lag30,
	lag(dji.dji_open,90) over (order by fed.intdate) - dji.dji_open as dji_open_lag90,
	lag(dji.dji_open,365) over (order by fed.intdate) - dji.dji_open as dji_open_lag365,
	dji.dji_close,
	lag(dji.dji_close,1) over (order by fed.intdate) - dji.dji_close as dji_close_lag1,
	lag(dji.dji_close,7) over (order by fed.intdate) - dji.dji_close as dji_close_lag7,
	lag(dji.dji_close,14) over (order by fed.intdate) - dji.dji_close as dji_close_lag14,
	lag(dji.dji_close,30) over (order by fed.intdate) - dji.dji_close as dji_close_lag30,
	lag(dji.dji_close,90) over (order by fed.intdate) - dji.dji_close as dji_close_lag90,
	lag(dji.dji_close,365) over (order by fed.intdate) - dji.dji_close as dji_close_lag365,
	dji.dji_opcl_diff,
	lag(dji.dji_opcl_diff,1) over (order by fed.intdate) - dji.dji_opcl_diff as dji_opcl_diff_lag1,
	lag(dji.dji_opcl_diff,7) over (order by fed.intdate) - dji.dji_opcl_diff as dji_opcl_diff_lag7,
	lag(dji.dji_opcl_diff,14) over (order by fed.intdate) - dji.dji_opcl_diff as dji_opcl_diff_lag14,
	lag(dji.dji_opcl_diff,30) over (order by fed.intdate) - dji.dji_opcl_diff as dji_opcl_diff_lag30,
	lag(dji.dji_opcl_diff,90) over (order by fed.intdate) - dji.dji_opcl_diff as dji_opcl_diff_lag90,
	lag(dji.dji_opcl_diff,365) over (order by fed.intdate) - dji.dji_opcl_diff as dji_opcl_diff_lag365,
	dji.dji_high,
	lag(dji.dji_high,1) over (order by fed.intdate) - dji.dji_high as dji_high_lag1,
	lag(dji.dji_high,7) over (order by fed.intdate) - dji.dji_high as dji_high_lag7,
	lag(dji.dji_high,14) over (order by fed.intdate) - dji.dji_high as dji_high_lag14,
	lag(dji.dji_high,30) over (order by fed.intdate) - dji.dji_high as dji_high_lag30,
	lag(dji.dji_high,90) over (order by fed.intdate) - dji.dji_high as dji_high_lag90,
	lag(dji.dji_high,365) over (order by fed.intdate) - dji.dji_high as dji_high_lag365,
	dji.dji_low,
	lag(dji.dji_low,1) over (order by fed.intdate) - dji.dji_low as dji_low_lag1,
	lag(dji.dji_low,7) over (order by fed.intdate) - dji.dji_low as dji_low_lag7,
	lag(dji.dji_low,14) over (order by fed.intdate) - dji.dji_low as dji_low_lag14,
	lag(dji.dji_low,30) over (order by fed.intdate) - dji.dji_low as dji_low_lag30,
	lag(dji.dji_low,90) over (order by fed.intdate) - dji.dji_low as dji_low_lag90,
	lag(dji.dji_low,365) over (order by fed.intdate) - dji.dji_low as dji_low_lag365,
	dji.dji_hilo_diff,
	lag(dji.dji_hilo_diff,1) over (order by fed.intdate) - dji.dji_hilo_diff as dji_hilo_diff_lag1,
	lag(dji.dji_hilo_diff,7) over (order by fed.intdate) - dji.dji_hilo_diff as dji_hilo_diff_lag7,
	lag(dji.dji_hilo_diff,14) over (order by fed.intdate) - dji.dji_hilo_diff as dji_hilo_diff_lag14,
	lag(dji.dji_hilo_diff,30) over (order by fed.intdate) - dji.dji_hilo_diff as dji_hilo_diff_lag30,
	lag(dji.dji_hilo_diff,90) over (order by fed.intdate) - dji.dji_hilo_diff as dji_hilo_diff_lag90,
	lag(dji.dji_hilo_diff,365) over (order by fed.intdate) - dji.dji_hilo_diff as dji_hilo_diff_lag365,

from 
	fed 
	inner join dji on 
	fed.intdate = dji.intdate







