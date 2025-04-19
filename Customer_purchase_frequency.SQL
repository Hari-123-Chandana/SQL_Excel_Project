'''
Problem statement
Write a SQL query to count the number of transactions per customer to understand purchase frequency.
'''

'''
Hint:

Use the “Sales_transaction” table.
The resulting table will be counting the number of transactions corresponding to each customerID.
Return the result table ordered by NumberOfTransactions in descending order.
'''


select customerID, count(transactionDate) as NumberOfTransactions
 from sales_transaction
group by customerID 
order by NumberOfTransactions desc
