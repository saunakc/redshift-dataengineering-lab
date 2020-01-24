SET query_group TO 'ingest';

CREATE SCHEMA taxischema;

CREATE EXTERNAL SCHEMA spectrum_schema FROM DATA CATALOG database 'default' region '{0}'  iam_role '{1}';

CREATE TABLE taxischema.nyc_greentaxi(
  vendorid varchar(10), 
  lpep_pickup_datetime timestamp, 
  lpep_dropoff_datetime timestamp, 
  store_and_fwd_flag char(1), 
  ratecodeid int, 
  pulocationid int, 
  dolocationid int, 
  passenger_count int, 
  trip_distance decimal(8,2), 
  fare_amount decimal(8,2), 
  extra decimal(8,2), 
  mta_tax decimal(8,2), 
  tip_amount decimal(8,2), 
  tolls_amount decimal(8,2), 
  ehail_fee varchar(100), 
  improvement_surcharge decimal(8,2), 
  total_amount decimal(8,2), 
  payment_type varchar(10), 
  trip_type varchar(10), 
  congestion_surcharge decimal(8,2))
;
