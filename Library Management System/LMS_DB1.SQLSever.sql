Use Projects

CREATE TABLE TBL_BOOKS
(
	isbn VARCHAR(50) PRIMARY KEY,
	book_title	VARCHAR(100),
	category	VARCHAR(25),
	rental_price	DECIMAL,
	status	VARCHAR(10),
	author VARCHAR(50),
	publisher VARCHAR(50)
);
DROP TABLE TBL_BOOKS;

SELECT * FROM TBL_BOOKS

CREATE TABLE TBL_BRANCH
(
	branch_id VARCHAR(15) PRIMARY KEY,
	manager_id VARCHAR(15),
	branch_address VARCHAR(50),
	contact_no VARCHAR(40)
);
SELECT * FROM TBL_BRANCH
DROP TABLE TBL_BRANCH

CREATE TABLE TBL_EMPLOYEES
(
	emp_id	VARCHAR(15) PRIMARY KEY,
	emp_name VARCHAR(50),
	position VARCHAR(20),
	salary	INT,
	branch_id VARCHAR(15)
);


SELECT * FROM TBL_EMPLOYEES

CREATE TABLE TBL_MEMBERS
(
	member_id VARCHAR(15) PRIMARY KEY,
	member_name	VARCHAR(50),
	member_address VARCHAR(50),
	reg_date DATE
);

CREATE TABLE TBL_ISSUED_STATUS
(
	issued_id	VARCHAR(15) PRIMARY KEY,
	issued_member_id VARCHAR(15),
	issued_book_name	VARCHAR(100),
	issued_date		DATE,
	issued_book_isbn	VARCHAR(50),
	issued_emp_id	VARCHAR(15)
);

CREATE TABLE TBL_RETURN_STATUS
(
	return_id	VARCHAR(15) PRIMARY KEY,
	issued_id	VARCHAR(15),
	return_book_name VARCHAR(100),
	return_date		DATE,
	return_book_isbn VARCHAR(50)
);


SELECT * FROM TBL_BOOKS;
SELECT * FROM TBL_BRANCH;
SELECT * FROM TBL_EMPLOYEES
SELECT * FROM TBL_MEMBERS
SELECT * FROM TBL_ISSUED_STATUS
SELECT * FROM TBL_RETURN_STATUS




INSERT INTO TBL_RETURN_STATUS(return_id, issued_id, return_date) 
VALUES
('RS101', 'IS106', '2023-06-06'),
('RS102', 'IS106', '2023-06-07'),
('RS103', 'IS106', '2023-08-07'),
('RS104', 'IS106', '2024-05-01'),
('RS105', 'IS107', '2024-05-03'),
('RS106', 'IS108', '2024-05-05'),
('RS107', 'IS109', '2024-05-07'),
('RS108', 'IS110', '2024-05-09'),
('RS109', 'IS111', '2024-05-11'),
('RS110', 'IS112', '2024-05-13'),
('RS111', 'IS113', '2024-05-15'),
('RS112', 'IS114', '2024-05-17'),
('RS113', 'IS115', '2024-05-19'),
('RS114', 'IS116', '2024-05-21'),
('RS115', 'IS117', '2024-05-23'),
('RS116', 'IS118', '2024-05-25'),
('RS117', 'IS119', '2024-05-27'),
('RS118', 'IS120', '2024-05-29');

INSERT INTO TBL_MEMBERS(member_id, member_name, member_address, reg_date) 
VALUES
('C101', 'Alice Johnson', '123 Main St', '2021-05-15'),
('C102', 'Bob Smith', '456 Elm St', '2021-06-20'),
('C103', 'Carol Davis', '789 Oak St', '2021-07-10'),
('C104', 'Dave Wilson', '567 Pine St', '2021-08-05'),
('C105', 'Eve Brown', '890 Maple St', '2021-09-25'),
('C106', 'Frank Thomas', '234 Cedar St', '2021-10-15'),
('C107', 'Grace Taylor', '345 Walnut St', '2021-11-20'),
('C108', 'Henry Anderson', '456 Birch St', '2021-12-10'),
('C109', 'Ivy Martinez', '567 Oak St', '2022-01-05'),
('C110', 'Jack Wilson', '678 Pine St', '2022-02-25'),
('C118', 'Sam', '133 Pine St', '2024-06-01'),    
('C119', 'John', '143 Main St', '2024-05-01');
SELECT * FROM TBL_MEMBERS;


