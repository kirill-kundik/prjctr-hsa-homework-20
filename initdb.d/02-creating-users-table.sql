USE mydb;

CREATE TABLE IF NOT EXISTS users (
    id INT NOT NULL AUTO_INCREMENT,
    full_name VARCHAR(255) NOT NULL,
    birth_date DATE NOT NULL,
    CONSTRAINT users_pk PRIMARY KEY(id)
);
