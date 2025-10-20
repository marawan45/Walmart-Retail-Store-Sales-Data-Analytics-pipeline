SELECT 
    SUM(CASE WHEN Weekly_Sales IS NULL THEN 1 ELSE 0 END) AS MissingSales,
    SUM(CASE WHEN Temperature IS NULL THEN 1 ELSE 0 END) AS MissingTemp,
    SUM(CASE WHEN Fuel_Price IS NULL THEN 1 ELSE 0 END) AS MissingFuel
FROM WalmartSales;

-- Impute missing Weekly_Sales with average sales per Store and Dept
WITH AvgSales AS (
    SELECT Store, Dept, AVG(Weekly_Sales) AS Avg_Weekly_Sales
    FROM WalmartSales
    GROUP BY Store, Dept
)
UPDATE WalmartSales ws
SET Weekly_Sales = (SELECT Avg_Weekly_Sales FROM AvgSales WHERE ws.Store = AvgSales.Store AND ws.Dept = AvgSales.Dept)
WHERE Weekly_Sales IS NULL; 
-- Impute missing Temperature with average temperature per Date
WITH AvgTemp AS (
    SELECT Date, AVG(Temperature) AS Avg_Temperature
    FROM WalmartSales
    GROUP BY Date
)       
UPDATE WalmartSales ws
SET Temperature = (SELECT Avg_Temperature FROM AvgTemp WHERE ws.Date = AvgTemp.Date)
WHERE Temperature IS NULL;

DELETE FROM WalmartSales
WHERE ID NOT IN (
    SELECT MIN(ID)
    FROM WalmartSales
    GROUP BY Store, Dept, Date
);

ALTER TABLE WalmartSales
ADD Date_Formatted DATE;

UPDATE WalmartSales
SET Date_Formatted = CONVERT(DATE, Date, 101);

--Total Sales per Store
SELECT Store, SUM(Weekly_Sales) AS Total_Sales
FROM WalmartSales
GROUP BY Store
ORDER BY Total_Sales DESC;

--Average Weekly Sales by Department
SELECT Dept, AVG(Weekly_Sales) AS Avg_Sales
FROM WalmartSales
GROUP BY Dept
ORDER BY Avg_Sales DESC;

--Holiday Impact
SELECT Holiday_Flag, AVG(Weekly_Sales) AS Avg_Sales
FROM WalmartSales
GROUP BY Holiday_Flag;

--Correlation Factors
SELECT 
    ROUND(AVG(Temperature),2) AS Avg_Temp,
    ROUND(AVG(Fuel_Price),2) AS Avg_Fuel,
    ROUND(AVG(Unemployment),2) AS Avg_Unemp,
    ROUND(AVG(Weekly_Sales),2) AS Avg_Sales
FROM WalmartSales;

SELECT 
    Store,
    Dept,
    Date_Formatted,
    Weekly_Sales,
    Temperature,
    Fuel_Price,
    Unemployment
FROM WalmartSales
WHERE Weekly_Sales IS NOT NULL  
  AND Temperature IS NOT NULL
  AND Fuel_Price IS NOT NULL
  AND Unemployment IS NOT NULL;