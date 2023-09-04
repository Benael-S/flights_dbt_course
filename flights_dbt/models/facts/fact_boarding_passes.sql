{{ config(materialized='table') }}

select 
tf.ticket_no,
tf.flight_id,
tf.fare_conditions,
tf.amount,
sbs.boarding_no,
sbs.seat_no,
sbs.last_update,
'{{ run_started_at.strftime ("%Y-%m-%d %H:%M:%S")}}'::timestamp as dbt_time
from stg.ticket_flights tf
join stg.boarding_passes sbs
 on tf.ticket_no = sbs.ticket_no 