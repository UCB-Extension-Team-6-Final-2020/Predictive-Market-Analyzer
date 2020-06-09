dim_time
-
datefield date
txtdate integer
intdate integer PK
monthdt integer
quarterdt integer
yeardt integer

fact_cpi
-
 txtdate integer
intdate integer PK 
cpi double
country varchar(10) PK

fact_gdp
-
 txtdate integer
intdate integer PK 
gdp double
country varchar(10) PK

fact_inflation
-
txtdate integer
intdate integer PK 
inflation double
country varchar(10) PK

fact_unemployment
-
txtdate integer
intdate integer PK 
unemployment double
country varchar(10) PK

fact_ticker_price_by_day
-
txtdate integer
intdate integer PK
open numeric(20,8)
high numeric(20,8)
low numeric(20,8)
close numeric(20,8)
ticker 0varying(10) PK

fact_recession_indicator_by_day
-
txtdate integer 
intdate integer PK
recession_indicator boolean 
country varying(10) PK






