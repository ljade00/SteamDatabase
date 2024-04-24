-- Retrieves all columns from the 'information' table in the 'Steam' schema 
SELECT * FROM Steam.information; 

-- Create the information table
CREATE TABLE information (
    appid INT PRIMARY KEY,
    name VARCHAR(255),
    developer VARCHAR(255),
    publisher VARCHAR(255),
    FOREIGN KEY (appid) REFERENCES steam(appid)
);

-- Example insert data into the information table 
INSERT INTO information (appid, name, developer, publisher)
VALUES
    (1, 'Game 1', 'Developer A', 'Publisher X'),
    (2, 'Game 2', 'Developer B', 'Publisher Y'),
    (3, 'Game 3', 'Developer C', 'Publisher Z');

-- Describe the structure of the 'information' table in the 'Steam' schema 
DESCRIBE information; 

-- Creates an index on the appid column in the information table 
CREATE INDEX idx_appid_information ON information (appid); 

-- Adds the foreign key constraint to the information table 
ALTER TABLE information 
ADD CONSTRAINT fk_information_steam 
FOREIGN KEY (appid) REFERENCES steam(appid) 
ON UPDATE CASCADE ON DELETE CASCADE; 

-- Retrieves the 'name' column aliased as 'GameName' and the 'developer' column from the 'information' table 
SELECT information.name AS GameName, information.developer 
FROM information; 
