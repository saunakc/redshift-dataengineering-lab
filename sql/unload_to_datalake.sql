SET query_group TO 'ingest';

UNLOAD(
'select case when vendorid = 1 then ''Creative Mobile Technologies, LLC'' else ''VeriFone Inc.'' end as vendor
, date_part(hr, lpep_pickup_datetime)::int hour_pickup
, date_part(hr, lpep_dropoff_datetime)::int hour_dropoff
, trunc(lpep_pickup_datetime) pickup_date
, trunc(lpep_dropoff_datetime) dropoff_date
, case when RateCodeID = 1 then ''Standard rate''
       when RateCodeID = 2 then ''JFK''
       when RateCodeID = 3 then ''Newark''
       when RateCodeID = 4 then ''Nassau or Westchester''
       when RateCodeID = 5 then ''Negotiated fare'' 
       else ''Group ride''  end RateCode
, case when Payment_type = 1 then ''Credit car''
       when Payment_type = 2 then ''Cash''
       when Payment_type = 3 then ''No charge''
       when Payment_type = 4 then ''Dispute''
       when Payment_type = 5 then ''Unknown'' 
       else ''Voided trip''  end Paymenttype
, case when Trip_type = 1 then ''Street-hail''
       else ''Dispatch'' end Trip_type
, pulocationid
, dolocationid
, Passenger_count
, Trip_distance
, Total_amount
, Tip_amount
, Fare_amount
, tolls_amount
, total_amount
from taxischema.nyc_greentaxi
ORDER BY pickup_date'
) 
to '{0}'
IAM_ROLE '{1}'
parquet
PARTITION BY (pickup_date)
ALLOWOVERWRITE
;
