'''
Problem statement
Write a SQL query to summarize the total sales and quantities sold per product by the company.
'''

(Here, the data has been already cleaned in the previous steps and from here we will be understanding the different types of data analysis from the given dataset.)
select productID, sum(quantitypurchased) as totalunitssold ,
                          sum(quantitypurchased* price) as TotalSales   
                          from sales_transaction
                          group by productID
                          order by totalsales desc;