-- Insert values into each branch table
INSERT INTO TBL_branch(branch_id, manager_id, branch_address, contact_no) 
VALUES
('B001', 'E109', '123 Main St', '+919099988676'),
('B002', 'E109', '456 Elm St', '+919099988677'),
('B003', 'E109', '789 Oak St', '+919099988678'),
('B004', 'E110', '567 Pine St', '+919099988679'),
('B005', 'E110', '890 Maple St', '+919099988680');
SELECT * FROM TBL_branch;


-- Insert values into each employees table
INSERT INTO TBL_EMPLOYEES(emp_id, emp_name, position, salary, branch_id) 
VALUES
('E101', 'John Doe', 'Clerk', 60000.00, 'B001'),
('E102', 'Jane Smith', 'Clerk', 45000.00, 'B002'),
('E103', 'Mike Johnson', 'Librarian', 55000.00, 'B001'),
('E104', 'Emily Davis', 'Assistant', 40000.00, 'B001'),
('E105', 'Sarah Brown', 'Assistant', 42000.00, 'B001'),
('E106', 'Michelle Ramirez', 'Assistant', 43000.00, 'B001'),
('E107', 'Michael Thompson', 'Clerk', 62000.00, 'B005'),
('E108', 'Jessica Taylor', 'Clerk', 46000.00, 'B004'),
('E109', 'Daniel Anderson', 'Manager', 57000.00, 'B003'),
('E110', 'Laura Martinez', 'Manager', 41000.00, 'B005'),
('E111', 'Christopher Lee', 'Assistant', 65000.00, 'B005');
SELECT * FROM TBL_EMPLOYEES;


