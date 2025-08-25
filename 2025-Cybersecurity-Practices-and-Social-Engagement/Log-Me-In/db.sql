CREATE USER 'readonly'@'%' IDENTIFIED BY 'readonly_password';
GRANT SELECT ON * TO 'readonly'@'%';
FLUSH PRIVILEGES;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(50) NOT NULL
);

INSERT INTO users (username, password) VALUES ('admin', 'password123');
INSERT INTO users (username, password) VALUES ('user', 'userpass');
