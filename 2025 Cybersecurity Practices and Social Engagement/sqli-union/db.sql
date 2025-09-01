CREATE USER 'readonly'@'%' IDENTIFIED BY 'readonly_password';
GRANT SELECT ON * TO 'readonly'@'%';
FLUSH PRIVILEGES;

CREATE TABLE posts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL
);

INSERT INTO posts (title, content) VALUES
('Trying to steal the flag!', '<code>table: flags
  column: flag_value</code>');

CREATE TABLE flags (
    id INT AUTO_INCREMENT PRIMARY KEY,
    flag_value VARCHAR(255) NOT NULL
);

INSERT INTO flags (flag_value) VALUES ('NCKUCTF{UNION_SELECT_FOO_FROM_BAR}');
