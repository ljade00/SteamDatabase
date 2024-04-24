-- Describes steam table
SHOW TABLES;
DESCRIBE steam;

-- Retrieves user information from username
SELECT *
FROM User 
WHERE username = 'Ademordna';

-- List games and their developers
SELECT information.name AS GameName, information.developer
FROM information;

-- Counts the number of games in each genre
SELECT genre, COUNT(*) AS GameCount
FROM steam
GROUP BY genre;

-- Retrieves games released after a certain date described 
SELECT *
FROM steam
WHERE release_date < '2023-01-01';

-- Retrieves information from a certain game decribed 
SELECT * FROM steam
WHERE name = 'DEFCON'
LIMIT 0, 5000;

-- Search a game with a certain AppID
SELECT * FROM steam
WHERE appid = '1520'; 

--
--
-- Milstone 2 

-- Retrieves data
SELECT * FROM steam WHERE appid = 1;


-- Updates username for a user
UPDATE user
SET username = 'Ademordna'
WHERE username = 'AdemordnaN7'; 

-- Selects users older than a certain age
SELECT *
FROM user
WHERE age > 25;

-- Counts the number of users
SELECT COUNT(*) AS user_count
FROM user;

-- Finds the oldest user
SELECT *
FROM user
ORDER BY age DESC
LIMIT 1;

-- Updates age for a specific user
UPDATE user
SET age = 32
WHERE username = 'MissMaehem'; 

-- Calculates the average age of users
SELECT AVG(age) AS average_age
FROM user;

-- Retrieves information on a specific genre of game 
SELECT appid, name, release_date, price
FROM steam
WHERE genre = 'Action';

SELECT appid, name, release_date, price
FROM steam
WHERE genre = 'Indie;Strategy';

SELECT appid, name, release_date, price
FROM steam
WHERE genre = 'Indie';

SELECT appid, name, release_date, price
FROM steam
WHERE genre = 'Action;Free to Play';

-- Retrives a certain 'price' of a game searched 
SELECT price
FROM steam
WHERE name = 'Counter-Strike';

-- Retrieve Games with a Price Less Than a Certain Amount
SELECT name, price
FROM steam
WHERE price < 10.00;

-- Retrieves All Games and Their Prices
SELECT name, price
FROM steam;

-- Retrieves Games Developed or Published by a Specific Company
SELECT name, developer, publisher
FROM information
WHERE developer = 'Valve' OR publisher = 'Valve';
