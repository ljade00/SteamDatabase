-- Retrieves all columns from the 'reviews' table in the 'Steam' schema 
SELECT * FROM Steam.reviews; 

-- Create the reviews table
CREATE TABLE reviews (
    appid INT PRIMARY KEY,
    name VARCHAR(255),
    positive_ratings TEXT,
    negative_ratings TEXT,
    PRIMARY KEY (appid, name),
    FOREIGN KEY (appid) REFERENCES steam(appid)
);  

-- Example insert data into the reviews table
INSERT INTO reviews (appid, name, positive_ratings, negative_ratings)
VALUES
    (10, 'Counter-Strike', 124534, 3339),
    (20, 'Team Fortress Classic', 3318, 633),
    (30, 'Day of Defeat', 3416, 398);

-- Describes the structure of the 'reviews' table in the 'Steam' schema 
DESCRIBE reviews; 

-- Show the SQL statement that was used to create the 'reviews' table 
SHOW CREATE TABLE Reviews; 

-- Adds a foreign key constraint to the 'reviews' table, linking 'appid' to the 'appid' column in the 'steam' table 
ALTER TABLE reviews 
ADD CONSTRAINT fk_reviews_steam 
FOREIGN KEY (appid) REFERENCES steam(appid) 
ON UPDATE CASCADE ON DELETE CASCADE; 

-- Retrieves all rows from the 'Reviews' table where 'appid' is not present in the 'steam' table 
SELECT * FROM Reviews 
WHERE appid NOT IN (SELECT appid FROM steam); 

-- Added the foreign key constraint to the reviews table 
ALTER TABLE reviews 
ADD CONSTRAINT fk_reviews_steam 
FOREIGN KEY (appid) REFERENCES steam(appid) 
ON UPDATE CASCADE ON DELETE CASCADE; 
