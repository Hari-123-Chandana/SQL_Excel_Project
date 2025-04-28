'''
Problem statement
Write a SQL query to find the ten products with the least amount of units sold from the sales transactions, provided that at least one unit was sold for those products.
'''

'''  
Hint:

Use the “Sales_transaction” table.
The resulting table should be limited to 10 productIDs whose TotalUnitsSold (sum of QuantityPurchased) is the least. (The limit value can be adjusted accordingly)
Return the result table ordering by TotalUnitsSold in ascending order.
'''


SELECT PRODUCTID

            , SUM(QUANTITYPURCHASED) AS TOTALUNITSSOLD

            FROM SALES_TRANSACTION

            GROUP BY PRODUCTID

            HAVING TOTALUNITSSOLD > 0

            ORDER BY TOTALUNITSSOLD ASC LIMIT 10;

OUTPUT :
