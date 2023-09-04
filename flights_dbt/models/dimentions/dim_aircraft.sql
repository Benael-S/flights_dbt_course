select 
afd.aircraft_code,
afd.model,
afd.range,
st.seat_no,
st.fare_conditions,
st.last_update,
case 
	when range > 5600 then 'high'
	else 'low'
end as range_indicator,
concat('aircrat model: ',model ->> 'en') as english_model,
concat('модель самолета: ',model ->> 'ru') as russian_model,
'{{ run_started_at.strftime ("%Y-%m-%d %H:%M:%S")}}'::timestamp as dbt_time
from stg.aircrafts_data afd
full join stg.seats st 
on afd.aircraft_code = st.aircraft_code