-- Inserting into books table 
INSERT INTO TBL_books(isbn, book_title, category, rental_price, status, author, publisher) 
VALUES
('978-0-553-29698-2', 'The Catcher in the Rye', 'Classic', 7.00, 'yes', 'J.D. Salinger', 'Little, Brown and Company'),
('978-0-330-25864-8', 'Animal Farm', 'Classic', 5.50, 'yes', 'George Orwell', 'Penguin Books'),
('978-0-14-118776-1', 'One Hundred Years of Solitude', 'Literary Fiction', 6.50, 'yes', 'Gabriel Garcia Marquez', 'Penguin Books'),
('978-0-525-47535-5', 'The Great Gatsby', 'Classic', 8.00, 'yes', 'F. Scott Fitzgerald', 'Scribner'),
('978-0-141-44171-6', 'Jane Eyre', 'Classic', 4.00, 'yes', 'Charlotte Bronte', 'Penguin Classics'),
('978-0-307-37840-1', 'The Alchemist', 'Fiction', 2.50, 'yes', 'Paulo Coelho', 'HarperOne'),
('978-0-679-76489-8', 'Harry Potter and the Sorcerers Stone', 'Fantasy', 7.00, 'yes', 'J.K. Rowling', 'Scholastic'),
('978-0-7432-4722-4', 'The Da Vinci Code', 'Mystery', 8.00, 'yes', 'Dan Brown', 'Doubleday'),
('978-0-09-957807-9', 'A Game of Thrones', 'Fantasy', 7.50, 'yes', 'George R.R. Martin', 'Bantam'),
('978-0-393-05081-8', 'A Peoples History of the United States', 'History', 9.00, 'yes', 'Howard Zinn', 'Harper Perennial'),
('978-0-19-280551-1', 'The Guns of August', 'History', 7.00, 'yes', 'Barbara W. Tuchman', 'Oxford University Press'),
('978-0-307-58837-1', 'Sapiens: A Brief History of Humankind', 'History', 8.00, 'no', 'Yuval Noah Harari', 'Harper Perennial'),
('978-0-375-41398-8', 'The Diary of a Young Girl', 'History', 6.50, 'no', 'Anne Frank', 'Bantam'),
('978-0-14-044930-3', 'The Histories', 'History', 5.50, 'yes', 'Herodotus', 'Penguin Classics'),
('978-0-393-91257-8', 'Guns, Germs, and Steel: The Fates of Human Societies', 'History', 7.00, 'yes', 'Jared Diamond', 'W. W. Norton & Company'),
('978-0-7432-7357-1', '1491: New Revelations of the Americas Before Columbus', 'History', 6.50, 'no', 'Charles C. Mann', 'Vintage Books'),
('978-0-679-64115-3', '1984', 'Dystopian', 6.50, 'yes', 'George Orwell', 'Penguin Books'),
('978-0-14-143951-8', 'Pride and Prejudice', 'Classic', 5.00, 'yes', 'Jane Austen', 'Penguin Classics'),
('978-0-452-28240-7', 'Brave New World', 'Dystopian', 6.50, 'yes', 'Aldous Huxley', 'Harper Perennial'),
('978-0-670-81302-4', 'The Road', 'Dystopian', 7.00, 'yes', 'Cormac McCarthy', 'Knopf'),
('978-0-385-33312-0', 'The Shining', 'Horror', 6.00, 'yes', 'Stephen King', 'Doubleday'),
('978-0-451-52993-5', 'Fahrenheit 451', 'Dystopian', 5.50, 'yes', 'Ray Bradbury', 'Ballantine Books'),
('978-0-345-39180-3', 'Dune', 'Science Fiction', 8.50, 'yes', 'Frank Herbert', 'Ace'),
('978-0-375-50167-0', 'The Road', 'Dystopian', 7.00, 'yes', 'Cormac McCarthy', 'Vintage'),
('978-0-06-025492-6', 'Where the Wild Things Are', 'Children', 3.50, 'yes', 'Maurice Sendak', 'HarperCollins'),
('978-0-06-112241-5', 'The Kite Runner', 'Fiction', 5.50, 'yes', 'Khaled Hosseini', 'Riverhead Books'),
('978-0-06-440055-8', 'Charlotte''s Web', 'Children', 4.00, 'yes', 'E.B. White', 'Harper & Row'),
('978-0-679-77644-3', 'Beloved', 'Fiction', 6.50, 'yes', 'Toni Morrison', 'Knopf'),
('978-0-14-027526-3', 'A Tale of Two Cities', 'Classic', 4.50, 'yes', 'Charles Dickens', 'Penguin Books'),
('978-0-7434-7679-3', 'The Stand', 'Horror', 7.00, 'yes', 'Stephen King', 'Doubleday'),
('978-0-451-52994-2', 'Moby Dick', 'Classic', 6.50, 'yes', 'Herman Melville', 'Penguin Books'),
('978-0-06-112008-4', 'To Kill a Mockingbird', 'Classic', 5.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.'),
('978-0-553-57340-1', '1984', 'Dystopian', 6.50, 'yes', 'George Orwell', 'Penguin Books'),
('978-0-7432-4722-5', 'Angels & Demons', 'Mystery', 7.50, 'yes', 'Dan Brown', 'Doubleday'),
('978-0-7432-7356-4', 'The Hobbit', 'Fantasy', 7.00, 'yes', 'J.R.R. Tolkien', 'Houghton Mifflin Harcourt');


-- inserting into issued table
INSERT INTO TBL_ISSUED_STATUS(issued_id, issued_member_id, issued_book_name, issued_date, issued_book_isbn, issued_emp_id) 
VALUES
('IS106', 'C106', 'Animal Farm', '2024-03-10', '978-0-330-25864-8', 'E104'),
('IS107', 'C107', 'One Hundred Years of Solitude', '2024-03-11', '978-0-14-118776-1', 'E104'),
('IS108', 'C108', 'The Great Gatsby', '2024-03-12', '978-0-525-47535-5', 'E104'),
('IS109', 'C109', 'Jane Eyre', '2024-03-13', '978-0-141-44171-6', 'E105'),
('IS110', 'C110', 'The Alchemist', '2024-03-14', '978-0-307-37840-1', 'E105'),
('IS111', 'C109', 'Harry Potter and the Sorcerers Stone', '2024-03-15', '978-0-679-76489-8', 'E105'),
('IS112', 'C109', 'A Game of Thrones', '2024-03-16', '978-0-09-957807-9', 'E106'),
('IS113', 'C109', 'A Peoples History of the United States', '2024-03-17', '978-0-393-05081-8', 'E106'),
('IS114', 'C109', 'The Guns of August', '2024-03-18', '978-0-19-280551-1', 'E106'),
('IS115', 'C109', 'The Histories', '2024-03-19', '978-0-14-044930-3', 'E107'),
('IS116', 'C110', 'Guns, Germs, and Steel: The Fates of Human Societies', '2024-03-20', '978-0-393-91257-8', 'E107'),
('IS117', 'C110', '1984', '2024-03-21', '978-0-679-64115-3', 'E107'),
('IS118', 'C101', 'Pride and Prejudice', '2024-03-22', '978-0-14-143951-8', 'E108'),
('IS119', 'C110', 'Brave New World', '2024-03-23', '978-0-452-28240-7', 'E108'),
('IS120', 'C110', 'The Road', '2024-03-24', '978-0-670-81302-4', 'E108'),
('IS121', 'C102', 'The Shining', '2024-03-25', '978-0-385-33312-0', 'E109'),
('IS122', 'C102', 'Fahrenheit 451', '2024-03-26', '978-0-451-52993-5', 'E109'),
('IS123', 'C103', 'Dune', '2024-03-27', '978-0-345-39180-3', 'E109'),
('IS124', 'C104', 'Where the Wild Things Are', '2024-03-28', '978-0-06-025492-6', 'E110'),
('IS125', 'C105', 'The Kite Runner', '2024-03-29', '978-0-06-112241-5', 'E110'),
('IS126', 'C105', 'Charlotte''s Web', '2024-03-30', '978-0-06-440055-8', 'E110'),
('IS127', 'C105', 'Beloved', '2024-03-31', '978-0-679-77644-3', 'E110'),
('IS128', 'C105', 'A Tale of Two Cities', '2024-04-01', '978-0-14-027526-3', 'E110'),
('IS129', 'C105', 'The Stand', '2024-04-02', '978-0-7434-7679-3', 'E110'),
('IS130', 'C106', 'Moby Dick', '2024-04-03', '978-0-451-52994-2', 'E101'),
('IS131', 'C106', 'To Kill a Mockingbird', '2024-04-04', '978-0-06-112008-4', 'E101'),
('IS132', 'C106', 'The Hobbit', '2024-04-05', '978-0-7432-7356-4', 'E106'),
('IS133', 'C107', 'Angels & Demons', '2024-04-06', '978-0-7432-4722-5', 'E106'),
('IS134', 'C107', 'The Diary of a Young Girl', '2024-04-07', '978-0-375-41398-8', 'E106'),
('IS135', 'C107', 'Sapiens: A Brief History of Humankind', '2024-04-08', '978-0-307-58837-1', 'E108'),
('IS136', 'C107', '1491: New Revelations of the Americas Before Columbus', '2024-04-09', '978-0-7432-7357-1', 'E102'),
('IS137', 'C107', 'The Catcher in the Rye', '2024-04-10', '978-0-553-29698-2', 'E103'),
('IS138', 'C108', 'The Great Gatsby', '2024-04-11', '978-0-525-47535-5', 'E104'),
('IS139', 'C109', 'Harry Potter and the Sorcerers Stone', '2024-04-12', '978-0-679-76489-8', 'E105'),
('IS140', 'C110', 'Animal Farm', '2024-04-13', '978-0-330-25864-8', 'E102');

ALTER TABLE TBL_EMPLOYEES
ADD CONSTRAINT FK_TBL_EMPLOYEES_BRANCH_ID
FOREIGN KEY (BRANCH_ID) REFERENCES TBL_BRANCH(BRANCH_ID)

ALTER TABLE TBL_ISSUED_STATUS
ADD CONSTRAINT FK_TBL_ISSUED_STATUS_ISSUED_MEMBER_ID
FOREIGN KEY (ISSUED_MEMBER_ID) REFERENCES TBL_MEMBERS(MEMBER_ID)

ALTER TABLE TBL_ISSUED_STATUS
ADD CONSTRAINT FK_TBL_ISSUED_STATUS_ISSUED_EMP_ID
FOREIGN KEY (ISSUED_EMP_ID) REFERENCES TBL_EMPLOYEES(EMP_ID)


ALTER TABLE TBL_ISSUED_STATUS
ADD CONSTRAINT FK_TBL_ISSUED_STATUS_ISBN
FOREIGN KEY (ISSUED_BOOK_ISBN) REFERENCES TBL_BOOKS(ISBN)


ALTER TABLE TBL_RETURN_STATUS
ADD CONSTRAINT FK_TBL_RETURN_STATUS_ISSUED_ID
FOREIGN KEY (ISSUED_ID) REFERENCES TBL_ISSUED_STATUS(ISSUED_ID)


ALTER TABLE TBL_RETURN_STATUS
ADD CONSTRAINT FK_TBL_RETURN_STATUS_RETURN_BOOK_ISBN
FOREIGN KEY (RETURN_BOOK_ISBN) REFERENCES TBL_BOOKS(ISBN)



SELECT * FROM TBL_BOOKS;
SELECT * FROM TBL_BRANCH;
SELECT * FROM TBL_EMPLOYEES
SELECT * FROM TBL_MEMBERS
SELECT * FROM TBL_ISSUED_STATUS
SELECT * FROM TBL_RETURN_STATUS

SELECT COUNT(*) FROM TBL_BOOKS;


-- **Task 1. Create a New Book Record**
-- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"


INSERT INTO TBL_BOOKS (ISBN, book_title, category,	rental_price,status,author,	publisher)
VALUES('978-1-60129-456-2', 
	   'To Kill a Mockingbird', 
	   'Classic',
	    6.00, 
		'yes', 
		'Harper Lee', 
		'J.B. Lippincott & Co.');

SELECT * FROM TBL_BOOKS
WHERE ISBN = '978-1-60129-456-2';

-- **Task 2: Update an Existing Member's Address**
 -- '125 Oak St' WHERE member_id = 'C103'

 SELECT * FROM TBL_MEMBERS
 WHERE member_address = '125 Oak St'

 UPDATE TBL_MEMBERS
 SET member_address = '125 Oak St'
 WHERE member_id = 'C103';

 
-- **Task 3: Delete a Record from the Issued Status Table**
-- Objective: Delete the record with issued_id = 'IS121' from the issued_status table.

SELECT * FROM TBL_ISSUED_STATUS
WHERE issued_id = 'IS121';

DELETE FROM TBL_ISSUED_STATUS
WHERE issued_id = 'IS121';


-- **Task 4: Retrieve All Books Issued by a Specific Employee**
-- Objective: Select all books issued by the employee with emp_id = 'E101'.

SELECT * FROM TBL_ISSUED_STATUS
WHERE ISSUED_EMP_ID = 'E101'

-- **Task 5: List Members Who Have Issued More Than One Book**
-- Objective: Use GROUP BY to find members who have issued more than one book.

SELECT 
	COUNT(*) CNT
FROM TBL_ISSUED_STATUS
GROUP BY issued_member_id
HAVING COUNT(*)>1
ORDER BY COUNT(*) DESC;

-- ### 3. CTAS (Create Table As Select)

-- **Task 6: Create Summary Tables**: Used CTAS to generate new tables based on query results - each book and total book_issued_cnt**

SELECT
	ISSUED_BOOK_NAME,
	COUNT(ISSUED_BOOK_ISBN) CNT
INTO BOOK_ISSUED_CNT
FROM TBL_ISSUED_STATUS
GROUP BY 	ISSUED_BOOK_NAME,
ISSUED_BOOK_ISBN;

SELECT * FROM BOOK_ISSUED_CNT;


SELECT 
	B.ISBN,
	B.BOOK_TITLE,
	COUNT(I.ISSUED_ID) CNT
INTO BOOK_ISSUED_CNT1
FROM TBL_BOOKS B
JOIN TBL_ISSUED_STATUS I
ON B.ISBN = I.ISSUED_BOOK_ISBN
GROUP BY B.ISBN,
	B.BOOK_TITLE;

SELECT * FROM BOOK_ISSUED_CNT1;


-- ### 4. Data Analysis & Findings

-- The following SQL queries were used to address specific questions:

-- Task 7. **Retrieve All Books in a Specific Category**:'CLASSIC'

SELECT 
	*
FROM TBL_BOOKS
WHERE CATEGORY = 'CLASSIC';



--  **Task 8: Find Total Rental Income by Category**:

SELECT
	B.category,
	SUM(B.rental_price) INCOME,
	COUNT(*) CNT
FROM TBL_BOOKS B
JOIN TBL_ISSUED_STATUS I
ON B.ISBN = I.ISSUED_BOOK_ISBN
GROUP BY B.category
ORDER BY SUM(B.rental_price) DESC;


-- **List Members Who Registered in the Last 180 Days**:

SELECT * FROM TBL_MEMBERS
WHERE reg_date >= DATEADD(DAY,-180,GETDATE()); 


-- 10. **List Employees with Their Branch Manager's Name and their branch details**:

--E1 TABLE - EMP
--E2 TABLE - MANAGER
--B TABLE - BRANCH



SELECT 
	E1.EMP_ID,
	E1.EMP_NAME AS EMPLOYEES_NAME,
	E2.EMP_NAME AS MANAGER_NAME,
	B.BRANCH_ID
FROM TBL_EMPLOYEES E1
JOIN TBL_BRANCH B
ON E1.BRANCH_ID = B. BRANCH_ID
JOIN TBL_EMPLOYEES E2
ON E2.EMP_ID = B.MANAGER_ID;


--  11. Create a Table of Books with Rental Price Above a Certain Threshold (7):


SELECT
	BOOK_TITLE,
	RENTAL_PRICE
INTO BOOK_NAME_HIGH_RENT
FROM TBL_BOOKS
WHERE RENTAL_PRICE >7;

SELECT * FROM BOOK_NAME_HIGH_RENT
DROP TABLE BOOK_NAME_HIGH_RENT

-- 12: **Retrieve the List of Books Not Yet Returned**

SELECT 
	* 
FROM TBL_ISSUED_STATUS I
LEFT JOIN TBL_RETURN_STATUS IR
ON I.issued_id =IR.issued_id
WHERE return_id IS NULL


-- 13: Identify Members with Overdue Books**  
-- Write a query to identify members who have overdue books (assume a 30-day return period). 
-- Display the member 's_id', member's name, book title, issue date, and days overdue.


SELECT 
	M.member_id,
	M.member_name,
	I.issued_id,
	B.ISBN,
	DATEDIFF(DAY,I.issued_date,GETDATE()) DUE_DAYS
FROM TBL_ISSUED_STATUS I
JOIN TBL_MEMBERS M
ON M.member_id = I.issued_member_id
JOIN TBL_BOOKS B
ON B.ISBN = I.issued_book_isbn
LEFT JOIN TBL_RETURN_STATUS R
ON R.ISSUED_ID = I.issued_id
WHERE R.return_id IS NULL
AND DATEDIFF(DAY,I.issued_date,GETDATE())  >30

-- Write a query to update the status of books in the books table to "Yes" when they are returned 
-- (based on entries in the return_status table).


CREATE OR ALTER PROCEDURE sp_ADD_RETURN_DATA
    @RETURN_ID VARCHAR(15), 
    @ISSUED_ID VARCHAR(15)
AS
BEGIN
    DECLARE 
        @ISBN VARCHAR(50),
        @BOOK_TITLE VARCHAR(100);

    -- Insert return data into TBL_RETURN_STATUS
    INSERT INTO TBL_RETURN_STATUS (RETURN_ID, ISSUED_ID, RETURN_DATE)
    VALUES (@RETURN_ID, @ISSUED_ID, GETDATE());

    -- Assign ISBN and book title from TBL_ISSUED_STATUS to variables
    SELECT
        @ISBN = ISSUED_BOOK_ISBN,
        @BOOK_TITLE = ISSUED_BOOK_NAME
    FROM TBL_ISSUED_STATUS
    WHERE ISSUED_ID = @ISSUED_ID;

    -- Update book status in TBL_BOOKS
    UPDATE TBL_BOOKS
    SET STATUS = 'YES'
    WHERE ISBN = @ISBN;

    -- Print a notice
    PRINT 'THANKS, RETURN BOOK NAME UPDATED: ' + @BOOK_TITLE;
END;

SELECT * FROM TBL_BOOKS


SELECT * FROM TBL_BOOKS
WHERE STATUS ='';

SELECT * FROM TBL_ISSUED_STATUS
WHERE ISSUED_BOOK_ISBN = '978-0-375-41398-8';

SELECT * FROM TBL_RETURN_STATUS
WHERE ISSUED_ID ='IS134'

EXEC sp_ADD_RETURN_DATA @RETURN_ID ='RS145', @ISSUED_ID ='IS134'


CREATE OR ALTER PROC sp_ADD_BOOK_IN
@RETURN_ID VARCHAR(50),
@ISSUED_ID VARCHAR(100)

AS
	DECLARE 
		@ISBN VARCHAR(50),
		@BOOK_TITLE VARCHAR(100);

BEGIN
		INSERT INTO TBL_RETURN_STATUS (return_id,issued_id,return_date)
		VALUES(@RETURN_ID,@ISSUED_ID,GETDATE());
		
		SELECT
			@ISBN=issued_book_isbn,
			@BOOK_TITLE=issued_book_name
		FROM TBL_ISSUED_STATUS
		WHERE ISSUED_ID = @ISSUED_ID;

		UPDATE TBL_BOOKS
		SET STATUS ='YES'
		WHERE ISBN = @ISBN

		PRINT 'THANKS, RETRUN BOOK NAME HAS BEEN UPDATED: ' + @BOOK_TITLE;
		
		END;


SELECT * FROM TBL_BOOKS


-- **Task 15: Branch Performance Report**  
-- Create a query that generates a performance report for each branch, showing the number of books issued, the number of books returned, and the total revenue generated from book rentals.


SELECT
	B.BRANCH_ID,
	E.EMP_ID,
	COUNT(I.ISSUED_ID) CNT_ISSUED_BOOK,
	COUNT(R.RETURN_ID) CNT_RETURN_BOOK,
	SUM(BK.RENTAL_PRICE) REVENUE
	INTO BRANCH_REPORTS
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

SELECT * FROM BRANCH_REPORTS;


-- **Task 16: CTAS: Create a Table of Active Members**  
-- Use the CREATE TABLE AS (CTAS) statement to create a new table active_members containing members 
-- who have issued at least one book in the last 2 months.


SELECT
	*
INTO CTBL_ACTIVE_MEMBERS
FROM TBL_MEMBERS
WHERE MEMBER_ID IN
(
SELECT
	DISTINCT ISSUED_MEMBER_ID
FROM TBL_ISSUED_STATUS
WHERE ISSUED_DATE >= DATEADD(MONTH,-2,GETDATE())
) ;

SELECT * FROM CTBL_ACTIVE_MEMBER

SELECT *
INTO CTBL_ACTIVE_MEMBER
FROM TBL_MEMBERS M
WHERE EXISTS (
    SELECT 1
    FROM TBL_ISSUED_STATUS I
    WHERE I.ISSUED_MEMBER_ID = M.MEMBER_ID
    AND I.ISSUED_DATE >= DATEADD(MONTH, -2, GETDATE())
);

-- **Task 17: Find Employees with the Most Book Issues Processed**  
-- Write a query to find the top 3 employees who have processed the most book issues.
-- Display the employee name, number of books processed, and their branch.

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
SELECT TOP 3 *
FROM EMPLOYEES T
WHERE T.RNK <4

-- TO ACHIEVE BY USING CTAS

SELECT 
	E.emp_name,
	B.BRANCH_ID,
	COUNT(I.ISSUED_ID) CNT_ISSUED_BOOK,
	RANK() OVER(ORDER BY COUNT(I.ISSUED_ID) DESC) RNK
	INTO tbl_EMP_PEROFRMANCE
FROM TBL_EMPLOYEES E
JOIN TBL_ISSUED_STATUS I
ON E.emp_id = I.issued_emp_id
JOIN TBL_BRANCH B
ON E.branch_id = B.branch_id
GROUP BY E.emp_name,
		B.BRANCH_ID;

SELECT TOP 3
	* 
FROM tbl_EMP_PEROFRMANCE
WHERE RNK <4;

-- TO ACHIEVE BY SUBQUERY

SELECT TOP 3 
	* 
FROM 
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
)T
WHERE T.RNK<4




