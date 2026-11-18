-- ============================================
-- VUA-SEN307 Lab 5: SELECT, Filtering and Joins
-- Name: __Franklin Chiemerie Opara__ Matric: __VUG/SEN/24/11472__
-- ============================================
USE sen307_vug_sen_24_11472;
-- Task 1: Students in one department, sorted A-Z
SELECT s.student_id, s.full_name, d.dept_name
FROM Student s
INNER JOIN Department d ON s.dept_id = d.dept_id
WHERE d.dept_name = 'Software Engineering'
ORDER BY s.full_name ASC;
-- Explanation: 
/*	Because department names are stored in the Department table rather than directly inside the Student table, 
	this query uses an INNER JOIN on dept_id to link each student to their department. It then filters the results 
	to show only students in Software Engineering and sorts them alphabetically from A to Z by their full name.
*/

-- Task 2: Courses with their lecturers (INNER JOIN)
SELECT c.course_code, c.course_title, l.full_name AS lecturer_name
FROM Course c
INNER JOIN CourseAllocation ca ON c.course_id = ca.course_id
INNER JOIN Lecturer l ON ca.lecturer_id = l.lecturer_id
ORDER BY c.course_code;
-- Explanation: 
/*	Since a single course can be taught by multiple lecturers and a lecturer can teach multiple courses, 
	CourseAllocation acts as a bridge table between them. Using two INNER JOINs connects Course to CourseAllocation 
    and then to Lecturer, returning only courses that currently have an assigned lecturer—with multi-lecturer 
    courses appearing once per lecturer.
*/

-- Task 3: Students and their courses (LEFT JOIN)
-- Part A: All students and their courses
SELECT s.full_name, c.course_title
FROM Student s
LEFT JOIN Enrolment e ON s.student_id = e.student_id
LEFT JOIN Course c ON e.course_id = c.course_id
ORDER BY s.full_name;

-- Part B: Only students with NO enrolments
SELECT s.full_name, c.course_title
FROM Student s
LEFT JOIN Enrolment e ON s.student_id = e.student_id
LEFT JOIN Course c ON e.course_id = c.course_id
WHERE c.course_title IS NULL
ORDER BY s.full_name;
-- Explanation: 
/*	A LEFT JOIN starting from the Student table ensures that every student appears in the output even if they have 
	not enrolled in any courses yet (leaving their course_title as NULL). Adding WHERE c.course_title IS NULL in 
    the second query filters out enrolled students so we can isolate and inspect only the students with zero 
    enrolments.
*/

-- Task 4: Filtering with AND / OR / IN / BETWEEN
SELECT student_id, full_name, gender, dept_id, date_of_birth
FROM Student
WHERE (gender = 'F' OR gender = 'M')
AND dept_id IN (3, 5)
AND date_of_birth BETWEEN '2007-01-01' AND '2008-12-31'
ORDER BY full_name;
-- Explanation: 
/*	This query narrows down the Student table using multiple conditions at once: IN checks whether a student belongs 
	to a specific list of department IDs, BETWEEN filters for birth dates within an inclusive two-year range, and 
	parentheses around the OR condition ensure SQL evaluates the gender check together before applying the rest of 
    the AND filters.
*/

-- Task 5: Paginating enrolments with LIMIT and OFFSET
-- Page 1 (Rows 1-10)
SELECT *
FROM Enrolment
ORDER BY enrolment_id ASC
LIMIT 10 OFFSET 0;

-- Page 2 (Rows 11-20)
SELECT *
FROM Enrolment
ORDER BY enrolment_id ASC
LIMIT 10 OFFSET 10;
-- Explanation: 
/*	To display large tables in manageable pages, LIMIT restricts the output to 10 rows while OFFSET skips the rows 
	already shown on previous pages (skipping 0 for page 1, and 10 for page 2). Including ORDER BY enrolment_id is 
    essential because without explicit sorting, SQL does not guarantee a fixed row order—which could cause records 
    to repeat or get skipped between pages.
*/

-- Optional
SELECT s.full_name, c.course_title
FROM Course c
INNER JOIN Enrolment e ON c.course_id = e.course_id
RIGHT JOIN Student s ON e.student_id = s.student_id
ORDER BY s.full_name;
-- Explanation: 
/*	Placing the Student table on the right side of a RIGHT JOIN preserves all student records just like the LEFT 
	JOIN in Task 3, producing the exact same result set. However, the LEFT JOIN version is much easier to read and 
    maintain because it follows a natural left-to-right flow starting from our main subject (Student) and moving 
    outward to optional related records (Enrolment and Course).
*/