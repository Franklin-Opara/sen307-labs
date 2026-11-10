INSERT INTO Department (dept_name)
VALUES
('Software Engineering'),
('Computer Science'),
('Artificial Intelligence'),
('Data Science'),
('Cybersecurity');

INSERT INTO Course
(course_code, course_title, credit_units, description, dept_id)
VALUES
(
    'SEN307',
    'Database Systems',
    3,
    'Relational database design, SQL queries, normalization, transactions and indexing using MySQL.',
    (SELECT dept_id FROM Department
     WHERE dept_name = 'Software Engineering')
),
(
    'SEN301',
    'Software Architecture',
    3,
    'Architectural styles, design patterns, microservices and how to structure large software systems.',
    (SELECT dept_id FROM Department
     WHERE dept_name = 'Software Engineering')
);


INSERT INTO Course (course_code, course_title, credit_units, description, dept_id) VALUES
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
'Supervised and unsupervised learning, neural networks, deep learning and model
evaluation.',
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
FROM Department d
LEFT JOIN Course c
ON d.dept_id = c.dept_id
GROUP BY d.dept_name;

INSERT INTO Lecturer (staff_no, full_name, email, dept_id) VALUES
('VUG/ST/001', 'Dr Chigozie Okoro', 'chigs@gmail.com', 3),
('VUG/ST/002', 'Dr Amaka Ogbonna', 'amaka@gmail.com', 4),
('VUG/ST/003', 'Dr Hugh Springfield', 'hspring@gmail.com', 5),
('VUG/ST/004', 'Prof Alan Begovic', 'alan@begovic.com', 6),
('VUG/ST/005', 'Mrs Zoe Motunrayo', 'zoe@gmail.com', 7),
('VUG/ST/006', 'Dr Elon Musk', 'elon@x.com', 3),
('VUG/ST/007', 'Prof Charles Onuoha', 'charles@gmail.com', 4),
('VUG/ST/008', 'Dr Vincent Jackman', 'vjack001@gmail.com', 5),
('VUG/ST/009', 'Dr Tony Stark', 'starkindustries@gmail.com', 6),
('VUG/ST/010', 'Mrs Ifeoma Ikechukwu', 'ify@gmail.com', 7);


INSERT INTO Student (matric_no, full_name, gender, date_of_birth, dept_id) VALUES
('VUG/SEN/24/11472', 'Franklin Opara', 'M', '2008-10-23', 3),
('VUG/COS/24/12134', 'Lauren James', 'F', '2008-10-20', 4),
('VUG/AIN/24/12314', 'James Miller', 'M', '2007-02-11', 5),
('VUG/DTS/24/11674', 'Maria Lopez', 'F', '2008-06-23', 6),
('VUG/CYB/24/17367', 'Daniel Brown', 'M', '2009-01-17', 7),
('VUG/SEN/24/11235', 'Emma Wilson', 'F', '2007-09-05', 3),
('VUG/COS/24/13896', 'Carlos Garcia', 'M', '2008-03-30', 4),
('VUG/AIN/24/11112', 'Sophia Martinez', 'F', '2009-07-14', 5),
('VUG/DTS/24/12351', 'Michael Taylor', 'M', '2007-12-02', 6),
('VUG/CYB/24/14628', 'Isabella Rodriguez', 'F', '2008-10-19', 7),
('VUG/SEN/24/14783', 'David Anderson', 'M', '2009-04-08', 3),
('VUG/COS/24/12456', 'Olivia Davis', 'F', '2007-05-26', 4),
('VUG/AIN/24/15627', 'Luis Hernandez', 'M', '2008-08-13', 5),
('VUG/DTS/24/12458', 'Emily Thompson', 'F', '2009-11-21', 6),
('VUG/CYB/24/11557', 'Ryan Clark', 'M', '2007-10-09', 7),
('VUG/SEN/24/11862', 'Ana Torres', 'F', '2008-01-28', 3),
('VUG/COS/24/17939', 'Joseph Harris', 'M', '2009-06-03', 4),
('VUG/AIN/24/16279', 'Grace Lewis', 'F', '2007-03-15', 5),
('VUG/DTS/24/17516', 'Jorge Ramirez', 'M', '2008-12-07', 6),
('VUG/CYB/24/13245', 'Hannah Young', 'F', '2009-02-24', 7);

SELECT student_id, matric_no, full_name FROM Student;
SELECT * FROM Course;
SELECT lecturer_id, full_name FROM Lecturer;

INSERT INTO Enrolment(student_id, course_id) VALUES
-- Software Engineering
(1, 1), (1, 2), (6, 1), (6, 2), (11, 1), (11, 2), (16, 1), (16, 2),

-- Computer Science
(2, 3), (2, 4), (7, 3), (7, 4), (12, 3), (12, 4), (17, 3), (17, 4),

-- Artificial Intelligence
(3, 5), (3, 6), (3, 7), (8, 5), (8, 6), (8, 7), (13, 5), (13, 6), (13, 7), (18, 5), (18, 6), (18, 7),

-- Data Science
(4, 8), (4, 9), (9, 8), (9, 9), (14, 8), (14, 9), (19, 8), (19, 9),

-- Cyber Security
(5, 10), (10, 10), (15, 10), (20, 10);

SELECT * FROM Enrolment;

INSERT INTO Student (matric_no, full_name, gender, date_of_birth, dept_id) VALUES
('VUG/SEN/24/11672', 'Moise Kean', 'M', '2003-10-23', 3),
('VUG/COS/24/17834', 'Mickie James', 'F', '2004-10-20', 4);

SELECT * FROM Lecturer;
SELECT * FROM Course;
SELECT * FROM Department;

INSERT INTO CourseAllocation (course_id, lecturer_id) VALUES
(10, 5), (10, 10), (1, 1), (2, 6), (3, 2), (4, 7), (5, 3), (6, 8), (8, 4), (9, 9)  ;

select * from CourseAllocation;

SELECT matric_no, full_name, dept_id FROM Student WHERE matric_no = 'VUG/COS/24/13896';
UPDATE Student SET dept_id = 3 WHERE matric_no = 'VUG/COS/24/13896';
SELECT matric_no, full_name, dept_id FROM Student WHERE matric_no = 'VUG/COS/24/13896';

INSERT INTO Department (dept_name) VALUES ('Library and Information Science');
INSERT INTO Student (matric_no, full_name, dept_id)
VALUES ('20239999', 'Transfer Student',
(SELECT dept_id FROM Department WHERE dept_name = 'Library and Information Science'));

DELETE FROM Department WHERE dept_name = 'Library and Information Science';


-- Step 1: reassign the dependent student to another department
UPDATE Student
SET dept_id = (SELECT dept_id FROM Department

WHERE dept_name = 'Software Engineering')

WHERE matric_no = '20239999';
-- Step 2: now the delete succeeds
DELETE FROM Department WHERE dept_name = 'Library and Information Science';
SELECT * FROM Department;


SELECT 'Departments' AS tbl, COUNT(*) AS total FROM Department
UNION ALL SELECT 'Lecturers', COUNT(*) FROM Lecturer
UNION ALL SELECT 'Students', COUNT(*) FROM Student
UNION ALL SELECT 'Courses', COUNT(*) FROM Course
UNION ALL SELECT 'Enrolments', COUNT(*) FROM Enrolment
UNION ALL SELECT 'Allocations', COUNT(*) FROM CourseAllocation;