create database hospitaldb;
use hospitaldb;
CREATE TABLE CostReport (
    Provider_CCN VARCHAR(10),
    Facility_Type VARCHAR(50),
    CCN_Category CHAR(1),
    Number_of_Beds INT,
    Total_Costs DECIMAL(15, 2),
    Cost_of_Charity_Care DECIMAL(15, 2),
    Total_Income DECIMAL(15, 2),
    Net_Income DECIMAL(15, 2),
    Net_Patient_Revenue DECIMAL(15, 2),
    Total_Days_Title_XVIII INT,
    Total_Discharges_Title_XVIII INT
);

#Retrieve Top 5 Providers by Net Income
SELECT Provider_CCN, Net_Income
FROM CostReport
ORDER BY Net_Income DESC
LIMIT 5;

#Calculate Average Costs of Charity Care
SELECT AVG(Cost_of_Charity_Care) AS Average_Charity_Care
FROM CostReport;

#Identify Providers with Net Income Below Zero
SELECT Provider_CCN, Net_Income
FROM CostReport
WHERE Net_Income < 0;

#How do different types of hospitals affect their income and expenses?
SELECT Facility_Type, 
       AVG(Total_Costs) AS Avg_Total_Costs, 
       AVG(Net_Income) AS Avg_Net_Income, 
       AVG(Total_Income) AS Avg_Total_Income
FROM CostReport
GROUP BY Facility_Type
ORDER BY Avg_Net_Income DESC;

#Is there a link between the number of hospital beds and patient volume, and how does this affect total revenue?
SELECT Number_of_Beds, 
       AVG(Total_Days_Title_XVIII) AS Avg_Total_Days, 
       AVG(Total_Discharges_Title_XVIII) AS Avg_Total_Discharges, 
       AVG(Net_Patient_Revenue) AS Avg_Revenue
FROM CostReport
GROUP BY Number_of_Beds
ORDER BY Number_of_Beds ASC;

#How do hospitals manage charity care while maintaining financial stability?
SELECT Provider_CCN, 
       Facility_Type, 
       Cost_of_Charity_Care, 
       Net_Income, 
       Total_Income, 
       Total_Costs
FROM CostReport
WHERE Cost_of_Charity_Care > 0
ORDER BY Net_Income ASC;

#How does the severity of care given (CCN Facility Type) impact hospital operating costs and patient outcomes?
SELECT CCN_Category, 
       AVG(Total_Costs) AS Avg_Operating_Costs, 
       AVG(Net_Income) AS Avg_Net_Income, 
       AVG(Total_Days_Title_XVIII) AS Avg_Patient_Days, 
       AVG(Total_Discharges_Title_XVIII) AS Avg_Discharges
FROM CostReport
GROUP BY CCN_Category
ORDER BY Avg_Operating_Costs DESC;

#Advanced Query for Correlation Between Beds and Financial Metrics
SELECT Number_of_Beds, 
       COUNT(*) AS Hospital_Count, 
       SUM(Net_Patient_Revenue) AS Total_Revenue, 
       SUM(Total_Costs) AS Total_Costs, 
       AVG(Net_Income) AS Avg_Net_Income
FROM CostReport
GROUP BY Number_of_Beds
ORDER BY Number_of_Beds ASC;











