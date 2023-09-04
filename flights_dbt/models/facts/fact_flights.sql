select *,
age(scheduled_arrival,scheduled_departure) as flight_duration_expected,
age(actual_arrival,actual_departure) as flight_duration,
case 
	when (age(actual_arrival,actual_departure)) > (age(scheduled_arrival,scheduled_departure)) then 'longer'
	when (age(actual_arrival,actual_departure)) < (age(scheduled_arrival,scheduled_departure)) then 'shorter'
	when (age(actual_arrival,actual_departure)) = (age(scheduled_arrival,scheduled_departure)) then 'as expected'
	else null
end flight_duration_indicator,
'{{ run_started_at.strftime ("%Y-%m-%d %H:%M:%S")}}'::timestamp as dbt_time
from stg.flights