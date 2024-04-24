-- Retrieves all columns from the 'steam' table in the 'Steam' schema 
SELECT * FROM Steam.steam; 

-- Creates steam table
CREATE TABLE steam (
    appid INT,
    name VARCHAR(255),
    release_date DATE,
    categories VARCHAR(255) ,
    genre VARCHAR(255),
    price DECIMAL(10, 2)
);

-- Example insert data into the steam table
INSERT INTO steam (appid, name, release_date, categories, genre, price)
VALUES
    (10, 'Counter Strike', '2000-11-01', 'Multi-player;Online Multi-Player;Local Multi Player;Valve Anti-Cheat enabled', 'Action', 7.19),
    (20, 'Team Fortress Classic', '1999-04-01', 'Multi-player;Online Multi-Player;Local Multi-Player;Valve Anti-Cheat enabled', 'Action', 3.99),
    (30, 'Day of Defeat', '2003-05-01', 'Multi-player;Valve Anti-Cheat enabled', 'Action', 3.99);

-- Describes the structure of the 'steam' table in the 'Steam' schema 
DESCRIBE steam; 

-- Create an index on the appid column in the steam table 
CREATE INDEX idx_appid_steam ON steam (appid); 

-- Checks if the steam table is referenced by other tables 
SELECT 
    CONSTRAINT_NAME, 
    TABLE_NAME, 
    COLUMN_NAME, 
    REFERENCED_TABLE_NAME, 
    REFERENCED_COLUMN_NAME 
FROM 
    INFORMATION_SCHEMA.KEY_COLUMN_USAGE 
WHERE 
    REFERENCED_TABLE_NAME = 'steam'; 

-- Retrieves columns from the 'steam' and 'reviews' tables using a LEFT JOIN where 'appid' is 70     
SELECT steam.*, reviews.* 
FROM steam 
LEFT JOIN Reviews ON steam.appid = reviews.appid 
WHERE steam.appid = 70; 

-- Retrieves columns from the 'steam' and 'requirements' tables where 'appid' matches 
SELECT steam.name AS GameName, requirements.pc_requirements 
FROM steam 
JOIN requirements ON Steam.appid = requirements.appid; 

-- Counts the number of games in each genre from the 'steam' table 
SELECT genres, COUNT(*) AS GameCount 
FROM steam 
GROUP BY genres; 

-- Retrieves all columns from the 'steam' table where 'release_date' is before '2023-01-01' 
SELECT * 
FROM steam 
WHERE release_date < '2023-01-01'; 
