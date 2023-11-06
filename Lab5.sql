SELECT r.name AS RegionName, SUM(c.population) AS TotalPopulation
FROM cities c
JOIN regions r ON c.region = r.uuid
GROUP BY r.name;

SELECT r.name AS RegionName, SUM(c.population) AS TotalPopulation
FROM cities c
JOIN regions r ON c.region = r.uuid
GROUP BY r.name
HAVING COUNT(c.id) >= 10;

SELECT c.name AS CityName, c.population AS Population
FROM cities c
JOIN regions r ON c.region = r.uuid
WHERE r.area_quantity >= 5
ORDER BY c.population DESC
LIMIT 5 OFFSET 10;

SELECT r.name AS RegionName, SUM(c.population) AS TotalPopulation
FROM cities c
JOIN regions r ON c.region = r.uuid
WHERE c.population > 300000
GROUP BY r.name;

SELECT c.name AS CityName, c.population AS Population
FROM cities c
JOIN regions r ON c.region = r.uuid
WHERE r.area_quantity <= 5 AND (c.population < 150000 OR c.population > 500000);