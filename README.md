Your Next Adventure

Alexis White 

This database's search functionality enables users to filter results based on various criteria, ensuring that they can easily locate games that align with their preferences and interests. Moreover, the list management feature allows users to categorize and manage their gaming choices efficiently, tailoring their lists to suit their unique preferences and gaming priorities.

# Steam Database Project



## Overview



This project involves designing a database schema for a Steam-like platform, capturing information about users, games, reviews, descriptions, information, and requirements.



## Tables



1. **users:**

- `username` (PRIMARY KEY)

- `first_name`

- `last_name`

- `email` (UNIQUE)

- `age`



2. **steam:**

- `appid`

- `name`

- `release_date`

- `price`

- `genre`

- `categories`



3. **reviews:**

- `appid`

- `name`

- `positive`

- `negative`

- `genre`



4. **descriptions:**

- `appid`

- `detailed_descriptions`

- `about_the_game`

- `short_descriptions`



5. **information:**

- `appid`

- `name`

- `developer`

- `publisher`



6. **requirements:**

- `appid`

- `pc_requirements`

- `mac_requirements`

- `linux_requirements`

- `minimum`

- `recommended`



## Supertype-Subtype Relationships



### Supertype: User



- `username` (PRIMARY KEY)

- `first_name`

- `last_name`

- `email` (UNIQUE)

- `age`



### Subtype: SteamReviewer



- `username` (inherited from the supertype)

- `reviewer_score` (unique attribute specific to reviewers)



### Subtype: SteamDeveloper



- `username` (inherited from the supertype)

- `developer_name` (unique attribute specific to developers)



### Subtype: SteamPublisher



- `username` (inherited from the supertype)

- `publisher_name` (unique attribute specific to publishers)



### Subtype: SteamPlayer



- `username` (inherited from the supertype)

- Any additional attributes related to player-specific information or activities



## Usage



### Database Setup



1. **Download the Dataset:** 86. - The dataset can be downloaded from [https://www.kaggle.com/datasets/nikdavis/steam-store-games].



**MySQL Code**

- Execute the following MySQL code to create the database tables and set up foreign key constraints:



2. **Create Database:**

- Create a new MySQL database.



```sql

CREATE DATABASE steam_database;

USE steam_database;
