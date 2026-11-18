-- VUA-SEN307 Week 7 Practical - Lab 5: Querying Data
-- SELECT, Filtering and Joins
-- Morenikeji David Olowo - VUG/SEN/24/11362
--
-- This worksheet uses the tables and data created in Week 6.
-- Select the correct Week 6 database in MySQL Workbench before running.

-- =====================================================
-- Task 1: Students in a department, sorted A-Z
-- =====================================================
-- Join Student to Department using dept_id.
-- Filter for Software Engineering and sort students by name.

SELECT
    s.full_name,
    d.dept_name
FROM Student s
INNER JOIN Department d
    ON s.dept_id = d.dept_id
WHERE d.dept_name = 'Software Engineering'
ORDER BY s.full_name ASC;


-- =====================================================
-- Task 2: Courses and their lecturers
-- =====================================================
-- CourseAllocation connects Course and Lecturer.
-- INNER JOIN returns one row for each course-lecturer allocation.
-- A course assigned to two lecturers will therefore appear twice.

SELECT
    c.course_title,
    l.full_name AS lecturer_name
FROM Course c
INNER JOIN CourseAllocation ca
    ON c.course_id = ca.course_id
INNER JOIN Lecturer l
    ON ca.lecturer_id = l.lecturer_id
ORDER BY c.course_title ASC, l.full_name ASC;


-- =====================================================
-- Task 3: Every student and their courses
-- =====================================================
-- LEFT JOIN keeps every student in the result, including students
-- who have not enrolled in any course. Such students show NULL
-- for course_title.

SELECT
    s.full_name,
    c.course_title
FROM Student s
LEFT JOIN Enrolment e
    ON s.student_id = e.student_id
LEFT JOIN Course c
    ON e.course_id = c.course_id
ORDER BY s.full_name ASC, c.course_title ASC;


-- Task 3 (additional): Students without any courses
-- =====================================================
-- IS NULL filters the LEFT JOIN result to students without a
-- matching enrolment/course. The Week 6 data was designed to
-- include students with no enrolments.

SELECT
    s.full_name,
    c.course_title
FROM Student s
LEFT JOIN Enrolment e
    ON s.student_id = e.student_id
LEFT JOIN Course c
    ON e.course_id = c.course_id
WHERE c.course_title IS NULL
ORDER BY s.full_name ASC;


-- =====================================================
-- Task 4: Filtering with AND, IN and BETWEEN
-- =====================================================
-- Find female students in Software Engineering (dept_id 4)
-- or Artificial Intelligence (dept_id 6), born between
-- 1 January 2004 and 31 December 2005, inclusive.
-- The department IDs match the Week 6 data in this project.

SELECT
    full_name,
    gender,
    dept_id,
    date_of_birth
FROM Student
WHERE gender = 'F'
  AND dept_id IN (4, 6)
  AND date_of_birth BETWEEN '2004-01-01' AND '2005-12-31'
ORDER BY full_name ASC;


-- =====================================================
-- Task 5: Pagination - Page 1
-- =====================================================
-- LIMIT 10 returns at most 10 enrolments.
-- OFFSET 0 skips no rows, so this is the first page.
-- ORDER BY enrolment_id gives the rows a predictable order.

SELECT *
FROM Enrolment
ORDER BY enrolment_id ASC
LIMIT 10 OFFSET 0;


-- Task 5: Pagination - Page 2
-- =====================================================
-- LIMIT 10 still returns at most 10 rows.
-- OFFSET 10 skips the first 10 rows, returning the next page.
-- ORDER BY is important so the pages are based on a consistent order.

SELECT *
FROM Enrolment
ORDER BY enrolment_id ASC
LIMIT 10 OFFSET 10;


-- =====================================================
-- Optional Challenge: Rewrite Task 3 using RIGHT JOIN
-- =====================================================
-- This keeps every Student row, including students without
-- enrolments. LEFT JOIN is generally easier to read here because
-- Student is the main table and appears first in the query.

SELECT
    s.full_name,
    c.course_title
FROM Enrolment e
RIGHT JOIN Student s
    ON e.student_id = s.student_id
LEFT JOIN Course c
    ON e.course_id = c.course_id
ORDER BY s.full_name ASC, c.course_title ASC;
