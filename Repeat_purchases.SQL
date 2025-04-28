'''
Problem statement
Write a SQL query that describes the total number of purchases made by each customer against each productID to understand the repeat customers in the company.


Hint:

Use the “Sales_transaction” table.
The resulting table must have "CustomerID", "ProductID" and the number of times that particular customer have purchases the product.
The number of times the customer has purchased should be more than once.
Return the result table in descending order corresponding to the TimesPurchased column.
'''

---------------------------------------------- repeat purchases--------------------------------------------
select customerID, productID,
          count(*) as timespurchased from sales_transaction
          group by customerID, productID
          having timespurchased>1
          order by timespurchased desc;
