-- MariaDB Activity 2
-- Relationships and Queries

USE school;

-- Create the enrollments table
CREATE TABLE enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE
);

-- Add foreign key for students
ALTER TABLE enrollments
ADD CONSTRAINT fk_student
FOREIGN KEY (student_id)
REFERENCES students(id);

-- Add foreign key for courses
ALTER TABLE enrollments
ADD CONSTRAINT fk_course
FOREIGN KEY (course_id)
REFERENCES courses(course_id);

-- Insert 10 enrollment records
INSERT INTO enrollments
(student_id, course_id, enrollment_date)
VALUES
(1, 1, '2026-10-07'),
(1, 2, '2026-10-07'),
(2, 1, '2026-10-07'),
(2, 3, '2026-10-07'),
(4, 3, '2026-10-07'),
(4, 4, '2026-10-07'),
(5, 1, '2026-10-07'),
(5, 5, '2026-10-07'),
(6, 2, '2026-10-07'),
(6, 5, '2026-10-07');

-- Display enrollments
SELECT * FROM enrollments;

-- Basic JOIN
SELECT
    students.name,
    courses.course_name,
    enrollments.enrollment_date
FROM enrollments
JOIN students
    ON enrollments.student_id = students.id
JOIN courses
    ON enrollments.course_id = courses.course_id;

-- Filter using WHERE
SELECT
    students.name,
    courses.course_name
FROM enrollments
JOIN students
    ON enrollments.student_id = students.id
JOIN courses
    ON enrollments.course_id = courses.course_id
WHERE courses.course_name = 'BSIT';

-- Challenge Task 2: Display all courses taken by a particular student
SELECT
    students.name,
    courses.course_name
FROM enrollments
JOIN students
    ON enrollments.student_id = students.id
JOIN courses
    ON enrollments.course_id = courses.course_id
WHERE students.name = 'Iris Salazar';

-- Sort students alphabetically
SELECT
    students.name,
    courses.course_name
FROM enrollments
JOIN students
    ON enrollments.student_id = students.id
JOIN courses
    ON enrollments.course_id = courses.course_id
ORDER BY students.name ASC;

-- Count total students
SELECT COUNT(*) AS total_students
FROM students;

-- Count total enrollments
SELECT COUNT(*) AS total_enrollments
FROM enrollments;

-- Count students per course
SELECT
    courses.course_name,
    COUNT(enrollments.student_id) AS number_of_students
FROM courses
LEFT JOIN enrollments
    ON courses.course_id = enrollments.course_id
GROUP BY courses.course_id, courses.course_name;

-- Find the most popular course
SELECT
    courses.course_name,
    COUNT(enrollments.student_id) AS number_of_students
FROM courses
LEFT JOIN enrollments
    ON courses.course_id = enrollments.course_id
GROUP BY courses.course_id, courses.course_name
ORDER BY number_of_students DESC;

-- Student report
SELECT
    students.id AS student_id,
    students.name AS student_name,
    courses.course_name,
    enrollments.enrollment_date
FROM enrollments
JOIN students
    ON enrollments.student_id = students.id
JOIN courses
    ON enrollments.course_id = courses.course_id
ORDER BY students.name;
