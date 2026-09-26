CREATE DATABASE food_delivery;
USE food_delivery;

CREATE TABLE Orders (
    Order_ID VARCHAR(50),
    Order_Date DATE,
    Customer_ID VARCHAR(50),
    Restaurant VARCHAR(50),
    Category VARCHAR(50),
    Area VARCHAR(50),
    Order_Value INT,
    Delivery_Time INT,
    Rating DECIMAL(2,1),
    Payment_Mode VARCHAR(50),
    Order_Status VARCHAR(50),
    Delivery_Status VARCHAR(50)
);

INSERT INTO Orders
(Order_ID, Order_Date, Customer_ID, Restaurant, Category, Area,
 Order_Value, Delivery_Time, Rating, Payment_Mode,
 Order_Status, Delivery_Status)
VALUES
('FD1001','2026-08-01','C101','Pune Misal House','Maharashtrian','Kothrud',280,25,4.5,'UPI','Delivered','On_Time'),
('FD1002','2026-08-01','C102','Puneri Tadka','North Indian','Baner',520,38,4.1,'Card','Delivered','On_Time'),
('FD1003','2026-08-02','C103','Aai''s Kitchen','Maharashtrian','Wakad',350,30,4.7,'UPI','Delivered','On_Time'),
('FD1004','2026-08-02','C104','Sahyadri Cafe','Fast Food','Kothrud',420,35,4.2,'Cash','Delivered','On_Time'),
('FD1005','2026-08-03','C105','Puneri Biryani','Biryani','Baner',480,45,3.8,'UPI','Delivered','Delayed'),
('FD1006','2026-08-03','C101','Mastani Corner','Desserts','Kothrud',260,22,4.6,'Card','Delivered','On_Time'),
('FD1007','2026-08-04','C106','Maharashtra Thali','Maharashtrian','Hadapsar',650,40,4.3,'UPI','Delivered','On_Time'),
('FD1008','2026-08-04','C107','Puneri Tadka','North Indian','Wakad',550,48,3.7,'Card','Delivered','Delayed'),
('FD1009','2026-08-05','C108','Kaka''s Vada Pav','Fast Food','Kothrud',180,18,4.8,'UPI','Delivered','On_Time'),
('FD1010','2026-08-05','C109','Puneri Biryani','Biryani','Baner',720,55,3.4,'Card','Delivered','Delayed'),
('FD1011','2026-08-06','C110','Aai''s Kitchen','Maharashtrian','Wakad',390,27,4.6,'UPI','Delivered','On_Time'),
('FD1012','2026-08-06','C111','Pune Misal House','Maharashtrian','Hadapsar',240,32,4.4,'Cash','Delivered','On_Time'),
('FD1013','2026-08-07','C112','Sahyadri Cafe','Fast Food','Wakad',450,NULL,4.0,'UPI','Delivered','Missing'),
('FD1014','2026-08-07','C113','Mastani Corner','Desserts','Baner',320,29,4.5,'Card','Delivered','On_Time'),
('FD1015','2026-08-08','C114','Maharashtra Thali','Maharashtrian','Kothrud',700,37,4.2,'UPI','Delivered','On_Time'),
('FD1016','2026-08-08','C115','Kaka''s Vada Pav','Fast Food','Hadapsar',150,20,4.7,'Cash','Delivered','On_Time'),
('FD1017','2026-08-09','C116','Puneri Biryani','Biryani','Wakad',590,52,3.5,'UPI','Delivered','Delayed'),
('FD1018','2026-08-09','C117','Aai''s Kitchen','Maharashtrian','Baner',430,31,4.6,'Card','Delivered','On_Time'),
('FD1019','2026-08-10','C118','Puneri Tadka','North Indian','Hadapsar',610,44,3.9,'UPI','Delivered','Delayed'),
('FD1020','2026-08-10','C101','Pune Misal House','Maharashtrian','Kothrud',300,24,4.8,'UPI','Delivered','On_Time');

SELECT * FROM Orders;

SELECT COUNT(*) AS Total_Orders
FROM Orders;

SELECT *
FROM Orders
WHERE Area = 'Kothrud';

SELECT Order_ID, Restaurant, Order_Value
FROM Orders
WHERE Area = 'Kothrud'
AND Order_Value > 300;

SELECT Order_ID, Restaurant, Area, Order_Value
FROM Orders
ORDER BY Order_Value DESC;

SELECT Area, SUM(Order_Value) AS Area_Revenue
FROM Orders
GROUP BY Area
ORDER BY Area_Revenue DESC;

SELECT Category, COUNT(*) AS Order_Count
FROM Orders
GROUP BY Category
ORDER BY Order_Count DESC;

SELECT Category, SUM(Order_Value) AS Category_Revenue
FROM Orders
GROUP BY Category
ORDER BY Category_Revenue DESC;

SELECT Restaurant, SUM(Order_Value) AS Restaurant_Revenue
FROM Orders
GROUP BY Restaurant
ORDER BY Restaurant_Revenue DESC;

SELECT Restaurant, AVG(Rating) AS Average_Rating
FROM Orders
GROUP BY Restaurant
ORDER BY Average_Rating DESC;

SELECT Restaurant, AVG(Delivery_Time) AS Average_Delivery_Time
FROM Orders
GROUP BY Restaurant
ORDER BY Average_Delivery_Time;

SELECT Payment_Mode, COUNT(*) AS Order_Count
FROM Orders
GROUP BY Payment_Mode
ORDER BY Order_Count DESC;

SELECT Customer_ID, COUNT(*) AS Order_Count
FROM Orders
GROUP BY Customer_ID
HAVING COUNT(*) > 1;

SELECT Customer_ID, SUM(Order_Value) AS Total_Spent
FROM Orders
GROUP BY Customer_ID
ORDER BY Total_Spent DESC;

SELECT COUNT(DISTINCT Customer_ID) AS Unique_Customers
FROM Orders;

SELECT Delivery_Status, COUNT(*) AS Order_Count
FROM Orders
GROUP BY Delivery_Status;

SELECT *
FROM Orders
WHERE Delivery_Status = 'Delayed';

SELECT *
FROM Orders
WHERE Delivery_Status = 'On_Time';

SELECT *
FROM Orders
WHERE Delivery_Status = 'Missing';

SELECT Restaurant, SUM(Order_Value) AS Revenue
FROM Orders
GROUP BY Restaurant
ORDER BY Revenue DESC
LIMIT 1;

SELECT Area, AVG(Order_Value) AS Average_Order_Value
FROM Orders
GROUP BY Area
ORDER BY Average_Order_Value DESC;

SELECT Category, AVG(Rating) AS Average_Rating
FROM Orders
GROUP BY Category
ORDER BY Average_Rating DESC;

SELECT Restaurant, COUNT(*) AS Order_Count
FROM Orders
GROUP BY Restaurant
HAVING COUNT(*) >= 3;

SELECT MONTH(Order_Date) AS Order_Month,
       COUNT(*) AS Order_Count
FROM Orders
GROUP BY MONTH(Order_Date);

SELECT *
FROM Orders
WHERE Order_Value BETWEEN 300 AND 600;

SELECT *
FROM Orders
WHERE Area IN ('Kothrud', 'Baner');

SELECT *
FROM Orders
WHERE Rating IS NOT NULL;

SELECT
    Order_ID,
    Delivery_Time,
    CASE
        WHEN Delivery_Time IS NULL THEN 'Missing'
        WHEN Delivery_Time > 40 THEN 'Delayed'
        ELSE 'On_Time'
    END AS Delivery_Category
FROM Orders;
