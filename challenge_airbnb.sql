SELECT * FROM airbnb_list
WHERE
	price = (SELECT MAX(price) from airbnb_list);
--Three listings with max price of $10000(price is too high and unrealistic for Ashville). Belongs to same host and nearby neighbourhood.
----------------------------------------------------------------	
SELECT
	neighbourhood,
	sum(number_of_reviews) as total_review
FROM
	airbnb_list
GROUP BY neighbourhood
ORDER BY total_review DESC;
--28806 is most popular based on total reviews for all listings--

---------------------------------------------------------------------
--Cheapest time to visit Asheville--
select 
	to_char(date_trunc('month',date),'MON') AS Month_of_year, 
	avg(price::numeric) as average_price
from 
	calendar_table
where 
	available = 't'
group by Month_of_year
order by average_price ASC;
--January is the busiest time to visit Asheville--
--------------------------------------------------------
--Busiest time to visit Asheville--

select 
	to_char(date_trunc('month',date),'MON') as time_of_year, 
	count(price) as count_available
from 
	calendar_table
where 
	available = 't'
group by time_of_year
order by count_available ASC;
--Oct looks to be the busiest month to visit Asheville--
------------------------------------------------------------