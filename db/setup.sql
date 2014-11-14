CREATE USER developer WITH PASSWORD 'secretpass';
CREATE DATABASE website;

CREATE TABLE contacts (
    name       varchar(50) NOT NULL,
    email      varchar(50) NOT NULL,
    message    varchar(1000) NOT NULL
);

ALTER DATABASE website OWNER TO developer;
