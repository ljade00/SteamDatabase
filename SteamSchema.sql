-- Creates users table 
CREATE TABLE users (
username VARCHAR (20) PRIMARY KEY,
first_name VARCHAR (20),
last_name VARCHAR (20),
email VARCHAR (50) UNIQUE,
age INT (100)
); 

-- Changes entity users to user 
ALTER TABLE users RENAME TO user;

-- Insert data into the steam table
INSERT INTO steam (username, first_name, last_name, email, age)
VALUES
('Ademordna','Alexis', 'White', 'whitaj31@uwgb.edu', 23),
('evocator','Trenton', 'Weyland', 'weylt22@uwgb.edu', 19),
('BBRDGZ','Tyler', 'Terry', 'elvisAlvin@gmail.com', 31),
('MissMaehem', 'Leah', 'Terry', 'terryl@uwgb.edu', 31),
('lilibra', 'Daniel', 'Gray', 'dg12ny@gmail.com', 29); 

-- Retrieves all columns from the 'user' table in the 'Steam' schema 
SELECT * FROM Steam.user; 

-- Retrieves all columns from the 'user' table in the 'Steam' schema 
SELECT * FROM Steam.user; 

-- Describe the structure of the 'user' table in the 'Steam' schema 
DESCRIBE user; 

-- Retrieve all columns from the 'user' table where the 'username' is 'ademordna' 
SELECT * 
FROM user 
WHERE username = 'Ademordna'; 

-- Retrieves all columns from the 'users' table where the 'username' is 'evocator' 
SELECT * 
FROM user
WHERE username = 'evocator'; 
  
-- Creates another user and inserts their information into the user table 
INSERT INTO user VALUES('MissMaehem', 'Leah', 'Terry', 'terryl@uwgb.edu', 31); 

-- Retrieves all columns from the 'user' table where the 'username' is 'MissMaehem' 
SELECT * 
FROM user 
WHERE username = 'MissMaehem'; 

-- Creates another user and inserts their information into the user table 
INSERT INTO user VALUES('lilibra', 'Daniel', 'Gray', 'dg12ny@gmail.com', 29); 

-- Retrieves all columns from the 'user' table where the 'username' is 'lilibra' 
SELECT * 
FROM user
WHERE username = 'lilibra'; 

-- Creates another user and inserts their information into the user table 
INSERT INTO users VALUES('BBRDGZ', 'Tyler', 'Terry', 'elvisAlvin@gmail.com', 31); 

-- Retrieves all columns from the 'User' table where the 'username' is 'BBRDGZ' 
SELECT * 
FROM user 
WHERE username = 'BBRDGZ'; 

-- Retrieves all users from the 'users' table 
SELECT * FROM Steam.user; 

-- Retrieves only the 'username' and 'email' columns for all users 
SELECT username, email FROM Steam.user; 

--
--
-- Creates steam table
CREATE TABLE steam (
    appid INT,
    name VARCHAR(255),
    release_date DATE,
    categories VARCHAR(255) ,
    genre VARCHAR(255),
    price DECIMAL(10, 2)
);

-- Changed column attribute name categories to category 
ALTER TABLE steam
CHANGE COLUMN categories category VARCHAR(255);

-- Changed column attribute name genres to genre 
ALTER TABLE steam
CHANGE COLUMN genres genre VARCHAR(255);

-- Retrieves all columns from the 'steam' table in the 'Steam' schema 
SELECT * FROM Steam.steam; 

-- Example Insert data into the steam table 
INSERT INTO steam (appid, name, release_date, category, genre, price)
VALUES
    (10, 'Counter Strike', '2000-11-01', 'Multi-player;Online Multi-Player;Local Multi Player;Valve Anti-Cheat enabled', 'Action', 7.19),
    (20, 'Team Fortress Classic', '1999-04-01', 'Multi-player;Online Multi-Player;Local Multi-Player;Valve Anti-Cheat enabled', 'Action', 3.99),
    (30, 'Day of Defeat', '2003-05-01', 'Multi-player;Valve Anti-Cheat enabled', 'Action', 3.99),
	(40, 'Deathmatch Classic', '2001-06-01', 'Multi-player;Online Multi-Player;Local Multi-Player;Valve Anti-Cheat enabled', 'Action', '3.99'),
    (50, 'Half-Life: Opposing Force', '1999-11-01', 'Single-player;Multi-player;Valve Anti-Cheat enabled', 'Action', '3.99'),
    (60, 'Ricochet', '2000-11-01', 'Multi-player;Online Multi-Player;Valve Anti-Cheat enabled', 'Action', '3.99');

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

