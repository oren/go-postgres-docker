CREATE ROLE developer with LOGIN PASSWORD developer;
CREATE DATABASE website;
ALTER DATABASE website OWNER developer;

CREATE TABLE contacts (
    name       varchar(50) NOT NULL,
    email      varchar(50) NOT NULL,
    message    varchar(1000) NOT NULL
);


