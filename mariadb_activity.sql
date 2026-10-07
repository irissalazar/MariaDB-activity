CREATE DATABASE school;

USE school;

CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    course VARCHAR(100),
    year_level INT
);

INSERT INTO students (name, course, year_level)
VALUES
('Juan Dela Cruz', 'BSIT', 1),
('Maria Santos', 'BSCS', 2),
('Pedro Reyes', 'BSIT', 3);

SELECT * FROM students;

SELECT * FROM students
WHERE course = 'BSIT';

SELECT * FROM students
WHERE year_level >= 2;

INSERT INTO students (name, course, year_level)
VALUES ('Iris Salazar', 'BSIT', 3);

SELECT * FROM students;

UPDATE students
SET year_level = 2
WHERE name = 'Juan Dela Cruz';

SELECT * FROM students;

DELETE FROM students
WHERE name = 'Pedro Reyes';

SELECT * FROM students;

CREATE TABLE courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100),
    description VARCHAR(255),
    units INT
);

INSERT INTO courses (course_name, description, units)
VALUES
('BSIT', 'Bachelor of Science in Information Technology', 4),
('BSCS', 'Bachelor of Science in Computer Science', 4),
('BSBA', 'Bachelor of Science in Business Administration', 3);

SELECT * FROM courses;