with table1 as

(select from_id as person1, to_id as person2,duration as duri_sum 

from Calls 

where from_id < to_id

 

union all 

 

select  to_id as person1,from_id as person2 ,duration as duri_sum 

from Calls

 where to_id< from_id

)

 select person1, person2, count(*) as call_count, sum(duri_sum) as total_duration 

from table1 

group by person1, person2 

order by person1, person2;
