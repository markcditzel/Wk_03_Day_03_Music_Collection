DROP TABLE IF EXISTS albums; -- drop the 'many/child' table first
DROP TABLE IF EXISTS artists; -- then drop the 'one/parent' table

CREATE TABLE artists (-- ONE: create the 'one/parent' table first_name
id SERIAL4 PRIMARY KEY,
name VARCHAR(255)
);

CREATE TABLE albums (-- MANY: create the many/child table second
artist_id INT4 REFERENCES artists(id),
title VARCHAR(255),
genre VARCHAR(255),
id SERIAL4 PRIMARY KEY
 -- THIS ACTS AS THE FOREIGN KEY; match SERIAL4 and INT4 digits; reference the other table name and the key of its primary key
);
