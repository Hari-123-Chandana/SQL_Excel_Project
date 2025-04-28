'''
Problem statement
Write an SQL query that segments customers based on the total quantity of products they have purchased. Also, count the number of customers in each segment which will help us target a particular segment for marketing.


Hint:

Use the customer_profiles and sales_transaction tables.
Create a separate table named customer_segment and create the segments on the total quantity of the purchased products.
To segment customers based on their purchasing behavior for targeted marketing campaigns. Create Customer segments on the following criteria-

The resulting table should count the number of customers in different customer segments.
Return the result table in any order.
'''

---------------------------------------------customer segmentation-------------------------------------------------------

CREATE TABLE CUSTOMER_SEG AS 
SELECT CUSTOMERID
            , CASE WHEN TOTALQUANTITY > 30 THEN "HIGH"
                        WHEN TOTALQUANTITY BETWEEN 10 AND 30 THEN "MED"
                        WHEN TOTALQUANTITY BETWEEN 1 AND 10 THEN "LOW"
                        ELSE "NONE" END CUSTOMERSEGMENT
            FROM (
                SELECT C.CUSTOMERID
                            , SUM(S.QUANTITYPURCHASED) AS TOTALQUANTITY
                            FROM CUSTOMER_PROFILES C
                            JOIN SALES_TRANSACTION S 
                            ON C.CUSTOMERID = S.CUSTOMERID
                            GROUP BY C.CUSTOMERID 
            )  AS TQ;
SELECT CUSTOMERSEGMENT
            , COUNT(*) 
            FROM CUSTOMER_SEG
            GROUP BY CUSTOMERSEGMENT;
