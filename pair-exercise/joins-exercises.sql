-- Write queries to return the following:
-- The following queries utilize the "world" database.

-- 1. The city name, country name, and city population of all cities in Europe with population greater than 1 million
-- (36 rows)

SELECT city.name, c.name, city.population
FROM city
        INNER JOIN country c
                ON city.countrycode = c.code
WHERE c.continent = 'Europe' AND city.population > 1000000  
ORDER BY city.population DESC;              

-- 2. The city name, country name, and city population of all cities in countries where French is an official language and the city population is greater than 1 million
-- (2 rows)

SELECT city.name, c.name, city.population
FROM city
        INNER JOIN country c
                ON city.countrycode = c.code
                        INNER JOIN countrylanguage cl
                                ON c.code = cl.countrycode
WHERE cl.language = 'French' AND cl.isofficial = true AND city.population > 1000000;
                               

-- 3. The name of the countries and continents where the language Javanese is spoken
-- (1 row)

SELECT c.name, c.continent
FROM country c
        JOIN countrylanguage cl
                ON c.code = cl.countrycode
WHERE cl.language = 'Javanese';                

-- 4. The names of all of the countries in Africa that speak French as an official language
-- (5 row)

SELECT c.name, c.continent
FROM country c
        JOIN countrylanguage cl
                ON c.code = cl.countrycode
WHERE cl.language = 'French' AND cl.isofficial = true AND c.continent = 'Africa';  

-- 5. The average city population of cities in Europe
-- (average city population in Europe: 287,684)

SELECT c.continent, AVG(city.population)
FROM city 
        JOIN country c
                ON city.countrycode = c.code
WHERE c.continent = 'Europe'
GROUP BY c.continent;               

-- 6. The average city population of cities in Asia
-- (average city population in Asia: 395,019)

SELECT c.continent, AVG(city.population)
FROM city 
        JOIN country c
                ON city.countrycode = c.code
WHERE c.continent = 'Asia'
GROUP BY c.continent;   

-- 7. The number of cities in countries where English is an official language
-- (number of cities where English is official language: 523)

SELECT 'Countries' AS Cateogry, COUNT(city.name) AS num_of_cities
FROM city
        INNER JOIN country c
                ON city.countrycode = c.code
                        INNER JOIN countrylanguage cl
                                ON c.code = cl.countrycode
WHERE cl.language = 'English' AND cl.isofficial = true;
                               

-- 8. The average population of cities in countries where the official language is English
-- (average population of cities where English is official language: 285,809)

SELECT 'Average City Population' AS Category, AVG(city.population)
FROM city
        INNER JOIN country c
                ON city.countrycode = c.code
                        INNER JOIN countrylanguage cl
                                ON c.code = cl.countrycode
WHERE cl.language = 'English' AND cl.isofficial = true;

-- 9. The names of all of the continents and the population of the continent’s largest city
-- (6 rows, largest population for North America: 8,591,309)

SELECT c.continent, MAX(city.population)
FROM city
        JOIN country c
                ON city.countrycode = c.code
GROUP BY c.continent;                

-- 10. The names of all of the cities in South America that have a population of more than 1 million people and the official language of each city’s country
-- (29 rows)

SELECT city.name, city.population, cl.language
FROM city
        INNER JOIN country c
                ON city.countrycode = c.code
                        INNER JOIN countrylanguage cl
                                ON c.code = cl.countrycode
WHERE c.continent = 'South America' AND city.population > 1000000 AND cl.isofficial = true;