-- **Task 18: Identify Members Issuing High-Risk Books**  
-- Write a query to identify members who have issued books more than twice with the status "damaged" in the books table. 
-- Display the member name, book title, and the number of times they've issued damaged books.

SELECT * FROM TBL_ISSUED_STATUS

CREATE OR ALTER PROC sp_ISSUED_BOOK
	@ISSUED_ID VARCHAR(15),
	@ISSUED_MEMBER_ID VARCHAR(15),
	@ISSUED_BOOK_ISBN VARCHAR(50),
	--@ISSUED_BOOK_NAME VARCHAR(50),
	@ISSUED_EMP_ID VARCHAR(15)

AS
BEGIN
	DECLARE @STATUS VARCHAR(10);

	SELECT
		@STATUS =STATUS
	FROM TBL_BOOKS
	WHERE ISBN = @ISSUED_BOOK_ISBN;

	IF @STATUS ='YES' 
	BEGIN
	INSERT INTO TBL_ISSUED_STATUS
				   (
				    ISSUED_ID,
					ISSUED_MEMBER_ID, 
					ISSUED_BOOK_ISBN,
					--issued_book_name,
					ISSUED_EMP_ID
					)
	       VALUES (
				    @ISSUED_ID,
					@ISSUED_MEMBER_ID, 
					@ISSUED_BOOK_ISBN,
					--@ISSUED_BOOK_NAME,
					@ISSUED_EMP_ID
					);

					UPDATE TBL_BOOKS
					SET STATUS ='NO'
					WHERE ISBN = @ISSUED_BOOK_ISBN;


		 -- Provide feedback on successful issuance
        PRINT 'Book records added successfully for book ISBN: ' + @ISSUED_BOOK_ISBN;
    END
    ELSE
    BEGIN
        -- Notify that the book is unavailable
        PRINT 'Sorry to inform you the book you have requested is unavailable. Book ISBN: ' + @ISSUED_BOOK_ISBN;
    END
