-- Problem 1
SELECT Name,Population 
FROM country 
ORDER BY Population DESC 
limit 1;

-- Problem 2
SELECT Name,Population 
FROM country 
ORDER BY Population DESC 
limit 1 offset 1; 

-- Problem 3
SELECT Name,Population 
FROM country 
ORDER BY Population ASC
LIMIT 1;

-- Problem 4
SELECT Name,Population 
FROM country 
ORDER BY Population ASC 
limit 1 offset 2;

-- Problem 5 
SELECT Continent, SUM(SurfaceArea) as surface from country 
WHERE LifeExpectancy >75 
group by Continent 
order by surface DESC limit 3 ;

