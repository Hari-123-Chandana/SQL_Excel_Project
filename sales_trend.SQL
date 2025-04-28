'''
Problem statement
Write a SQL query to identify the sales trend to understand the revenue pattern of the company


Hint:

Use the “sales_transaction” table.
The resulting table must have DATETRANS in date format, count the number of transaction on that particular date, total units sold and the total sales took place.
Return the result table ordered by datetrans in descending order.
'''


SELECT CAST(TRANSACTIONDATE AS DATE) AS DATETRANS

            , COUNT(*) AS TRANSACTION_COUNT

            , SUM(QUANTITYPURCHASED) AS TOTALUNITSSOLD

            , SUM(PRICE * QUANTITYPURCHASED) AS TOTALSALES

            FROM SALES_TRANSACTION

            GROUP BY DATETRANS

            ORDER BY DATETRANS DESC;
