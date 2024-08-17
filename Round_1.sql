CREATE TABLE country_pollution (
  Country VARCHAR(50),
  Temperature FLOAT,
  CO2_Emissions INT,
  Date_Year INT
);

INSERT INTO country_pollution (Country, Temperature, CO2_Emissions, Date_Year)
VALUES
  ('United States', 15.2, 400, 2023),
  ('China', 18.5, 350, 2022),
  ('India', 25.1, 400, 2024),
  ('Brazil', 25.1, 150, 2020),
  ('Russia', -5.7, 200, 2019),
  ('Russia',null , 200, 2015),
  ('India', 22.1, 400, 2021),
  ('China', 23.5, 350, 2021);

/* 1.Question: Write a query to find the countries with the highest temperatures in the dataset?*/  

SELECT Country, MAX(Temperature) AS HighestTemperature 
FROM country_pollution
GROUP BY Country
ORDER BY HighestTemperature DESC;

/* 2.Question: Write a query to identify the countries with the lowest CO2 emissions in the dataset.*/

SELECT Country, Min(CO2_Emissions) AS LOWESTCO2EMISSION
FROM country_pollution
GROUP BY Country 
ORDER BY LOWESTCO2EMISSION ;

/* 3.Question: Write a query to find all temperature records above a specific value, for example, 20 degrees Celsius.*/

SELECT *
FROM country_pollution
WHERE Temperature > 20;

/*4.Question: Write a query to list all countries with CO2 emissions data available for the year 2020.*/

SELECT DISTINCT Country
FROM country_pollution
WHERE Date_Year = 2020 AND CO2_Emissions IS NOT NULL;

/* 5.Question: Write a query to count the total number of temperature records in the dataset.*/

SELECT COUNT(*) AS Total_NO_OF_Temperature_Records
FROM country_pollution;

/* 6.Question: Write a query to identify any countries with missing temperature data for a specific year, for example, 2015.*/

SELECT Country
FROM country_pollution
WHERE Date_Year = 2015 AND Temperature IS NULL;

/*7.Question: Write a query to find the average temperature for each year in the dataset*/

SELECT Date_Year, ROUND(AVG(Temperature),2) AS Avg_Temperature
FROM country_pollution
GROUP BY Date_Year;

/*8.Question: Write a query to calculate the total CO2 emissions for all countries in the dataset.*/

SELECT SUM(CO2_Emissions) AS Total_CO2_Emissions
FROM country_pollution;

/*9.Question: Write a query to sort the temperature data in descending order based on the temperature values.*/

SELECT *
FROM country_pollution
ORDER BY Temperature DESC;














