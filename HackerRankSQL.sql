-- Occupations
-- https://www.hackerrank.com/challenges/occupations/problem




with cte as 
( select RANK() OVER (PARTITION BY Occupation ORDER BY Name) as Rank, 
 case when Occupation='Doctor' then Name else null end as doctor, 
 case when Occupation='Professor' then Name else null end as prof,
 case when Occupation='Singer' then Name else null end as singer, 
 case when Occupation='Actor' then Name else null end as actor from Occupations
)
select  min(doctor), min(prof), min(singer), min(actor) 
from cte group by Rank




-- Binary tree nodes
--https://www.hackerrank.com/challenges/binary-search-tree-1/problem
select N,
case
when (P is null) then 'Root'
when N IN (select P from BST) then 'Inner'
else 'Leaf' end
from BST
order by 1;




-- New Companies
-- https://www.hackerrank.com/challenges/the-company/problem
WITH BASE AS
(
SELECT company_code,
COUNT(DISTINCT lead_manager_code) AS lm,
COUNT(DISTINCT senior_manager_code) AS sm,
COUNT(DISTINCT manager_code) AS m,
COUNT(DISTINCT employee_code) AS e
FROM Employee
GROUP BY company_code
)
SELECT BASE.company_code,
founder,
lm,
sm,
m,
e
FROM BASE
LEFT JOIN Company
ON BASE.company_code = Company.company_code




-- The Blunder
-- https://www.hackerrank.com/challenges/the-blunder/problem

SELECT CEIL(AVG(salary)-AVG(REPLACE(salary,'0','')))
FROM employees                         



-- Weather Observation Station 19
-- https://www.hackerrank.com/challenges/weather-observation-station-19/problem

SELECT 
ROUND(POWER(POWER((MAX(LAT_N) - MIN(LAT_N)),2) + POWER((MAX(LONG_W) - MIN(LONG_W)),2),0.5),4)
FROM STATION




--
--