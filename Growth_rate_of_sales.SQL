'''
Problem statement
Write a SQL query to understand the month on month growth rate of sales of the company which will help understand the growth trend of the company.

Hint:

Use the “sales_transaction” table.
The resulting table must extract the month from the transactiondate and then the Month on month growth percentange should be calculated.
(Total sales present month - total sales previous month/ total sales previous month * 100)
Return the result table ordering by month.
'''


SELECT MONTH_NO AS MONTH

            , TOTAL_SALES

            , LAG(TOTAL_SALES) OVER (ORDER BY MONTH_NO) AS PREVIOUS_MONTH_SALES

            , ((TOTAL_SALES - LAG(TOTAL_SALES) OVER (ORDER BY MONTH_NO))

                / LAG(TOTAL_SALES) OVER (ORDER BY MONTH_NO))*100 AS MOM_GROWTH_PERCENTAGE

FROM (                

SELECT MONTH(TRANSACTIONDATE) AS MONTH_NO

            , SUM(PRICE * QUANTITYPURCHASED) AS TOTAL_SALES

            FROM SALES_TRANSACTION

            GROUP BY MONTH(TRANSACTIONDATE)

) A

ORDER BY MONTH_NO;
