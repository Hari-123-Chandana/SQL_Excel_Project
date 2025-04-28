'''
Problem statement
Write a SQL query that describes the duration between the first and the last purchase of the customer in that particular company to understand the loyalty of the customer.


Hints:

Use the "Sales_transaction" table.
The DATE column will be majorly in use in the question and the TransactionDate column in Sales_transaction is in text format.
Thus, the format of the TransactionDate column should be changed.
The resulting table must have the first date of purchase, the last date of purchase and the difference between the first and the last date of purchase.
The difference between the first and the last date of purchase should be more than 0.
Return the table in descending order corresponding to DaysBetweenPurchases.
'''



select customerID , min(cast(transactiondate as date)) as firstpurchase , 
           max(cast(transactiondate as date)) as lastpurchase, 
           datediff(max(cast(transactiondate as date)), min(cast(transactiondate as date))) as Daysbetweenpurchases
           from sales_transaction
group by customerID
having Daysbetweenpurchases>0
order by Daysbetweenpurchases desc;
