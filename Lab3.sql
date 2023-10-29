SELECT * 
FROM cities 
WHERE name LIKE '%ськ';

SELECT * 
FROM cities 
WHERE name LIKE '%донец%';

SELECT CONCAT(name, ' (', region, ')') AS formatted_name 
FROM cities 
WHERE population > 100000 
ORDER BY formatted_name;

SELECT name, 
       population, 
       (population / 40000000 * 100) AS percent_of_total_population 
FROM cities 
ORDER BY population DESC 
LIMIT 10;

SELECT name, 
       CONCAT(ROUND((population / 40000000 * 100), 2), ' %') AS percent_of_total_population 
FROM cities 
WHERE population >= (0.1 / 100 * 40000000) 
ORDER BY percent_of_total_population DESC;