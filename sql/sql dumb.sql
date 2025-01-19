use sales;
-- 1. Total Sales by Product 
SELECT 
    T.Product_Code, 
    SUM(T.Sales_Amount) AS Total_Sales_Amount
FROM 
    Transactions T
GROUP BY 
    T.Product_Code
ORDER BY 
    Total_Sales_Amount DESC;

-- 2. Sales Quantity by Customer
SELECT 
    C.Custmer_Name, 
    SUM(T.Sales_QTY) AS Total_Sales_Quantity
FROM 
    Transactions T
JOIN 
    Customers C ON T.Customer_Code = C.Customer_Code
GROUP BY 
    C.Custmer_Name
ORDER BY 
    Total_Sales_Quantity DESC;

-- 3. Average Sales Amount by Customer Type
SELECT 
    C.Customer_Type, 
    AVG(T.Sales_Amount) AS Average_Sales_Amount
FROM 
    Transactions T
JOIN 
    Customers C ON T.Customer_Code = C.Customer_Code
GROUP BY 
    C.Customer_Type
ORDER BY 
    Average_Sales_Amount DESC;

-- 4. Total Sales by Market
SELECT 
    T.Market_Code, 
    SUM(T.Sales_Amount) AS Total_Sales_Amount
FROM 
    Transactions T
GROUP BY 
    T.Market_Code
ORDER BY 
    Total_Sales_Amount DESC;

-- 5. Sales Performance Over Time
SELECT 
    EXTRACT(MONTH FROM T.Order_Date) AS Month, 
    EXTRACT(YEAR FROM T.Order_Date) AS Year, 
    SUM(T.Sales_Amount) AS Total_Sales_Amount
FROM 
    Transactions T
GROUP BY 
    Year, Month
ORDER BY 
    Year, Month;

-- 6. Top 5 Best-Selling Products
SELECT 
    T.Product_Code, 
    SUM(T.Sales_Amount) AS Total_Sales_Amount
FROM 
    Transactions T
GROUP BY 
    T.Product_Code
ORDER BY 
    Total_Sales_Amount DESC
LIMIT 5;

-- 7. Sales by Currency
SELECT 
    T.Currency, 
    SUM(T.Sales_Amount) AS Total_Sales_Amount
FROM 
    Transactions T
GROUP BY 
    T.Currency
ORDER BY 
    Total_Sales_Amount DESC;

-- 8. Customer Sales Breakdown
SELECT 
    C.Custmer_Name, 
    SUM(T.Sales_Amount) AS Total_Sales_Amount,
    SUM(T.Sales_QTY) AS Total_Sales_Quantity
FROM 
    Transactions T
JOIN 
    Customers C ON T.Customer_Code = C.Customer_Code
GROUP BY 
    C.Custmer_Name
ORDER BY 
    Total_Sales_Amount DESC;

-- 9. Sales Performance by Product and Customer Type
SELECT 
    T.Product_Code, 
    C.Customer_Type, 
    SUM(T.Sales_Amount) AS Total_Sales_Amount
FROM 
    Transactions T
JOIN 
    Customers C ON T.Customer_Code = C.Customer_Code
GROUP BY 
    T.Product_Code, C.Customer_Type
ORDER BY 
    Total_Sales_Amount DESC;

-- 10. Sales Breakdown by Customer Type and Market
SELECT 
    C.Customer_Type, 
    T.Market_Code, 
    SUM(T.Sales_Amount) AS Total_Sales_Amount
FROM 
    Transactions T
JOIN 
    Customers C ON T.Customer_Code = C.Customer_Code
GROUP BY 
    C.Customer_Type, T.Market_Code
ORDER BY 
    Total_Sales_Amount DESC;
