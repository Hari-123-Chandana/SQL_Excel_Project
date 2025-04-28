'''
Problem statement
Write a SQL query that describes the number of transaction along with the total amount spent by each customer 
which are on the higher side and will help us understand the customers who are the high frequency purchase customers in the company.


Hint:

Use the “sales_transaction” table.
The resulting table must have number of transactions more than 10 and TotalSpent more than 1000 on those transactions by the corresponding customers.
Return the result table on the “TotalSpent” in descending order.
'''
  
select customerID, 

  count(*) as NumberOfTransactions,

  sum(price*quantitypurchased) as totalspent

  from sales_transaction

  group by customerID

  having  NumberOfTransactions>10 and totalspent>1000

    order by totalspent desc;