END;

-- Testing The function
SELECT * FROM TBL_books;
-- "978-0-553-29698-2" -- yes
-- "978-0-375-41398-8" -- no
SELECT * FROM TBL_ISSUED_STATUS;



EXEC sp_ISSUED_BOOK
@ISSUED_ID ='IS155', 
@ISSUED_MEMBER_ID ='C108',
@ISSUED_BOOK_ISBN = '978-0-553-29698-2',
@ISSUED_EMP_ID ='E104';

SELECT * FROM TBL_books
WHERE isbn = '978-0-553-29698-2'

select * from tbl_books
select 
	i.Issued_member_id, 
	b.book_title,
	count(i.issued_id) cnt
from tbl_issued_status i
join tbl_books b
on b.isbn = i.issued_book_isbn
group by i.Issued_member_id,
	b.book_title
having count(i.issued_id) <2


-- 18: Identify Members Issuing High-Risk Books**  
-- Write a query to identify members who have issued books more than twice with 
-- the status "damaged" in the books table. Display the member name, book title, and 
-- the number of times they've issued damaged books.   

--SELECT
--	*,
--	CASE 
--		WHEN CNT >1 THEN 'DEMAGED'
--		ELSE 'GOOD'
--		END AS STATUS
--FROM
WITH CTE_STATUS AS
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
) 
SELECT
	*,
	CASE 
		WHEN CNT >1 THEN 'DEMAGED'
		ELSE 'GOOD'
		END AS STATUS
