-- SELECT BASICS =======================================================

SELECT population FROM world
  WHERE name = 'Germany';

SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');

SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000;

-- SELECT NAMES ========================================================

SELECT name FROM world
  WHERE name LIKE 'Y%';

SELECT name FROM world
  WHERE name LIKE '%y';

SELECT name FROM world
  WHERE name LIKE '%x%';

SELECT name FROM world
  WHERE name LIKE '%land';

SELECT name FROM world
  WHERE name LIKE 'C%ia';

SELECT name FROM world
  WHERE name LIKE '%oo%';

SELECT name FROM world
  WHERE name LIKE '%a%a%a%';

SELECT name FROM world
  WHERE name LIKE '_t%'
ORDER BY name;

SELECT name FROM world
  WHERE name LIKE '%o__o%';

SELECT name FROM world
  WHERE name LIKE '____';

SELECT name
  FROM world
 WHERE name = capital;

SELECT name
  FROM world
 WHERE capital = concat(name, ' City');

SELECT capital, name
  FROM world
WHERE capital LIKE concat('%', name, '%');

SELECT capital, name
  FROM world
WHERE capital LIKE concat('%', name, '%') AND capital NOT LIKE name;

SELECT name, REPLACE(capital, name, '') AS extension
  FROM world
WHERE capital LIKE concat('%', name, '%') AND capital NOT LIKE name;

-- SELECT from WORLD ===================================================

SELECT name, continent, population FROM world;

SELECT name
  FROM world
 WHERE population > 200000000;

SELECT name, gdp/population
FROM world
WHERE population >= 200000000;

SELECT name, population/1000000
FROM world
WHERE continent LIKE 'South America';

SELECT name, population
FROM world
WHERE name in ('France', 'Germany', 'Italy');

SELECT name
FROM world
WHERE name LIKE '%United%';

SELECT name, population, area
FROM world
WHERE area > 3000000 OR population > 250000000;

SELECT name, population, area
FROM world
WHERE (area > 3000000 AND NOT population > 250000000) OR (population > 250000000 AND NOT area > 3000000);

SELECT name, ROUND(population/1000000, 2), ROUND(gdp/1000000000, 2)
FROM world
WHERE continent = 'South America';

SELECT name, ROUND(gdp/population, -3)
FROM world
WHERE gdp > 1000000000000;

SELECT name, capital
  FROM world
 WHERE LEN(name) = LEN(capital);

SELECT name, capital
FROM world
WHERE name <> capital AND LEFT(name,1) = LEFT(capital,1);

SELECT name
   FROM world
WHERE name NOT LIKE '% %' AND name LIKE '%a%' AND name LIKE '%e%' AND name LIKE '%i%' AND name LIKE '%o%' AND name LIKE '%u%';

-- SELECT NOBEL =======================================================

SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950;

 SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature';

SELECT yr, subject
  FROM nobel
 WHERE winner = 'Albert Einstein';

SELECT winner
  FROM nobel
 WHERE subject = 'Peace' AND yr >= 2000;

SELECT yr, subject, winner
  FROM nobel
 WHERE subject = 'Literature' AND yr >= 1980 AND yr <= 1989;

SELECT * FROM nobel
 WHERE winner IN ('Theodore Roosevelt',
                  'Woodrow Wilson',
                  'Jimmy Carter',
                  'Barack Obama');

SELECT winner FROM nobel
WHERE winner LIKE 'John%';

SELECT yr, subject, winner FROM nobel
WHERE (subject = 'Physics' AND yr = 1980) OR (subject = 'Chemistry' AND yr = 1984);

SELECT yr, subject, winner FROM nobel
WHERE yr = 1980 AND subject <> 'Chemistry' AND subject <> 'Medicine';

SELECT yr, subject, winner FROM nobel
WHERE (yr < 1910 AND subject = 'Medicine') OR (yr >= 2004 AND subject = 'Literature');

SELECT * FROM nobel
WHERE winner = 'PETER GRÜNBERG';

SELECT * FROM nobel
WHERE winner = 'EUGENE O''NEILL';

SELECT winner, yr, subject FROM nobel
WHERE winner LIKE 'Sir%'
ORDER BY yr DESC, winner ASC;

SELECT winner, subject
  FROM nobel
 WHERE yr=1984
 ORDER BY 
 CASE WHEN subject IN ('Physics','Chemistry') THEN 1 ELSE 0
END,
subject, winner;

-- SELECT within SELECT ================================================

SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia');

SELECT name FROM world
  WHERE continent = 'europe' AND gdp/population >
     (SELECT gdp/population FROM world
      WHERE name='United Kingdom');

SELECT name, continent FROM world
  WHERE continent =
     (SELECT continent FROM world
      WHERE name = 'Argentina')
  OR continent = 
     (SELECT continent FROM world
      WHERE name = 'Australia')
  ORDER BY name;

SELECT name, population FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name = 'Canada')
  AND population < 
     (SELECT population FROM world
      WHERE name = 'Poland');

SELECT name, CONCAT(CONVERT(INT, ROUND((population/
    (SELECT population 
    FROM world 
    WHERE name = 'Germany')) * 100, 0)), '%') 
FROM world
WHERE continent = 'Europe';

SELECT name
  FROM world
 WHERE gdp > ALL(SELECT gdp
                  FROM world
                  WHERE gdp>0 AND continent = 'Europe');

SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND area>0);

SELECT continent, name FROM world x
  WHERE name = ALL
    (SELECT TOP 1 name FROM world y
        WHERE y.continent=x.continent);

SELECT name, continent FROM world x
  WHERE population >= ALL
    (SELECT population * 3 FROM world y
        WHERE y.continent=x.continent AND population > 0 AND x.name <> y.name);

-- SELECT BASICS =======================================================
-- SELECT BASICS =======================================================
-- SELECT BASICS =======================================================
-- SELECT BASICS =======================================================
-- SELECT BASICS =======================================================

