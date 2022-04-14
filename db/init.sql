CREATE DATABASE venue;


CREATE TABLE users ( id serial PRIMARY KEY,
            username VARCHAR (30) NOT NULL,
            pword  VARCHAR(30) NOT NULL,
            user_type ENUM  ('HOST', 'BOOKEE', 'CUSTOMER'),
            user_id FOREIGN KEY);


