-- Drop database
DROP DATABASE IF EXISTS online_book_store;

-- Create database
CREATE DATABASE online_book_store;

-- Switch to the database
\c online_book_store;

-- Create tables
CREATE TABLE books(
Book_ID	INT PRIMARY KEY,
Title VARCHAR(100),
Author VARCHAR(100),
Genre VARCHAR(50),
Published_Year INT,
Price NUMERIC(10,2),
Stock INT
);

CREATE TABLE customers(
Customer_ID	INT PRIMARY KEY,
Name VARCHAR(100),
Email VARCHAR(100),
Phone INT,
City VARCHAR(100),
Country	VARCHAR(100)
);

CREATE TABLE orders(
Order_ID INT PRIMARY KEY,
Customer_ID	INT REFERENCES customers(Customer_ID),
Book_ID	INT REFERENCES books(Book_ID),
Order_Date DATE,
Quantity INT,
Total_Amount NUMERIC(10,2)
);

-- Import CSV files
COPY books
(Book_ID, Title, Author, Genre, Published_Year, Price, Stock)
FROM 'C:\temp\Books.csv'
DELIMITER ','
CSV HEADER;

COPY customers
(Customer_ID, Name, Email, Phone, City, Country)
FROM 'C:\temp\Customers.csv'
DELIMITER ','
CSV HEADER;

COPY orders
(Order_ID, Customer_ID, Book_ID, Order_Date, Quantity, Total_Amount)
FROM 'C:\temp\Orders.csv'
DELIMITER ','
CSV HEADER;


-- Retrieve all records of each table
SELECT * FROM books;
SELECT * FROM customers;
SELECT * FROM orders;


-- Basic Queries

--1. Retrieve all books in the "Fiction" genre
SELECT * FROM books
WHERE Genre = 'Fiction';

--2. Find books published after the year 1950
SELECT * FROM books 
WHERE Published_Year > 1950;

--3. List all customers from the Canada
SELECT * FROM customers
WHERE Country = 'Canada';

--4. Show orders placed in November 2023
SELECT * FROM orders
WHERE Order_Date BETWEEN '2023-11-01' AND '2023-11-30';

--5. Retrieve the total stock of books available
SELECT SUM(Stock) AS Total_Stock FROM books;

--6. Find the details of the most expensive book
SELECT * FROM books
ORDER BY Price DESC
LIMIT 1;

--7. Show all customers who ordered more than 1 quantity of a book
SELECT Customer_ID, Quantity FROM orders
WHERE Quantity > 1;

--8. Retrieve all orders where the total amount exceeds $20
SELECT * FROM orders 
WHERE Total_Amount > 20;

--9. List all genres available in the Books table
SELECT DISTINCT(genre) FROM books;

--10. Find the book with the lowest stock
SELECT * FROM books
ORDER BY Stock ASC
LIMIT 1;

--11. Calculate the total revenue generated from all orders
SELECT SUM(Total_Amount) AS Total_Revenue 
FROM orders;


-- Advance Queries

--1. Retrieve the total number of books sold for each genre
SELECT a.Genre, SUM(b.Quantity) AS total_books_sold
FROM books a
FULL JOIN orders b
ON a.Book_ID = b.Book_ID
GROUP BY a.Genre;

--2. Find the average price of books in the "Fantasy" genre
SELECT Genre, AVG(Price) AS avg_price
FROM books
WHERE Genre = 'Fantasy'
GROUP BY Genre;

--3. List customers who have placed at least 2 orders
SELECT Customer_ID, Quantity AS books_ordered
FROM orders
WHERE Quantity = 2
ORDER BY Customer_ID;

--4. Find the most frequently ordered book
SELECT Book_ID, Quantity AS order_frequency
FROM orders
ORDER BY Quantity DESC
LIMIT 1;

--5. Show the top 3 most expensive books of 'Fantasy' Genre
SELECT Title, Genre, Price
FROM books
WHERE Genre = 'Fantasy'
ORDER BY Price DESC
LIMIT 3;

--6. Retrieve the total quantity of books sold by each author
SELECT a.Author, SUM(b.Quantity) AS total_books_sold
FROM books a
FULL JOIN orders b
ON a.Book_ID = b.Book_ID
GROUP BY a.Author;

--7. List the cities where customers who spent over $30 are located
SELECT a.City, b.Total_Amount AS amount_spent
FROM customers a
FULL JOIN orders b
ON a.Customer_ID = b.Customer_ID
WHERE b.Total_Amount > 30.00;

--8. Find the custmer who spent the most on orders
SELECT Customer_ID, Total_Amount AS amount_spent
FROM orders 
ORDER BY Total_Amount DESC
LIMIT 1;

--9. Calculate the stock remaining after fulfilling all orders
SELECT ((SUM(a.Stock)) - (SUM(b.Quantity))) AS remaining_stock
FROM books a
FULL JOIN orders b
ON a.Book_ID = b.Book_ID;

