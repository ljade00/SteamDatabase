-- Creates user table 
CREATE TABLE users (
username VARCHAR (20) PRIMARY KEY,
first_name VARCHAR (20),
last_name VARCHAR (20),
email VARCHAR (50) UNIQUE,
age INT (100)
);

-- Example insert data into the steam table
INSERT INTO steam (username, first_name, last_name, email, age)
VALUES
('Ademordna','Alexis', 'White', 'whitaj31@uwgb.edu', 23),
('evocator','Trenton', 'Weyland', 'weylt22@uwgb.edu', 19),
('BBRDGZ','Tyler', 'Terry', 'elvisAlvin@gmail.com', 31),
('MissMaehem', 'Leah', 'Terry', 'terryl@uwgb.edu', 31),
('lilibra', 'Daniel', 'Gray', 'dg12ny@gmail.com', 29); 

-- Retrieves all columns from the 'users' table in the 'Steam' schema 
SELECT * FROM Steam.users; 

-- Describe the structure of the 'users' table in the 'Steam' schema 
DESCRIBE users; 

-- Retrieve all columns from the 'Users' table where the 'username' is 'ademordna' 
SELECT * 
FROM Users 
WHERE username = 'ademordna'; 

-- Retrieves all columns from the 'Users' table where the 'username' is 'evocator' 
SELECT * 
FROM Users 
WHERE username = 'evocator'; 
  
-- Creates another user and inserts their information into the user table 
INSERT INTO users VALUES('MissMaehem', 'Leah', 'Terry', 'terryl@uwgb.edu', 31); 

-- Retrieves all columns from the 'Users' table where the 'username' is 'MissMaehem' 
SELECT * 
FROM Users 
WHERE username = 'MissMaehem'; 

-- Creates another user and inserts their information into the user table 
INSERT INTO users VALUES('lilibra', 'Daniel', 'Gray', 'dg12ny@gmail.com', 29); 

-- Retrieves all columns from the 'Users' table where the 'username' is 'lilibra' 
SELECT * 
FROM Users 
WHERE username = 'lilibra'; 

-- Creates another user and inserts their information into the user table 
INSERT INTO users VALUES('BBRDGZ', 'Tyler', 'Terry', 'elvisAlvin@gmail.com', 31); 

-- Retrieves all columns from the 'Users' table where the 'username' is 'BBRDGZ' 
SELECT * 
FROM Users 
WHERE username = 'BBRDGZ'; 

-- Retrieves all users from the 'users' table 
SELECT * FROM Steam.users; 

-- Retrieves only the 'username' and 'email' columns for all users 
SELECT username, email FROM Steam.users; 

