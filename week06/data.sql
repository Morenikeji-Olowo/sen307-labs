-- VUA-SEN307 Week 6 Practical - Lab 4: DML (Insert, Update, Delete)
-- Morenikeji David Olowo - VUG/SEN/24/11362

USE sen_307_11362;

-- =====================================================
-- Part 1: Departments and Courses (provided)
-- =====================================================

INSERT INTO Department (dept_name) VALUES
('Software Engineering'),
('Computer Science'),
('Artificial Intelligence'),
('Data Science'),
('Cybersecurity');

INSERT INTO Course (course_code, course_title, credit_units, description, dept_id) VALUES
('SEN307', 'Database Systems', 3,
 'Relational database design, SQL queries, normalization, transactions and indexing using MySQL.',
 (SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
('SEN301', 'Software Architecture', 3,
 'Architectural styles, design patterns, microservices and how to structure large software systems.',
 (SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
('COS301', 'Operating Systems', 3,
 'Processes, threads, CPU scheduling, memory management and file systems.',
 (SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),
('COS305', 'Computer Networks', 3,
 'TCP/IP, routing, switching, LAN and WAN design and network protocols.',
 (SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),
('AIN301', 'Introduction to Artificial Intelligence', 3,
 'Intelligent agents, search algorithms, knowledge representation and reasoning.',
 (SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('AIN305', 'Machine Learning', 3,
 'Supervised and unsupervised learning, neural networks, deep learning and model evaluation.',
 (SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('AIN307', 'Natural Language Processing', 3,
 'Text processing, word embeddings, language models, sentiment analysis and chatbots.',
 (SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('DTS301', 'Data Visualization and Analytics', 2,
 'Exploratory data analysis, charts, dashboards and telling stories with data.',
 (SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),
('DTS305', 'Big Data Technologies', 3,
 'Distributed storage and processing of very large datasets with Hadoop and Spark.',
 (SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),
('CYB301', 'Network Security', 3,
 'Firewalls, cryptography, intrusion detection and protecting networks from attacks.',
 (SELECT dept_id FROM Department WHERE dept_name = 'Cybersecurity'));

SELECT d.dept_name, COUNT(c.course_id) AS courses
FROM Department d LEFT JOIN Course c ON d.dept_id = c.dept_id
GROUP BY d.dept_name;

SELECT dept_id, dept_name FROM Department;
SELECT course_id, course_code FROM Course;

-- Remove the leftover test department from Week 5 testing
DELETE FROM Department WHERE dept_id = 1;

-- =====================================================
-- Part 2: Own data
-- Department IDs: 4 = Software Engineering, 5 = Computer Science,
-- 6 = Artificial Intelligence, 7 = Data Science, 8 = Cybersecurity
-- =====================================================

-- Step 1: Lecturers (10)
INSERT INTO Lecturer (staff_no, full_name, email, dept_id) VALUES
('VUA/ST/101', 'Dr Amaka Okafor',      'a.okafor@vua.edu.ng',    4),
('VUA/ST/102', 'Dr Musa Bello',        'm.bello@vua.edu.ng',     4),
('VUA/ST/103', 'Prof Chinedu Eze',     'c.eze@vua.edu.ng',       5),
('VUA/ST/104', 'Dr Fatima Abubakar',   'f.abubakar@vua.edu.ng',  5),
('VUA/ST/105', 'Dr Tunde Adeyemi',     't.adeyemi@vua.edu.ng',   6),
('VUA/ST/106', 'Dr Ngozi Nwosu',       'n.nwosu@vua.edu.ng',     6),
('VUA/ST/107', 'Dr Ibrahim Yusuf',     'i.yusuf@vua.edu.ng',     7),
('VUA/ST/108', 'Mrs Funke Ogunleye',   'f.ogunleye@vua.edu.ng',  7),
('VUA/ST/109', 'Dr Emeka Obi',         'e.obi@vua.edu.ng',       8),
('VUA/ST/110', 'Engr Halima Danjuma',  'h.danjuma@vua.edu.ng',   8);

SELECT lecturer_id, full_name, dept_id FROM Lecturer;

-- Step 2: Students (20)
INSERT INTO Student (matric_no, full_name, gender, date_of_birth, dept_id) VALUES
('20231234',         'Ada Obi',                'F', '2005-03-14', 4),
('20231235',         'John Musa',              'M', '2004-11-02', 5),
('VUG/SEN/24/11362', 'Morenikeji David Olowo', 'M', '2008-03-15', 4),
('20231237',         'Chiamaka Nwankwo',       'F', '2006-07-21', 4),
('20231238',         'Abdullahi Sani',         'M', '2003-09-10', 5),
('20231239',         'Oluwaseun Adebayo',      'M', '2005-12-05', 6),
('20231240',         'Zainab Lawal',           'F', '2004-04-18', 6),
('20231241',         'Ikechukwu Okeke',        'M', '2007-02-27', 7),
('20231242',         'Temitope Ajayi',         'F', '2005-08-30', 7),
('20231243',         'Yusuf Garba',            'M', '2006-01-15', 8),
('20231244',         'Blessing Etim',          'F', '2003-06-09', 8),
('20231245',         'Emmanuel Okon',          'M', '2004-10-22', 4),
('20231246',         'Aisha Mohammed',         'F', '2007-05-03', 5),
('20231247',         'Damilola Ogunbiyi',      'F', '2005-11-11', 6),
('20231248',         'Kelechi Uche',           'M', '2006-03-28', 7),
('20231249',         'Hauwa Ibrahim',          'F', '2004-12-19', 8),
('20231250',         'Samuel Akpan',           'M', '2003-02-07', 4),
('20231251',         'Precious Eze',           'F', '2006-09-25', 5),
('20231252',         'Usman Danladi',          'M', '2005-06-14', 6),
('20231253',         'Grace Okon',             'F', '2004-08-08', 4);

SELECT student_id, matric_no, full_name FROM Student;

-- Step 3: Enrolments (40)
-- Course 1 (SEN307) has 8 students; students 19 and 20 have no enrolments
INSERT INTO Enrolment (student_id, course_id) VALUES
(1, 1),  (1, 2),  (1, 8),
(2, 1),  (2, 3),  (2, 4),
(3, 1),  (3, 2),  (3, 9),
(4, 1),  (4, 2),  (4, 6),
(5, 1),  (5, 3),
(6, 5),  (6, 6),
(7, 5),  (7, 7),
(8, 8),  (8, 9),
(9, 8),  (9, 6),
(10, 10), (10, 4),
(11, 10), (11, 3),
(12, 1), (12, 2),
(13, 3), (13, 4),
(14, 5), (14, 7),
(15, 9), (15, 8),
(16, 10), (16, 4),
(17, 1), (17, 5),
(18, 1), (18, 10);

-- Course allocations: every course has a lecturer; course 1 (SEN307) has two
INSERT INTO CourseAllocation (course_id, lecturer_id) VALUES
(1, 1), (1, 2),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 5),
(8, 7),
(9, 8),
(10, 9);

SELECT course_id, COUNT(*) AS students
FROM Enrolment
GROUP BY course_id;

-- =====================================================
-- Part 3: UPDATE a record
-- Moving Ada Obi to Computer Science (dept_id 5 in this database)
-- =====================================================

SELECT matric_no, full_name, dept_id FROM Student WHERE matric_no = '20231234';

UPDATE Student SET dept_id = 5 WHERE matric_no = '20231234';

SELECT matric_no, full_name, dept_id FROM Student WHERE matric_no = '20231234';