FROM CTE_STATUS




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


--**Task 20: Create Table As Select (CTAS)**
--Objective: Create a CTAS (Create Table As Select) query to identify overdue books and calculate fines.

--Description: Write a CTAS query to create a new table that lists each member and the books they have issued but not returned within 30 days. The table should include:
  --  The number of overdue books.
  --  The total fines, with each day's fine calculated at $0.50.
  --  The number of books issued by each member.
  --  The resulting table should show:
  --  Member ID
  --  Number of overdue books
  --  Total fines


SELECT * FROM TBL_MEMBERS
SELECT * FROM TBL_ISSUED_STATUS


WITH DUE AS
(
    SELECT 
        M.member_id,
        I.issued_id,
        DATEDIFF(DAY, I.issued_date, GETDATE()) AS DUE_DAYS
    FROM TBL_ISSUED_STATUS I
    JOIN TBL_MEMBERS M ON M.member_id = I.issued_member_id
    LEFT JOIN TBL_RETURN_STATUS R ON R.ISSUED_ID = I.issued_id
    WHERE R.return_id IS NULL
      AND DATEDIFF(DAY, I.issued_date, GETDATE()) > 30
)
SELECT 
    DUE.member_id,
    COUNT(DUE.issued_id) AS num_overdue_books,
    SUM(DUE.DUE_DAYS * 0.50) AS total_fines,
    (SELECT COUNT(*) FROM TBL_ISSUED_STATUS I2 WHERE I2.issued_member_id = DUE.member_id) AS total_books_issued
	INTO CTAS_OVER_DUE_BOOK
FROM DUE
GROUP BY DUE.member_id;

SELECT * FROM CTAS_OVER_DUE_BOOK