-- Retrieves columns from the 'steam' and 'review' tables using a LEFT JOIN where 'appid' is 70     
SELECT steam.*, review.* 
FROM steam 
LEFT JOIN Review ON steam.appid = review.appid 
WHERE steam.appid = 70; 

-- Retrieves columns from the 'steam' and 'requirement' tables where 'appid' matches 
SELECT steam.name AS GameName, requirement.pc_requirement
FROM steam 
JOIN requirement ON Steam.appid = requirement.appid; 

-- Counts the number of games in each genre from the 'steam' table 
SELECT genre, COUNT(*) AS GameCount 
FROM steam 
GROUP BY genre; 

-- Retrieves all columns from the 'steam' table where 'release_date' is before '2023-01-01' 
SELECT * 
FROM steam 
WHERE release_date < '2023-01-01'; 

--
--
-- Create the review table
CREATE TABLE review ( 
    appid INT PRIMARY KEY,
    name VARCHAR(255),
    positive_rating TEXT,
    negative_rating TEXT,
    genre VARCHAR(255),
    PRIMARY KEY (appid, name),
    FOREIGN KEY (appid) REFERENCES steam(appid)
);

-- Changes entity reviews to review 
ALTER TABLE reviews RENAME TO review;

-- Retrieves all columns from the 'review' table in the 'Steam' schema 
SELECT * FROM Steam.review; 

-- Insert data into the review table example
INSERT INTO review (appid, name, positive_ratings, negative_ratings)
VALUES
    (10, 'Counter-Strike', 124534, 3339),
    (20, 'Team Fortress Classic', 3318, 633),
    (30, 'Day of Defeat', 3416, 398),
    (40, 'Deathmatch Classic', 1273, 267),
    (50, 'Half-life: Opposing Force', 5250, 288),
    (60, 'Ricochet', 2758, 684),
    (70, 'Half-Life', 27755, 1100),
    (80, 'Counter-Strike: Condition Zero', 12120, 1439),
    (130, 'Half-Life: Blue Shift', 3822, 420),
    (220, 'Half-Life 2', 67902, 2419),
    (240, 'Counter-Strike: Source', 76640, 3497),
    (280, 'Half-Life: Source', 3767, 1053),
    (300, 'Day of Defeat: Source', 10489, 1210),
    (320, 'Half-Life 2: Deathmatch', 6020, 787),
    (340, 'Half-Life 2: Lost Coast', 5783, 1020),
    (360, 'Half-Life Deathmatch: Source', 1362, 473),
    (380, 'Half-Life 2: Episode One', 7908, 517),
    (400, 'Portal', 51801, 1080),
    (420, 'Half-Life 2: Episode Two', 13902, 696),
    (440, 'Team Fortress 2', 515879, 34036),
    (500, 'Left 4 Dead', 17951, 948),
    (550, 'Left 4 Dead 2', 251789, 8418),
    (570, 'Dota 2', 863507, 142079),
    (620, 'Portal 2', 138220, 1891),
    (630, 'Alien Swarm', 17435, 941),
    (730, 'Counter-Strike: Global Offensive', 264404, 402313),
    (1002, 'Rag Doll Kung Fu', 40, 17),
    (1200, 'Red Orchestra: Ostfront 41-45', 1562, 233),
    (1250, 'Killing Floor', 53710, 2649),
    (1300, 'SiN Episodes: Emergence', 468, 61),
    (1500, 'Darwinia', 472, 158),
    (1510, 'Uplink', 1602, 152),
    (1520, 'DEFCON', 2057, 344);
    
-- Describes the structure of the 'review' table in the 'Steam' schema 
DESCRIBE review; 

-- Show the SQL statement that was used to create the 'review' table 
SHOW CREATE TABLE Review; 

-- Adds a foreign key constraint to the 'review' table, linking 'appid' to the 'appid' column in the 'steam' table 
ALTER TABLE review 
ADD CONSTRAINT fk_review_steam 
FOREIGN KEY (appid) REFERENCES steam(appid) 
ON UPDATE CASCADE ON DELETE CASCADE; 

