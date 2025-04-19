'''
Problem statement
Write a SQL query to identify the null values in the dataset and replace those by “Unknown”.
'''

select count(*) from customer_profiles          # finding number of null values 
where Location is NULL;


update customer_profiles
set location ='Unknown'              # update only one column with null values to unknown
where location is NULL;

select * from customer_profiles;   # return the table after updating


---------------------------------------Alternate approach:------------------------------------------------

select count(*) from customer_profiles
where CustomerID is null or Age is null or Gender is null or  Location is null or JoinDate is null;
                                      # finding the null values in all the columns in the tables
UPDATE customer_profiles
SET                                                    @setting the null values to unknown in all the columns 
    CustomerID = COALESCE(CustomerID, 'Unknown'),    
    Age = COALESCE(Age, 'Unknown'),
    Gender = COALESCE(Gender, 'Unknown'),
    Location = COALESCE(Location, 'Unknown'),
     JoinDate = COALESCE(JoinDate, 'Unknown');

select * from customer_profiles; 

