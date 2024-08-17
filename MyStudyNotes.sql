-- Active: 1723918815647@@127.0.0.1@3306

-- SQL Study Notes
-- SQL Basics Cheat Sheet Code

--Create a new SQL database
CREATE DATABASE harry_potter_books;
USE harry_potter_books;
--Create a new table
CREATE TABLE books (
    book_id INT,
    title VARCHAR(100),
    publication_date INT
);


--Inserting new values
INSERT INTO books 
VALUES
(101, "Harry Potter and the Sorcerer's Stone", 1997),
(102, "Harry Potter and the Chamber of Secrets", 1998),
(103, "Harry Potter and the Prisoner of Azkaban", 1999),
(104, "Harry Potter and the Goblet of Fire", 2000),
(105, "Harry Potter and the Order of the Phoenix", 2003),
(106, "Harry Potter and the Half-Blood Prince", 2005),
(107, "Harry Potter and the Deathly Hallows", 2007);

CREATE TABLE rating (
    user_id VARCHAR(1),
    book_id INT,
    ratings FLOAT);

INSERT INTO rating
VALUES 
("A", 101, 5.0),
("A", 102, 4.7),
("A", 103, 4.8),
("A", 104, 4.3),
("A", 105, 4.9),
("A", 106, 4.1),
("A", 107, 3.9),
("B", 101, 4.6),
("B", 102, 4.9),
("B", 103, 5.0),
("B", 104, 4.4),
("B", 105, 4.1),
("B", 106, 3.8),
("B", 107, 3.7);

--Update a value
UPDATE books
SET title = "Harry Potter and the Sorcerer\'s Stone"
WHERE publication_date = 1997;

-- delete a record
DELETE FROM books
WHERE book_id = 101;

-- get all columns from a table
SELECT *
FROM books;

--Get a one column from the table
SELECT title
FROM books;

--Get multiple column from table
SELECT title, publication_date
FROM books;

--Listing and grouping in ascending order
SELECT book_id, title
FROM books
ORDER BY publication_date ASC;

--Listing and grouping in descending order
SELECT book_id, title
FROM books
ORDER BY publication_date DESC;

--Filtering on numeric columns:
SELECT book_id
FROM rating 
WHERE ratings > 4.5;

SELECT book_id
FROM rating
WHERE ratings  BETWEEN 4.5 AND 5;

--Filtering on text columns:
SELECT book_id
FROM rating
WHERE user_id = 'A';

--Filtering on multiple columns:
SELECT *
FROM rating
WHERE user_id = 'A' AND ratings > 4.5;

--Filtering missing data:
SELECT *
FROM rating
WHERE ratings IS NULL;

--Group By
SELECT book_id, SUM(ratings)
FROM rating
GROUP BY book_id;

--ORDER BY
SELECT book_id, title
FROM books
ORDER BY title ASC;

--Returns rows that have matching entries from tables.
SELECT books.book_id, AVG(rating.ratings) AS total_rating
FROM books
INNER JOIN rating
   ON books.book_id = rating.book_id
GROUP BY books.book_id;


--Returns rows that have from left tables.
SELECT books.book_id AS book_id, books.title, rating.ratings AS book_rating
FROM books
LEFT JOIN rating
   ON books.book_id = rating.book_id;

--Returns rows that have from right tables.
SELECT books.book_id, books.title, rating.ratings
FROM books
RIGHT JOIN rating
   ON books.book_id = rating.book_id;

SELECT books.book_id 
FROM books
FULL JOIN rating
   ON books.book_id = rating.book_id;

--SUM() : Summuary of values.
SELECT rating.book_id, 
    SUM(rating.ratings) AS "Total Rating"
FROM rating
GROUP BY rating.book_id;


--AVG() : Average of values.
SELECT AVG(ratings)
FROM rating
GROUP BY book_id;

--MIN() : Minimım value.
SELECT MAX(ratings)
FROM rating;

--MAX() : Maximum value.
SELECT MIN(ratings)
FROM rating;

--COUNT(*): Count total number of rows.
SELECT COUNT(user_id) AS "Number of Rate"
FROM rating;

--COUNT(DISTINCT column): Count unique values.
SELECT COUNT(DISTINCT user_id) AS "Number of User"
FROM rating;

--UPPER()  : Converts all the letters in a given string to uppercase.
SELECT title, UPPER(title)
FROM books;

--LOWER() : Converts all the letters in a given string to lowercase.
SELECT title, LOWER(title)
FROM books; 

--LEN() : Count number of characters in a value.
SELECT LENGTH(title) AS "Title Length"
FROM books;

--TRIM() : Trim blank spaces in a value.
SELECT TRIM(title)  AS TitleTrim
FROM books;


--SUBSTRING(col,2,2) : To retrieve midsection of string.       
SELECT SUBSTRING(title, 1, 2) 
FROM books;

--CASE
SELECT ratings, book_id,
       CASE
           WHEN ratings > 4.7 THEN 'Best Seller'
           WHEN ratings = 4.7 THEN 'Popular'
           ELSE 'Fine'
       END AS BookRatings
FROM rating;

--Like
SELECT *
 FROM books
WHERE title LIKE 'H%';

--Union
SELECT title
 FROM books
WHERE book_id = 101
UNION 
SELECT ratings
FROM rating
WHERE book_id = 101;

--Intersect
SELECT title FROM books
WHERE book_id = 101
INTERSECT
SELECT ratings FROM rating
WHERE book_id = 101;