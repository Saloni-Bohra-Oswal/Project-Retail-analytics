CREATE schema retail_data;
USE retail_data;

#2 task 2
SELECT * from retail_data.marketing_campaign;
#2 task 3

#3 task 1
USE retail_data;
SELECT count(*) AS total_transaction from marketing_campaign;

#3 task 2
-- Use a Common Table Expression (CTE) to calculate totals for each category
WITH ProductTotals AS (
    SELECT 'Wines' AS ProductCategory, SUM(MntWines) AS TotalAmount FROM marketing_campaign
    UNION ALL
    SELECT 'Meat Products', SUM(MntMeatProducts) FROM marketing_campaign
    UNION ALL
    SELECT 'Fish Products', SUM(MntFishProducts) FROM marketing_campaign
    UNION ALL
    SELECT 'Sweet Products', SUM(MntSweetProducts) FROM marketing_campaign
    UNION ALL
    SELECT 'Fruits', SUM(MntFruits) FROM marketing_campaign
    UNION ALL
    SELECT 'Gold Products', SUM(MntGoldProds) FROM marketing_campaign
)
-- Select from the CTE and order to find the top 10
SELECT
    ProductCategory,
    TotalAmount
FROM
    ProductTotals
ORDER BY
    TotalAmount DESC
LIMIT 10;



#3 task 3
USE retail_data;
SELECT count(*) AS response from marketing_campaign;


#3 task 4
SELECT
    Education,
    Marital_Status,
    COUNT(*) AS NumberOfCustomers
FROM
    marketing_campaign
GROUP BY
    Education,
    Marital_Status
ORDER BY
    NumberOfCustomers DESC;
    
 #3 task 5
 SELECT
     avg(Income)
FROM
    marketing_campaign;
 
#3 task 6



#3 task 7
SELECT
    COUNT(*)
FROM
    marketing_campaign
GROUP BY
AcceptedCmp5;
    


#3 task 8
SELECT 
       AVG(Kidhome) AS avg_children,
       AVG(Teenhome) AS avg_teens
FROM marketing_campaign;

#3 task 9
ALTER TABLE marketing_campaign
ADD COLUMN Age1 INT;
UPDATE marketing_campaign
SET Age1 = (EXTRACT(YEAR FROM CURRENT_DATE) - Year_Birth);

#3 task 10
ALTER TABLE marketing_campaign
ADD COLUMN Age_group VARCHAR(10);
UPDATE marketing_campaign
SET Age_group = CASE
    WHEN Age BETWEEN 18 AND 25 THEN '18-25'
    WHEN Age BETWEEN 26 AND 35 THEN '26-35'
    WHEN Age BETWEEN 36 AND 45 THEN '36-45'
    WHEN Age BETWEEN 46 AND 55 THEN '46-55'
    ELSE '56+'
END;
SELECT
    Age_group,
    AVG(NumWebVisitsMonth) AS AvgMonthlyVisits
FROM
    marketing_campaign
GROUP BY
    Age_group
ORDER BY
    Age_group;


