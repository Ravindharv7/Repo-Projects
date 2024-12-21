# Library Management System Project -PostgreSQL

## Project Overview

**Project Title**: Library Management System  
**Level**: Intermediate  
**Database**: `library_db`

This project demonstrates the implementation of a Library Management System using SQL. It includes creating and managing tables, performing CRUD operations, and executing advanced SQL queries. The goal is to showcase skills in database design, manipulation, and querying.

![Library_project](https://github.com/Ravindhar25/SQL-Library-Management-System-Project/blob/main/Library.jpg)

## Objectives

1. **Set up the Library Management System Database**: Create and populate the database with tables for branches, employees, members, books, issued status, and return status.
2. **CRUD Operations**: Perform Create, Read, Update, and Delete operations on the data.
3. **CTAS (Create Table As Select)**: Utilize CTAS to create new tables based on query results.
4. **Advanced SQL Queries**: Develop complex queries to analyze and retrieve specific data.

## Project Structure

### 1. Database Setup
![ERD](https://github.com/Ravindhar25/SQL-Library-Management-System-Project/blob/main/LMS_ERD.png)

- **Database Creation**: Created a database named `library_db`.
- **Table Creation**: Created tables for branches, employees, members, books, issued status, and return status. Each table includes relevant columns and relationships.
  
```sql
CREATE DATABASE LMSA_DB

-- Create table "tbl_books"

CREATE TABLE TBL_BOOKS
(
	isbn VARCHAR(50) PRIMARY KEY,
	book_title	VARCHAR(100),
	category	VARCHAR(25),
	rental_price	FLOAT,
	status	VARCHAR(10),
	author VARCHAR(50),
	publisher VARCHAR(50)
);

-- Create table "tbl_branch"

CREATE TABLE TBL_BRANCH
(
	branch_id VARCHAR(15) PRIMARY KEY,
	manager_id VARCHAR(15),
	branch_address VARCHAR(50),
	contact_no VARCHAR(40)
);

-- Create table "tbl_Employees"

CREATE TABLE TBL_EMPLOYEES
(
	emp_id	VARCHAR(15) PRIMARY KEY,
	emp_name VARCHAR(50),
	position VARCHAR(20),
	salary	INT,
	branch_id VARCHAR(15)
);

-- Create table "tbl_Members"

CREATE TABLE TBL_MEMBERS
(
	member_id VARCHAR(15) PRIMARY KEY,
	member_name	VARCHAR(50),
	member_address VARCHAR(50),
	reg_date DATE
);

-- Create table "tbl_Issued_Status"

CREATE TABLE TBL_ISSUED_STATUS
(
	issued_id	VARCHAR(15) PRIMARY KEY,
	issued_member_id VARCHAR(15),
	issued_book_name	VARCHAR(100),
	issued_date		DATE,
	issued_book_isbn	VARCHAR(50),
	issued_emp_id	VARCHAR(15)
);

-- Create table "tbl_Return_Status"

CREATE TABLE TBL_RETURN_STATUS
(
	return_id	VARCHAR(15) PRIMARY KEY,
	issued_id	VARCHAR(15),
	return_book_name VARCHAR(100),
	return_date		DATE,
	return_book_isbn VARCHAR(50)
);

```
### 2. CRUD Operations

- **Create**: Inserted sample records into the `books` table.
- **Read**: Retrieved and displayed data from various tables.
- **Update**: Updated records in the `employees` table.
- **Delete**: Removed records from the `members` table as needed.

**Task 1. Create a New Book Record**
-- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"

```sql

INSERT INTO TBL_BOOKS (ISBN, book_title,category,rental_price,status,author,publisher)
VALUES('978-1-60129-456-2', 
	   'To Kill a Mockingbird', 
	   'Classic',
	    6.00, 
		'yes', 
		'Harper Lee', 
		'J.B. Lippincott & Co.');

SELECT * FROM TBL_BOOKS
WHERE ISBN ='978-1-60129-456-2';
```

**Task 2: Update an Existing Member's Address**

```sql
UPDATE tbl_members
SET member_address = '125 Oak St'
WHERE member_id = 'C103';
```

**Task 3: Delete a Record from the Issued Status Table**

-- Objective: Delete the record with issued_id = 'IS121' from the issued_status table.

```sql
DELETE FROM tbl_issued_status
WHERE   issued_id =   'IS121';
```

**Task 4: Retrieve All Books Issued by a Specific Employee**
-- Objective: Select all books issued by the employee with emp_id = 'E101'.

```sql
SELECT * FROM tbl_issued_status
WHERE issued_emp_id = 'E101'
```

**Task 5: List Members Who Have Issued More Than One Book**
-- Objective: Use GROUP BY to find members who have issued more than one book.

```sql

SELECT 
	COUNT(*) CNT
FROM TBL_ISSUED_STATUS
GROUP BY issued_member_id
HAVING COUNT(*)>1;
```

### 3. CTAS (Create Table As Select)

**Task 6: Create Summary Tables**: Used CTAS to generate new tables based on query results - each book and total book_issued_cnt**

```sql

CREATE TABLE BOOK_ISSUED_CNT2
AS
SELECT 
	B.ISBN,
	B.BOOK_TITLE,
	COUNT(I.ISSUED_ID) CNT
FROM TBL_BOOKS B
JOIN TBL_ISSUED_STATUS I
ON B.ISBN = I.ISSUED_BOOK_ISBN
GROUP BY B.ISBN,
	B.BOOK_TITLE;

SELECT * FROM BOOK_ISSUED_CNT2;
```

### 4. Data Analysis & Findings

-- The following SQL queries were used to address specific questions:

Task 7. **Retrieve All Books in a Specific Category**:

```sql

SELECT 
	*
FROM TBL_BOOKS
WHERE category = 'Classic';
```

**Task 8: Find Total Rental Income by Category**:

```sql

SELECT
	B.category,
	SUM(B.rental_price) AS rental_income,
	COUNT(*) CNT
FROM TBL_BOOKS B
JOIN TBL_ISSUED_STATUS I
ON B.ISBN = I.ISSUED_BOOK_ISBN
GROUP BY B.category
ORDER BY SUM(B.rental_price) DESC;
```

**Task 9: List Members Who Registered in the Last 180 Days**:

```sql

SELECT
    *
FROM TBL_MEMBERS
WHERE reg_date >=CURRENT_DATE -iNTERVAL '180 DAYS';
```

**Task 10: List Employees with Their Branch Manager's Name and their branch details**:

```sql

SELECT 
    e1.emp_id,
    e1.emp_name,
    --e1.position,
    --e1.salary,
    b.manager_id,
	  b.branch_id,
    e2.emp_name as manager
FROM tbl_employees as e1
JOIN 
tbl_branch as b
ON e1.branch_id = b.branch_id    
JOIN
tbl_employees as e2
ON e2.emp_id = b.manager_id
```

**Task 11:Create a Table of Books with Rental Price Above a Certain Threshold**:

```sql

CREATE TABLE BOOK_NAME_HIGH_RENT AS
SELECT
	BOOK_TITLE,
	RENTAL_PRICE
FROM TBL_BOOKS
WHERE RENTAL_PRICE >7;

SELECT * FROM BOOK_NAME_HIGH_RENT;
```

**Task 12:Retrieve the List of Books Not Yet Returned**
```sql

SELECT 
	* 
FROM TBL_ISSUED_STATUS I
LEFT JOIN TBL_RETURN_STATUS R
ON I.issued_id =R.issued_id
WHERE return_id IS NULL
```

## Advanced SQL Operations

**Task 13: Identify Members with Overdue Books**  
-- Write a query to identify members who have overdue books (assume a 30-day return period). Display the member's_id, member's name, book title, issue date, and days overdue.

```sql

SELECT 
	M.MEMBER_ID,
	M.MEMBER_NAME,
	B.BOOK_TITLE,
	I.ISSUED_DATE,
	(CURRENT_DATE - I.ISSUED_DATE) AS DAYS_DUE
FROM TBL_ISSUED_STATUS I
JOIN TBL_MEMBERS M
ON  M.MEMBER_ID = I.ISSUED_MEMBER_ID 
JOIN TBL_BOOKS B
ON  I.ISSUED_BOOK_ISBN = B.ISBN
LEFT JOIN TBL_RETURN_STATUS R
ON R.ISSUED_ID = I.ISSUED_ID
WHERE R.RETURN_ID IS NULL
	AND 
	( CURRENT_DATE -I.ISSUED_DATE ) >30
ORDER BY M.MEMBER_ID;
```

**Task 14: Update Book Status on Return**  
-- Write a query to update the status of books in the books table to "Yes" when they are returned (based on entries in the return_status table).

```sql

CREATE OR REPLACE PROCEDURE ADD_RETURN_DATA(p_return_id VARCHAR(20), p_issued_id VARCHAR(20))
LANGUAGE plpgsql
AS $$

DECLARE
	V_ISBN VARCHAR(50);
	V_BOOK_TITLE VARCHAR(75);
	
BEGIN

	INSERT INTO TBL_RETURN_STATUS (return_id, issued_id,RETURN_DATE)
	VALUES (p_return_id, p_issued_id,CURRENT_DATE);

	SELECT
		ISSUED_BOOK_ISBN,
		ISSUED_BOOK_NAME
		INTO
		V_ISBN,
		V_BOOK_TITLE
	FROM TBL_ISSUED_STATUS
	WHERE ISSUED_ID = p_issued_id;
	
	UPDATE TBL_BOOKS
	SET STATUS = 'YES'
	WHERE ISBN = V_ISBN;

	RAISE NOTICE 'THANKS, YOUR RETURN BOOK HAS BEEN UPDATED % ',V_BOOK_TITLE;

END;
$$

-- calling function 

CALL add_return_data('RS145', 'IS134');
```

**Task 15: Branch Performance Report**  
-- Create a query that generates a performance report for each branch, showing the number of books issued, the number of books returned, and the total revenue generated from book rentals.

```sql

CREATE TABLE CTBL_BRANCH_REPORTS
AS
SELECT
	B.BRANCH_ID,
	E.EMP_ID,
	COUNT(I.ISSUED_ID) CNT_ISSUED_BOOK,
	COUNT(R.RETURN_ID) CNT_RETURN_BOOK,
	SUM(BK.RENTAL_PRICE) REVENUE
FROM TBL_ISSUED_STATUS I
JOIN TBL_EMPLOYEES E
ON I.ISSUED_EMP_ID = E.EMP_ID
JOIN TBL_BRANCH B
ON B.BRANCH_ID = E.BRANCH_ID
LEFT JOIN TBL_RETURN_STATUS R
ON R.ISSUED_ID = I.ISSUED_ID
JOIN TBL_BOOKS BK
ON BK.ISBN = I.ISSUED_BOOK_ISBN
GROUP BY B.BRANCH_ID,
		E.EMP_ID
ORDER BY 	SUM(BK.RENTAL_PRICE) DESC;

SELECT * FROM CTBL_BRANCH_REPORTS;
```


**Task 16: CTAS: Create a Table of Active Members**  
-- Use the CREATE TABLE AS (CTAS) statement to create a new table active_members containing members who have issued at least one book in the last 2 months.

```sql

CREATE TABLE TBL_ACTIVE_MEMBERS
AS
SELECT
	*
FROM TBL_MEMBERS
WHERE MEMBER_ID IN
(
SELECT
	DISTINCT ISSUED_MEMBER_ID
FROM TBL_ISSUED_STATUS
WHERE ISSUED_DATE >= (CURRENT_DATE- INTERVAL '2 MONTHS')
) ;
```

**Task 17: Find Employees with the Most Book Issues Processed**  
-- Write a query to find the top 3 employees who have processed the most book issues. Display the employee name, number of books processed, and their branch.

```sql

-- TO ACHIEVE WITH CTE

WITH EMPLOYEES AS 
(
SELECT 
	E.emp_name,
	B.BRANCH_ID,
	COUNT(I.ISSUED_ID) CNT_ISSUED_BOOK,
	RANK() OVER(ORDER BY COUNT(I.ISSUED_ID) DESC) RNK
FROM TBL_EMPLOYEES E
JOIN TBL_ISSUED_STATUS I
ON E.emp_id = I.issued_emp_id
JOIN TBL_BRANCH B
ON E.branch_id = B.branch_id
GROUP BY E.emp_name,
		B.BRANCH_ID
)

SELECT 
	*
FROM EMPLOYEES
ORDER BY CNT_ISSUED_BOOK DESC
LIMIT 3;
```

**Task 18: Identify Members Issuing High-Risk Books**  
-- Write a query to identify members who have issued books more than twice with the status "damaged" in the books table. Display the member name, book title, and the number of times they've issued damaged books.    

```sql

SELECT
	*,
	CASE 
		WHEN CNT >1 THEN 'DEMAGED'
		ELSE 'GOOD'
		END AS STATUS
FROM
(
SELECT
	M.MEMBER_ID,
	M.MEMBER_NAME,
	I.issued_book_name,
	COUNT(I.ISSUED_ID) CNT
FROM TBL_MEMBERS M
JOIN TBL_ISSUED_STATUS I
ON M.MEMBER_ID = I.ISSUED_MEMBER_ID
GROUP BY 	
 	M.MEMBER_ID,
	M.MEMBER_NAME,
	I.issued_book_name
HAVING 	COUNT(I.ISSUED_ID) >1
)T 
```

**Task 19: Stored Procedure**
```sql

Objective:

--Create a stored procedure to manage the status of books in a library system.

Description:

--Write a stored procedure that updates the status of a book in the library based on its issuance. The procedure should function as follows:
--The stored procedure should take the book_id as an input parameter.
--The procedure should first check if the book is available (status = 'yes').
--If the book is available, it should be issued, and the status in the books table should be updated to 'no'.
--If the book is not available (status = 'no'), the procedure should return an error message indicating that the book is currently not available.


CREATE OR REPLACE PROCEDURE sp_ISSUED_BOOK
	(p_ISSUED_ID VARCHAR(15),
	p_ISSUED_MEMBER_ID VARCHAR(15),
	p_ISSUED_BOOK_ISBN VARCHAR(50),
	--p_ISSUED_BOOK_NAME VARCHAR(50),
	p_ISSUED_EMP_ID VARCHAR(15))

LANGUAGE plpgsql

AS $$

	DECLARE V_STATUS VARCHAR(10);

BEGIN

	SELECT
		STATUS
		INTO 
		V_STATUS
	FROM TBL_BOOKS
	WHERE ISBN = p_ISSUED_BOOK_ISBN;

	IF V_STATUS ='YES' THEN
	
	INSERT INTO TBL_ISSUED_STATUS
				   (
				    ISSUED_ID,
					ISSUED_MEMBER_ID, 
					ISSUED_BOOK_ISBN,
					--issued_book_name,
					ISSUED_EMP_ID
					)
	       VALUES (
				    p_ISSUED_ID,
					p_ISSUED_MEMBER_ID, 
					p_ISSUED_BOOK_ISBN,
					--p_ISSUED_BOOK_NAME,
					p_ISSUED_EMP_ID
					);

					UPDATE TBL_BOOKS
					SET STATUS ='NO'
					WHERE ISBN = p_ISSUED_BOOK_ISBN;


		 -- Provide feedback on successful issuance
        RAISE NOTICE 'Book records added successfully for book ISBN: %', p_ISSUED_BOOK_ISBN;
   ELSE
        -- Notify that the book is unavailable
        RAISE NOTICE 'Sorry to inform you the book you have requested is unavailable. Book ISBN: %', p_ISSUED_BOOK_ISBN;
    
END IF;
END;
$$

-- Testing The function
SELECT * FROM books;
-- "978-0-553-29698-2" -- yes
-- "978-0-375-41398-8" -- no
SELECT * FROM issued_status;

CALL issue_book('IS155', 'C108', '978-0-553-29698-2', 'E104');
CALL issue_book('IS156', 'C108', '978-0-375-41398-8', 'E104');

SELECT * FROM books
WHERE isbn = '978-0-375-41398-8'
```

**Task 20: Create Table As Select (CTAS)**
```sql

--Objective: Create a CTAS (Create Table As Select) query to identify overdue books and calculate fines.

Description:

--Write a CTAS query to create a new table that lists each member and the books they have issued but not returned within 30 days. The table should include:
--The number of overdue books.
--The total fines, with each day's fine calculated at $0.50.
--The number of books issued by each member.
--The resulting table should show:
--Member ID
--Number of overdue books
--Total fines


CREATE TABLE CTAS_OVER_DUE_BOOK
AS
WITH DUE AS
(
    SELECT 
        M.member_id,
        I.issued_id,
        (CURRENT_DATE - I.issued_date) AS DUE_DAYS
    FROM TBL_ISSUED_STATUS I
    JOIN TBL_MEMBERS M ON M.member_id = I.issued_member_id
    LEFT JOIN TBL_RETURN_STATUS R ON R.ISSUED_ID = I.issued_id
    WHERE R.return_id IS NULL
      AND (CURRENT_DATE - I.issued_date) > 30
)
SELECT 
    DUE.member_id,
    COUNT(DUE.issued_id) AS num_overdue_books,
    SUM(DUE.DUE_DAYS * 0.50) AS total_fines,
    (SELECT COUNT(*) FROM TBL_ISSUED_STATUS I2 WHERE I2.issued_member_id = DUE.member_id) AS total_books_issued
FROM DUE
GROUP BY DUE.member_id;

SELECT * FROM CTAS_OVER_DUE_BOOK
```

## Reports

- **Database Schema**: Detailed table structures and relationships.
- **Data Analysis**: Insights into book categories, employee salaries, member registration trends, and issued books.
- **Summary Reports**: Aggregated data on high-demand books and employee performance.

## Conclusion

This project demonstrates the application of SQL skills in creating and managing a library management system. It includes database setup, data manipulation, and advanced querying, providing a solid foundation for data management and analysis.


