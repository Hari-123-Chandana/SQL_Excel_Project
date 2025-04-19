# Fix Incorrect Prices
'''
Problem statement
Write a query to identify the discrepancies in the price of the same product in "sales_transaction" and "product_inventory" tables. 
Also, update those discrepancies to match the price in both the tables.
'''

select s. TransactionID,
          s.price as TransactionPrice, 
          p.price as InventoryPrice 
from sales_transaction as s
join product_inventory as p 
on s.ProductID=p.ProductID
where s.price<>p.price;

update sales_transaction as s 
join product_inventory as p 
on p.ProductID=s.ProductID
set s.price=p.price 
where  s.Price<>p.Price;

select * from sales_transaction;


------------------------------Alternate way:---------------------------------

SELECT T.TRANSACTIONID
            , T.PRICE as transactionprice
            , I.PRICE as inventoryprice
            FROM SALES_TRANSACTION AS T
            JOIN PRODUCT_INVENTORY AS I 
            ON T.PRODUCTID = I.PRODUCTID
            WHERE T.PRICE <> I.PRICE;

UPDATE SALES_TRANSACTION T
SET PRICE = (SELECT I.PRICE FROM PRODUCT_INVENTORY I 
                        WHERE T.PRODUCTID = I.PRODUCTID)
WHERE T.PRODUCTID IN ( SELECT PRODUCTID FROM PRODUCT_INVENTORY as I WHERE
                                            T.PRICE <> I.PRICE);
select * from SALES_TRANSACTION                                           
