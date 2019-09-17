SHOW TABLES;

#Question 1
#Q.no(01).Show product id, description and total worth of each product.
SELECT PRODUCT_ID, PRODUCT_DESC,PRODUCT_PRICE AS PRODUCT_WORTH FROM PRODUCT;

#QUESTION 2
#Q.no(02).Show order details which are yet to be shipped.
SELECT * FROM ORDER_HEADER WHERE ORDER_STATUS='In process';

#QUESTION 3
#Q.no(03).Display the details of products where the product category is any of 2050, 2053 or 2055.
SELECT * FROM PRODUCT WHERE PRODUCT_CLASS_CODE IN (2050,2053,2055);

#QUESTION 4
#Q.no(04).List the details of customers whose creation date is before ’12-Jan-2006’ and email address contains ‘gmail’ or ‘yahoo’ and user name starts with ‘dave’.
SELECT * FROM ONLINE_CUSTOMER WHERE CUSTOMER_CREATION_DATE<('2006-01-12') AND (CUSTOMER_EMAIL LIKE ('%gmail%') OR CUSTOMER_EMAIL LIKE ('%yahoo%')) AND CUSTOMER_USERNAME LIKE ('dave%');

#QUESTION 5
#Q.no(05).Display details of customer who have Gmail account, as below:
          #<Customer full name> (<customer user name>) created on <date>. Contact Phone: <Phone no.> E-mail: <E-mail id>
SELECT CONCAT(CUSTOMER_FNAME,' ',CUSTOMER_LNAME) AS CUSTOMER_FULLNAME, CUSTOMER_USERNAME, CUSTOMER_CREATION_DATE AS CREATED_ON, CUSTOMER_PHONE AS CONTACT_PHONE, CUSTOMER_EMAIL AS EMAIL_ID
FROM ONLINE_CUSTOMER
WHERE CUSTOMER_EMAIL LIKE ('%gmail%');

#QUESTION 6
#Q.no(06).Display the product Id, product description and total revenue for each product, if all the products are considered sold.
SELECT P.PRODUCT_ID, PRODUCT_DESC,(PRODUCT_PRICE*PRODUCT_QUANTITY) AS TOTAL_REVENUE 
FROM PRODUCT P, ORDER_ITEMS OI
WHERE P.PRODUCT_ID = OI.PRODUCT_ID;

#QUESTION 7
#Q.no(07).List the details of products with class code 2050 where price is in the range of 10000 and 30000 and available quantity is more than 15.
SELECT * FROM PRODUCT
WHERE PRODUCT_CLASS_CODE=2050 AND (PRODUCT_PRICE BETWEEN 10000 AND 30000) AND PRODUCT_QUANTITY_AVAIL>15;

#QUESTION 8
#Q.no(08).Display the distinct id’s of the products which have been sold.
SELECT DISTINCT(PRODUCT_ID)
FROM ORDER_ITEMS;

#QUESTION 9
#Q.no(09).Show order id, order_date and shipment dates of all shipped orders in an ascending order of customer ids and descending order of order dates.
SELECT CUSTOMER_ID, ORDER_DATE, ORDER_ID, ORDER_SHIPMENT_DATE FROM ORDER_HEADER
WHERE ORDER_STATUS='shipped'
ORDER BY CUSTOMER_ID, ORDER_DATE DESC;

#QUESTION 10
#Q.no(10).Show order id, order_date and shipment dates of all orders. For those orders which are yet to be shipped, show shipment date as 3 days from order date. (Use NULL related function).
SELECT ORDER_ID, ORDER_DATE, IFNULL(ORDER_SHIPMENT_DATE, DATE_ADD(order_date, INTERVAL 3 Day)) AS ORDER_SHIPMENT_DATE FROM ORDER_HEADER
WHERE ORDER_STATUS!='Cancelled';



