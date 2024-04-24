-- Retrieves all columns from the 'requirements' table in the 'Steam' schema 
SELECT * FROM Steam.requirements; 

-- Create the requirements table
CREATE TABLE requirements (
    appid INT PRIMARY KEY,
    pc_requirements TEXT,
    mac_requirements TEXT,
    linux_requirements TEXT,
    minimum TEXT,
    recommended TEXT,
    FOREIGN KEY (appid) REFERENCES steam(appid)
);

-- Example insert data into the requirements table
INSERT INTO requirements (appid, pc_requirements, mac_requirements, linux_requirements, minimum, recommended)
VALUES
    (1, 'PC Requirements for Game 1', 'Mac Requirements for Game 1', 'Linux Requirements for Game 1', 'Minimum Requirements for Game 1', 'Recommended Requirements for Game 1'),
    (2, 'PC Requirements for Game 2', 'Mac Requirements for Game 2', 'Linux Requirements for Game 2', 'Minimum Requirements for Game 2', 'Recommended Requirements for Game 2'),
    (3, 'PC Requirements for Game 3', 'Mac Requirements for Game 3', 'Linux Requirements for Game 3', 'Minimum Requirements for Game 3', 'Recommended Requirements for Game 3');

-- Describes the structure of the 'requirements' table in the 'Steam' schema 
DESCRIBE requirements; 

-- Renames the column from steam_appid to appid 
ALTER TABLE requirements 
CHANGE COLUMN steam_appid appid INT; 

-- Drops the existing index on the appid column in the requirements table 
DROP INDEX idx_appid_requirements ON requirements; 

-- Creates a new index on the appid column in the requirements table 
CREATE INDEX idx_appid_requirements ON requirements (appid); 

-- Shows the indexes on the requirements table 
SHOW INDEX FROM requirements; 

-- Drops the steam_appid index on the appid column in the requirements table 
DROP INDEX idx_steam_appid_requirements ON requirements; 

-- Adds the foreign key constraint to the requirements table 
ALTER TABLE requirements 
ADD CONSTRAINT fk_requirements_steam 
FOREIGN KEY (appid) REFERENCES steam(appid) 
ON UPDATE CASCADE ON DELETE CASCADE; 
