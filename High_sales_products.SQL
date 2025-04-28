'''
Problem statement
Write a SQL query to find the top 10 products with the highest total sales revenue from the sales transactions. 
This will help the company to identify the High sales products which needs to be focused to increase the revenue of the company.

Hint:

Use the “Sales_transaction” table.
The resulting table should be limited to 10 productIDs whose TotalRevenue (Product of Price and QuantityPurchased) is the highest.
Return the result table ordering by TotalRevenue in descending order.

'''
-------------------High sales products--------------------
Select ProductID, 
          Sum(QuantityPurchased*Price) as TotalRevenue
           from Sales_transaction
group by ProductID
Order By TotalRevenue Desc
limit 10;