-- Retrieves all rows from the 'Review' table where 'appid' is not present in the 'steam' table 
SELECT * FROM Review
WHERE appid NOT IN (SELECT appid FROM steam); 

-- Added the foreign key constraint to the review table 
ALTER TABLE review
ADD CONSTRAINT fk_reviews_steam 
FOREIGN KEY (appid) REFERENCES steam(appid) 
ON UPDATE CASCADE ON DELETE CASCADE; 

--
--
-- Create the requirements table
CREATE TABLE requirements ( -- cchanged to requirement
    appid INT PRIMARY KEY,
    pc_requirements TEXT,
    mac_requirements TEXT,
    linux_requirements TEXT,
    minimum TEXT,
    recommended TEXT,
    FOREIGN KEY (appid) REFERENCES steam(appid)
);

-- Changed column attribute name pc_requirements to pc_requirement 
ALTER TABLE requirement
CHANGE COLUMN pc_requirements pc_requirements TEXT;

-- Changed column attribute name mac_requirements to mac_requirement 
ALTER TABLE requirement
CHANGE COLUMN mac_requirements mac_requirement TEXT;

-- Changed column attribute name linux_requirements to linux_requirement 
ALTER TABLE requirement
CHANGE COLUMN linux_requirements linux_requirement TEXT;

-- Changes entity requirements to requirement 
ALTER TABLE requirements RENAME TO requirement;

-- Retrieves all columns from the 'requirement' table in the 'Steam' schema 
SELECT * FROM Steam.requirement; 

