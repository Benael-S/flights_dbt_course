select *,
concat('airpot name: ',airport_name ->> 'en','. city: ',city ->> 'en','.') as english_name,
concat('название аэропорта: ',airport_name ->> 'ru','. город: ',city ->> 'ru','.') as russian_name,
'{{ run_started_at.strftime ("%Y-%m-%d %H:%M:%S")}}'::timestamp as dbt_time
from stg.airports_data