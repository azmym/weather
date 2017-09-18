-- create new schema 
CREATE SCHEMA IF NOT EXISTS weather DEFAULT CHARACTER SET utf8 ;

-- Create Role table
DROP TABLE IF EXISTS weather.role;
Create TABLE weather.role (
id BIGINT PRIMARY KEY AUTO_INCREMENT,role_name VARCHAR(30) NOT NULL UNIQUE, 
description VARCHAR(256),
creation_date TIMESTAMP DEFAULT current_timestamp NOT NULL);
-- Create User Table
DROP TABLE IF EXISTS weather.user;
Create TABLE weather.user (
id BIGINT PRIMARY KEY AUTO_INCREMENT,
user_name VARCHAR(100) NOT NULL,
email VARCHAR(100) NOT NULL UNIQUE,
password VARCHAR(100) NOT NULL,
mobile_number VARCHAR (15) NOT NULL,
enabled BOOLEAN NOT NULL,
role_id BIGINT NOT NULL ,
creation_date TIMESTAMP DEFAULT current_timestamp NOT NULL,
FOREIGN KEY (role_id)REFERENCES weather.role(id) ON DELETE CASCADE);
-- Create City Table
DROP TABLE IF EXISTS weather.city
 Create TABLE weather.city(
 id BIGINT PRIMARY KEY AUTO_INCREMENT,
 name VARCHAR(100) NOT NULL UNIQUE,
 creation_date TIMESTAMP DEFAULT current_timestamp NOT NULL,
 today_note VARCHAR(300)
 );
-- Create Predefined note
DROP TABLE IF EXISTS weather.pre_define_note
CREATE TABLE weather.pre_define_note
(
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    creation_date TIMESTAMP DEFAULT current_timestamp NOT NULL,
    `from` int NOT NULL UNIQUE,
    `to` int NOT NULL UNIQUE,
    note TEXT
);
-- Enable events
SET GLOBAL event_scheduler = ON;

-- Clear the old city note 
CREATE EVENT IF NOT EXISTS clearCityNoteEvent
ON SCHEDULE EVERY 1 DAY STARTS'2017-06-17 00:00:01'
ON COMPLETION PRESERVE
COMMENT 'Clean up note of cities at 00:01 daily!'
DO UPDATE  weather.city set today_note=''; 

--Insert one Admin user in User table
INSERT INTO weather.user (creation_date, email, enabled, mobile_number, password, user_name, role_id) VALUES (CURRENT_TIMESTAMP, 'mahmoud.azmy@gmail.com', true, '7732627946', 'ISMvKXpXpadDiUoOSoAfww==', 'Mahmoud', 1);

--Insert date in Role TABLE
INSERT INTO weather.role (creation_date, role_name,description) VALUE (CURRENT_TIMESTAMP, 'admin','the role of admin user');
INSERT INTO weather.role (creation_date, role_name,description) VALUE (CURRENT_TIMESTAMP, 'user','the role of normal user');
-- Insert data in City Table
INSERT INTO weather.city (creation_date, name) VALUE(CURRENT_TIMESTAMP, 'Cairo');
INSERT INTO weather.city (creation_date, name) VALUE(CURRENT_TIMESTAMP, 'Paris');
INSERT INTO weather.city (creation_date, name) VALUE(CURRENT_TIMESTAMP, 'London');
INSERT INTO weather.city (creation_date, name) VALUE(CURRENT_TIMESTAMP, 'Berlin ');
INSERT INTO weather.city (creation_date, name) VALUE(CURRENT_TIMESTAMP, 'Munich');
--Insert date in pre_define_note
INSERT INTO weather.pre_define_note (creation_date, `from`, `to`, note) VALUES (CURRENT_TIMESTAMP, 1, 10, 'less than 10 Note');
INSERT INTO weather.pre_define_note (creation_date, `from`, `to`, note) VALUES (CURRENT_TIMESTAMP, 10, 15, 'from 10 to 15 note');
INSERT INTO weather.pre_define_note (creation_date, `from`, `to`, note) VALUES (CURRENT_TIMESTAMP, 15, 20, 'from 15 to 20 pre Notes');
INSERT INTO weather.pre_define_note (creation_date, `from`, `to`, note) VALUES (CURRENT_TIMESTAMP, 20, 100, 'bigger than 20 Note');