-- Example insert data into the requirement table
INSERT INTO requirement (appid, pc_requirement, mac_requirement, linux_requirement, minimum, recommended)
VALUES
	('10', '{\'minimum\': \'\\r\\n\\t\\t\\t<p><strong>Minimum:</strong> 500 mhz processor, 96mb ram, 16mb video card, Windows XP, Mouse, Keyboard, Internet Connection<br /></p>\\r\\n\\t\\t\\t<p><strong>Recommended:</strong> 
    800 mhz processor, 128mb ram, 32mb+ video card, Windows XP, Mouse, Keyboard, Internet Connection<br /></p>\\r\\n\\t\\t\\t\'}', '{\'minimum\': \'Minimum: OS X  Snow Leopard 10.6.3, 1GB RAM, 4GB Hard Drive Space,NVIDIA GeForce 8 or higher,
    ATI X1600 or higher, or Intel HD 3000 or higher Mouse, Keyboard, Internet Connection\'}', '{\'minimum\': \'Minimum: Linux Ubuntu 12.04, Dual-core from Intel or AMD at 2.8 GHz, 1GB Memory, nVidia GeForce 8600/9600GT, ATI/AMD Radeaon HD2600/3600 
	(Graphic Drivers: nVidia 310, AMD 12.11), OpenGL 2.1, 4GB Hard Drive Space, OpenAL Compatible Sound Card\'}', '500 mhz processor, 96mb ram, 16mb video card, Windows XP, Mouse, Keyboard, Internet Connection Recommended: 800 mhz processor, 128mb ram, 
    32mb+ video card, Windows XP, Mouse, Keyboard, Internet Connection'),
    
    ('20', '{\'minimum\': \'\\r\\n\\t\\t\\t<p><strong>Minimum:</strong> 500 mhz processor, 96mb ram, 16mb video card, Windows XP, Mouse, Keyboard, Internet Connection<br /></p>\\r\\n\\t\\t\\t<p><strong>Recommended:</strong> 800 mhz processor, 128mb ram, 
    32mb+ video card, Windows XP, Mouse, Keyboard, Internet Connection<br /></p>\\r\\n\\t\\t\\t\'}', '{\'minimum\': \'Minimum: OS X  Snow Leopard 10.6.3, 1GB RAM, 4GB Hard Drive Space,NVIDIA GeForce 8 or higher, ATI X1600 or higher, or Intel HD 3000 or higher Mouse,
    Keyboard, Internet Connection\'}', '{\'minimum\': \'Minimum: Linux Ubuntu 12.04, Dual-core from Intel or AMD at 2.8 GHz, 1GB Memory, nVidia GeForce 8600/9600GT, ATI/AMD Radeaon HD2600/3600 (Graphic Drivers: nVidia 310, AMD 12.11), OpenGL 2.1, 4GB Hard Drive Space,
    OpenAL Compatible Sound Card\'}', '500 mhz processor, 96mb ram, 16mb video card, Windows XP, Mouse, Keyboard, Internet Connection Recommended: 800 mhz processor, 128mb ram, 32mb+ video card, Windows XP, Mouse, Keyboard, Internet Connection'),
    
    ('30', '{\'minimum\': \'\\r\\n\\t\\t\\t<p><strong>Minimum:</strong> 500 mhz processor, 96mb ram, 16mb video card, Windows XP, Mouse, Keyboard, Internet Connection<br /></p>\\r\\n\\t\\t\\t<p><strong>Recommended:</strong> 800 mhz processor, 128mb ram, 32mb+ video card, 
    Windows XP, Mouse, Keyboard, Internet Connection<br /></p>\\r\\n\\t\\t\\t\'}', '{\'minimum\': \'Minimum: OS X  Snow Leopard 10.6.3, 1GB RAM, 4GB Hard Drive Space,NVIDIA GeForce 8 or higher, ATI X1600 or higher, or Intel HD 3000 or higher Mouse, Keyboard, Internet Connection\'}', 
    '{\'minimum\': \'Minimum: Linux Ubuntu 12.04, Dual-core from Intel or AMD at 2.8 GHz, 1GB Memory, nVidia GeForce 8600/9600GT, ATI/AMD Radeaon HD2600/3600 (Graphic Drivers: nVidia 310, AMD 12.11), OpenGL 2.1, 4GB Hard Drive Space, OpenAL Compatible Sound Card\'}', '500 mhz processor, 
    96mb ram, 16mb video card, Windows XP, Mouse, Keyboard, Internet Connection Recommended: 800 mhz processor, 128mb ram, 32mb+ video card, Windows XP, Mouse, Keyboard, Internet Connection'),
    
    ('40', '{\'minimum\': \'\\r\\n\\t\\t\\t<p><strong>Minimum:</strong> 500 mhz processor, 96mb ram, 16mb video card, Windows XP, Mouse, Keyboard, Internet Connection<br /></p>\\r\\n\\t\\t\\t<p><strong>Recommended:</strong> 800 mhz processor, 128mb ram, 32mb+ video card, Windows XP, Mouse, Keyboard, 
    Internet Connection<br /></p>\\r\\n\\t\\t\\t\'}', '{\'minimum\': \'Minimum: OS X  Snow Leopard 10.6.3, 1GB RAM, 4GB Hard Drive Space,NVIDIA GeForce 8 or higher, ATI X1600 or higher, or Intel HD 3000 or higher Mouse, Keyboard, Internet Connection\'}', '{\'minimum\': \'Minimum: Linux Ubuntu 12.04, Dual-core 
    from Intel or AMD at 2.8 GHz, 1GB Memory, nVidia GeForce 8600/9600GT, ATI/AMD Radeaon HD2600/3600 (Graphic Drivers: nVidia 310, AMD 12.11), OpenGL 2.1, 4GB Hard Drive Space, OpenAL Compatible Sound Card\'}', '500 mhz processor, 96mb ram, 16mb video card, Windows XP, Mouse, Keyboard, Internet Connection Recommended: 
    800 mhz processor, 128mb ram, 32mb+ video card, Windows XP, Mouse, Keyboard, Internet Connection'),
    
    ('50', '{\'minimum\': \'\\r\\n\\t\\t\\t<p><strong>Minimum:</strong> 500 mhz processor, 96mb ram, 16mb video card, Windows XP, Mouse, Keyboard, Internet Connection<br /></p>\\r\\n\\t\\t\\t<p><strong>Recommended:</strong> 800 mhz processor, 128mb ram, 32mb+ video card, Windows XP, Mouse, Keyboard, Internet Connection<br /></p>\\r\\n\\t\\t\\t\'}', 
    '{\'minimum\': \'Minimum: OS X  Snow Leopard 10.6.3, 1GB RAM, 4GB Hard Drive Space,NVIDIA GeForce 8 or higher, ATI X1600 or higher, or Intel HD 3000 or higher Mouse, Keyboard, Internet Connection\'}', '{\'minimum\': \'Minimum: Linux Ubuntu 12.04, Dual-core from Intel or AMD at 2.8 GHz, 1GB Memory, nVidia GeForce 8600/9600GT, ATI/AMD Radeaon HD2600/3600 
    (Graphic Drivers: nVidia 310, AMD 12.11), OpenGL 2.1, 4GB Hard Drive Space, OpenAL Compatible Sound Card\'}', '500 mhz processor, 96mb ram, 16mb video card, Windows XP, Mouse, Keyboard, Internet Connection Recommended: 800 mhz processor, 128mb ram, 32mb+ video card, Windows XP, Mouse, Keyboard, Internet Connection');

-- Describes the structure of the 'requirement' table in the 'Steam' schema 
DESCRIBE requirement; 

-- Renames the column from steam_appid to appid 
ALTER TABLE requirement
CHANGE COLUMN steam_appid appid INT; 

-- Drops the existing index on the appid column in the requirement table 
DROP INDEX idx_appid_requirement ON requirement; 

-- Creates a new index on the appid column in the requirement table 
CREATE INDEX idx_appid_requirement ON requirement (appid); 

-- Shows the indexes on the requirements table 
SHOW INDEX FROM requirement; 

-- Drops the steam_appid index on the appid column in the requirements table 
DROP INDEX idx_steam_appid_requirement ON requirement; 

-- Adds the foreign key constraint to the requirement table 
ALTER TABLE requirement 
ADD CONSTRAINT fk_requirement_steam 
FOREIGN KEY (appid) REFERENCES steam(appid) 
ON UPDATE CASCADE ON DELETE CASCADE; 


--
--
-- Create the information table
CREATE TABLE information (
    appid INT PRIMARY KEY,
    name VARCHAR(255),
    developer VARCHAR(255),
    publisher VARCHAR(255),
    FOREIGN KEY (appid) REFERENCES steam(appid)
);

-- Retrieves all columns from the 'information' table in the 'Steam' schema 
SELECT * FROM Steam.information; 

-- Insert data into the information table example
INSERT INTO information (appid, name, developer, publisher)
VALUES
    (10, 'Counter-Strike', 'Valve', 'Valve'),
    (20, 'Team Fortress Classic', 'Valve', 'Valve'),
    (30, 'Day of Defeat', 'Valve', 'Valve'),
    ('40', 'Deathmatch Classic', 'Valve', 'Valve'),
    ('50', 'Half-Life: Opposing Force', 'Gearbox Software', 'Valve'),
	('60', 'Ricochet', 'Valve', 'Valve'),
    ('70', 'Half-Life', 'Valve', 'Valve'),
    ('80', 'Counter-Strike: Condition Zero', 'Valve', 'Valve'),
    ('130', 'Half-Life: Blue Shift', 'Gearbox Software', 'Valve'),
    ('220', 'Half-Life 2', 'Valve', 'Valve'),
    ('240', 'Counter-Strike: Source', 'Valve', 'Valve'),
	('280', 'Half-Life: Source', 'Valve', 'Valve'),
    ('300', 'Day of Defeat: Source', 'Valve', 'Valve'),
    ('320', 'Half-Life 2: Deathmatch', 'Valve', 'Valve'),
    ('340', 'Half-Life 2: Lost Coast', 'Valve', 'Valve'),
    ('360', 'Half-Life Deathmatch: Source', 'Valve', 'Valve'),
    ('380', 'Half-Life 2: Episode One', 'Valve', 'Valve'),
    ('400', 'Portal', 'Valve', 'Valve'),
    ('420', 'Half-Life 2: Episode Two', 'Valve', 'Valve'),
    ('440', 'Team Fortress 2', 'Valve', 'Valve'),
    ('500', 'Left 4 Dead', 'Valve', 'Valve'),
    ('550', 'Left 4 Dead 2', 'Valve', 'Valve'),
    ('570', 'Dota 2', 'Valve', 'Valve');
    
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


--
--
-- Create the descriptions table
CREATE TABLE descriptions (
    appid INT PRIMARY KEY,
    detailed_description TEXT,
    about_the_game TEXT,
    short_description TEXT,
    FOREIGN KEY (appid) REFERENCES steam(appid)
);

-- Changes entity descriptions to description 
ALTER TABLE descriptions RENAME TO description;

-- Retrieves all columns from the 'description' table in the 'Steam' schema 
SELECT * FROM Steam.description; 

-- Example insert data into the descriptions table
INSERT INTO description (appid, detailed_description, about_the_game, short_description)
VALUES
    (10, 'Play the worlds number 1 online action game. Engage in an incredibly realistic brand of terrorist warfare in this wildly popular team-based game. 
    Ally with teammates to complete strategic missions. Take out enemy sites.Rescue hostages. Your role affects your teams success. Your teams success affects your role.', 
    'Play the worlds number 1 online action game. Engage in an incredibly realistic brand of terrorist warfare in this wildly popular team-based game. Ally with teammates 
    to complete strategic missions. Take out enemy sites. Rescue hostages. Your role affects your teams success. Your teams success affects your role.', 'Play the worlds 
    number 1 online action game. Engage in an incredibly realistic brand of terrorist warfare in this wildly popular team-based game. Ally with teammates to complete strategic missions.
    Take out enemy sites. Rescue hostages. Your role affects your teams success. Your teams success affects your role.'),
    
    (20, 'One of the most popular online action games of all time, Team Fortress Classic features over nine character classes -- from Medic to Spy to Demolition Man -- enlisted in a unique style of online team warfare. 
    Each character class possesses unique weapons, items, and abilities, as teams compete online in a variety of game play modes.', 'One of the most popular online action games of all time, Team Fortress Classic features
    over nine character classes -- from Medic to Spy to Demolition Man -- enlisted in a unique style of online team warfare. Each character class possesses unique weapons, items, and abilities, as teams compete online in a
    variety of game play modes.', 'One of the most popular online action games of all time, Team Fortress Classic features over nine character classes -- from Medic to Spy to Demolition Man -- enlisted in a unique style of 
    online team warfare. Each character class possesses unique weapons, items, and abilities, as teams compete online in a variety of game play modes.'),
    
    (30, 'Enlist in an intense brand of Axis vs. Allied teamplay set in the WWII European Theatre of Operations. Players assume the role of light/assault/heavy infantry, sniper or machine-gunner class, 
    each with a unique arsenal of historical weaponry at their disposal. Missions are based on key historical operations. And, as war rages, players must work together with their squad to accomplish a 
    variety of mission-specific objectives.', 'Enlist in an intense brand of Axis vs. Allied teamplay set in the WWII European Theatre of Operations. Players assume the role of light/assault/heavy infantry, sniper or 
    machine-gunner class, each with a unique arsenal of historical weaponry at their disposal. Missions are based on key historical operations. And, as war rages, players must work together with their squad to accomplish a 
    variety of mission-specific objectives.', 'Enlist in an intense brand of Axis vs. Allied teamplay set in the WWII European Theatre of Operations. Players assume the role of light/assault/heavy infantry, sniper or machine-gunner 
    class, each with a unique arsenal of historical weaponry at their disposal. Missions are based on key historical operations.'),
    
    ('40', 'Enjoy fast-paced multiplayer gaming with Deathmatch Classic (a.k.a. DMC). Valve\'s tribute to the work of id software, DMC invites players to grab their rocket launchers and put their reflexes to the test in a collection of 
    futuristic settings.', 'Enjoy fast-paced multiplayer gaming with Deathmatch Classic (a.k.a. DMC). Valve\'s tribute to the work of id software, DMC invites players to grab their rocket launchers and put their reflexes to the test in a collection of futuristic settings.', 
    'Enjoy fast-paced multiplayer gaming with Deathmatch Classic (a.k.a. DMC). Valve\'s tribute to the work of id software, DMC invites players to grab their rocket launchers and put their reflexes to the test in a collection of futuristic settings.'),
    
    ('50', 'Return to the Black Mesa Research Facility as one of the military specialists assigned to eliminate Gordon Freeman. Experience an entirely new episode of single player action. Meet fierce alien opponents, and experiment with new weaponry. Named \'Game of the Year\' by the Academy of Interactive Arts and Sciences.', 
    'Return to the Black Mesa Research Facility as one of the military specialists assigned to eliminate Gordon Freeman. Experience an entirely new episode of single player action. Meet fierce alien opponents, and experiment with new weaponry. Named \'Game of the Year\' by the Academy of Interactive Arts and Sciences.', 
    'Return to the Black Mesa Research Facility as one of the military specialists assigned to eliminate Gordon Freeman. Experience an entirely new episode of single player action. Meet fierce alien opponents, and experiment with new weaponry. Named \'Game of the Year\' by the Academy of Interactive Arts and Sciences.'),
    
    ('60', 'A futuristic action game that challenges your agility as well as your aim, Ricochet features one-on-one and team matches played in a variety of futuristic battle arenas.', 'A futuristic action game that challenges your agility as well as your aim, Ricochet features one-on-one and team matches played in a 
    variety of futuristic battle arenas.', 'A futuristic action game that challenges your agility as well as your aim, Ricochet features one-on-one and team matches played in a variety of futuristic battle arenas.'),
    
    ('70', 'Named Game of the Year by over 50 publications, Valve\'s debut title blends action and adventure with award-winning technology to create a frighteningly realistic world where players must think to survive. Also includes an exciting multiplayer mode that allows you to play against friends and enemies around the world.', 
    'Named Game of the Year by over 50 publications, Valve\'s debut title blends action and adventure with award-winning technology to create a frighteningly realistic world where players must think to survive. Also includes an exciting multiplayer mode that allows you to play against friends and enemies around the world.',
    'Named Game of the Year by over 50 publications, Valve\'s debut title blends action and adventure with award-winning technology to create a frighteningly realistic world where players must think to survive. Also includes an exciting multiplayer mode that allows you to play against friends and enemies around the world.'),
    
    ('80', 'With its extensive Tour of Duty campaign, a near-limitless number of skirmish modes, updates and new content for Counter-Strike\'s award-winning multiplayer game play, plus over 12 bonus single player missions, Counter-Strike: Condition Zero is a tremendous offering of single and multiplayer content.', 
    'With its extensive Tour of Duty campaign, a near-limitless number of skirmish modes, updates and new content for Counter-Strike\'s award-winning multiplayer game play, plus over 12 bonus single player missions, Counter-Strike: Condition Zero is a tremendous offering of single and multiplayer content.', 
    'With its extensive Tour of Duty campaign, a near-limitless number of skirmish modes, updates and new content for Counter-Strike\'s award-winning multiplayer game play, plus over 12 bonus single player missions, Counter-Strike: Condition Zero is a tremendous offering of single and multiplayer content.'),
    
    ('130', 'Made by Gearbox Software and originally released in 2001 as an add-on to Half-Life, Blue Shift is a return to the Black Mesa Research Facility in which you play as Barney Calhoun, the security guard sidekick who helped Gordon out of so many sticky situations.', 'Made by Gearbox Software and originally released in 2001 as an add-on to Half-Life, 
    Blue Shift is a return to the Black Mesa Research Facility in which you play as Barney Calhoun, the security guard sidekick who helped Gordon out of so many sticky situations.', 'Made by Gearbox Software and originally released in 2001 as an add-on to Half-Life, Blue Shift is a return to the Black Mesa Research Facility in which you play as Barney Calhoun, 
    the security guard sidekick who helped Gordon out of so many sticky situations.');

-- Describes the structure of the 'description' table in the 'Steam' schema 
DESCRIBE description; 

-- Renames the column from steam_appid to appid 
ALTER TABLE description 
CHANGE COLUMN steam_appid appid INT; 

-- Creates an index on the appid column 
CREATE INDEX idx_appid_description ON description (appid); 
  
-- Adds the foreign key constraint to the description table 
ALTER TABLE description 
ADD CONSTRAINT fk_description_steam 
FOREIGN KEY (appid) REFERENCES steam(appid) 
ON UPDATE CASCADE ON DELETE CASCADE;

--
--
-- Example Queries:

-- Retrieves all columns from the 'steam' table in the 'Steam' schema 
SELECT * FROM Steam.steam; 

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

-- Updates data
UPDATE user SET age = 30 WHERE userid = 3;

-- Updates user with username 'Ademordna'
UPDATE user
SET
  email = 'whitea@uwgb.edu',
  age = 23,
  first_name = 'Lexy',
  last_name = 'Jade'
WHERE
  username = 'Ademordna'; -- has not been executed (example)
  
  -- Deletes a user based on username
-- DELETE FROM user WHERE username = 'lilibra'; -- has not been executed 

-- Inserts a new user
INSERT INTO user (username, first_name, last_name, email, age)
VALUES ('Gallitsur', 'Jared', 'Guidrey', 'jguidr@uwgb.edu', 26); 

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

-- Creates an index on the 'genre' column in the 'steam' table
CREATE INDEX idx_genre_steam ON steam (genre);

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

-- Retrieves Games with a Price Less Than a Certain Amount
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