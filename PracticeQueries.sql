DROP TABLE CUSTOMER
CREATE TABLE CUSTOMER(ID INT, NAME VARCHAR(50), CITY VARCHAR(50),BookID INT)
INSERT INTO CUSTOMER
SELECT 1,'AAKAR','SEATTLE',10002
UNION ALL
SELECT 2, 'ANUJA','SUNNYVALE',10002
UNION ALL
SELECT 3, 'AAI','MUMBAI',10002
UNION ALL
SELECT 4, 'PAPPA','MUMBAI',10002
UNION ALL
SELECT 5, 'MANA','MUMBAI',10002
UNION ALL
SELECT 6,'APOORVA','SUNNYVALE',10003
UNION ALL
SELECT 7,'MITI','SUNNYVALE',10001
UNION ALL
SELECT 8,'SUMIT','BOSTON',10001

SELECT * FROM CUSTOMER


-- HERE IS A SIMPLE EXAMPLE OF HOW YOU CAN INSERT DATA INTO A TABLE
DROP TABLE BOOKMARKED
CREATE TABLE BOOKMARKED
(
BookID INT IDENTITY (10000,1) NOT NULL, 
BookName VARCHAR(50),
DolarPrice INT,
Author VARCHAR(50),
Distributor VARCHAR(50),
Publication VARCHAR(50),
Publication_No AS(Publication+RIGHT(CAST(BookID AS VARCHAR(10)),10)) -- HERE IS A SAMPLE OF HOW YOU CAN MERGE(CAST) TWO COLUMNS
)
INSERT INTO BOOKMARKED VALUES
('Harry Potter Part 1', 32, 'J.K.Rowling','Warner Bros','Wiley'),
('Harry Potter Part 2', 34, 'J.K.Rowling','Warner Bros','Wiley'),
('Harry Potter Part 3', 35, 'J.K.Rowling','Warner Bros','Wiley'),
('Harry Potter Part 4', 36, 'J.K.Rowling','Warner Bros','Wiley'),
('Harry Potter Part 5', 38, 'J.K.Rowling','Warner Bros','Wiley'),
('Harry Potter Part 6', 39, 'J.K.Rowling','Warner Bros','Wiley')

SELECT * FROM BOOKMARKED

DROP TABLE TPS
CREATE TABLE TPS
(
STUDENT_ID INT IDENTITY (001000,2) NOT NULL,
STUDENT_NAME VARCHAR(50),
MAJOR VARCHAR(50)
)
INSERT INTO TPS VALUES
('Aakar Kale','Information Technology'),
('Aakar Kale','Business Analysis'),
('Aakar Kale','Data Science'),
('Anuja Dawane','Cloud Computing'),
('Aakar Arun Kale','Machine Learning'),
('Aakar Arun Kale','Statistics'),
('Aakar Arun Kale','Big Data Technologies'),
('Aakar Arun Kale','SQL'),
('Aakar Arun Kale','Python'),
('Anuja Dawane','Java')

SELECT * FROM TPS