select 
stt.*,
stb.book_date,
stb.total_amount,
stt.contact_data ->> 'phone' as passenger_phone,
stt.contact_data ->> 'email' as passenger_email,
'{{ run_started_at.strftime ("%Y-%m-%d %H:%M:%S")}}'::timestamp as dbt_time
from stg.tickets stt
left join stg.bookings stb 
on stt.book_ref = stb.book_ref