-- a) Design SQL which lists user(s) with biggest total salary from April to November. Show user name and overall salary amount

SELECT 
   u.`name`, 
   SUM(s.`sum`) AS `sum`
FROM
  `salaries` AS s 
  LEFT JOIN users AS u ON u.id = s.`userId`
WHERE MONTH(s.`dateofSalary`) >= MONTH('2015-04-01') 
  AND MONTH(s.`dateofSalary`) <= MONTH('2015-11-30')
GROUP BY s.`userId`
ORDER BY `sum` DESC

-- b) Design SQL which shows users who haven't received salary yet

SELECT
	`name`
FROM
	`users`
WHERE
	`id` NOT IN (
		SELECT DISTINCT
			`userId`
		FROM
			`salaries`
	)
	

