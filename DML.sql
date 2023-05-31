INSERT INTO teacher (teacher_id, gender, name, date_of_birth, blood_group, address, phone_number,salary)
VALUES 
    (1, 'Male', 'Rahim Khan', '1990-01-01', 'A+', '123 Main St, City', '01516486998',30000),
    (2, 'Female', 'Akhi Biswas', '1985-05-15', 'O-', '456 Elm St, Town', '01916784498',35000),
    (3, 'Male', 'Mohammad Adrar', '1982-09-30', 'B+', '789 Oak Ave, Village', '01816787998',40000),
    (4, 'Female', 'Rajia Khatun', '1995-07-20', 'AB-', '321 Pine Dr, County', '01716786998',32000),
    (5, 'Male', 'Abdul Karim', '1992-03-12', 'O+', '567 Maple Rd, City', '01916756998',42000),
    (6, 'Female', 'Himu Khanam', '1988-11-25', 'A-', '890 Cedar Ln, Town', '01946786998',40000),
    (7, 'Male', 'Mohammad Zakariya', '1984-04-18', 'B-', '234 Birch Ct, Village', '01816786998',35000),
    (8, 'Female', 'Zakia Sultana', '1997-02-05', 'AB+', '678 Pine St, County', '01936786998',38000),
    (9, 'Male', 'Abir Ahmed', '1993-08-09', 'O-', '432 Elm Dr, City', '01916726998',30000),
    (10, 'Female', 'Faria Sultana', '1991-06-27', 'A+', '765 Oak Rd, Town', '01916786198',50000);

    INSERT INTO student (student_id, class_id, gender, name, date_of_birth, blood_group, address, phone_number)
VALUES 
    (1, 101, 'Male', 'Abir', '2010-01-01', 'A+', '123 Main St, City', '01789676993'),
    (2, 101, 'Female', 'Rima', '2010-05-15', 'O-', '456 Elm St, Town', '01889776993'),
    (3, 102, 'Male', 'Hasan', '2011-09-30', 'B+', '789 Oak Ave, Village', '01789776993'),
    (4, 103, 'Female', 'Zakia', '2009-07-20', 'AB-', '123 Main St, City', '01789676993'),
    (5, 102, 'Male', 'Redwan', '2010-03-12', 'O+', '567 Maple Rd, City', '01789611993'),
    (6, 103, 'Female', 'Samia', '2010-11-25', 'A-', '890 Cedar Ln, Town', '01789673393'),
    (7, 104, 'Male', 'Sakib', '2011-04-18', 'B-', '234 Birch Ct, Village', '01955476993'),
    (8, 104, 'Female', 'Sharmin', '2010-02-05', 'AB+', '678 Pine St, County', '01967676993'),
    (9, 101, 'Male', 'Rakib', '2009-08-09', 'O-', '234 Birch Ct, Village', '01955476993'),
    (10, 102, 'Female', 'Ramia', '2009-06-27', 'A+', '765 Oak Rd, Town', '01789677393');


INSERT INTO class (class_id, total_student)
VALUES 
    (101, 45),
    (102, 40),
    (103, 48),
    (104, 52),
    (105, 37),
    (106, 49),
    (107, 46),
    (108, 51),
    (109, 50),
    (110, 39);

    INSERT INTO subject (subject_code, subject_name, class_id)
VALUES 
    ('ENG101', 'English', 101),
    ('MATH201', 'Mathematics', 102),
    ('SCI301', 'Science', 103),
    ('HIS401', 'History', 104),
    ('PHY501', 'Physics', 101),
    ('CHEM601', 'Chemistry', 103),
    ('BIO701', 'Biology', 103),
    ('GEO801', 'Geography', 102),
    ('COMP901', 'Computer Science', 104),
    ('ARTS1001', 'Arts', 110);


    INSERT INTO result (student_id, subject_code, mark, gpa, grade)
VALUES 
    (1, 'ENG101', 85, 3.5, 'A'),
    (2, 'MATH201', 92, 4.0, 'A+'),
    (3, 'SCI301', 78, 3.0, 'B'),
    (4, 'HIS401', 88, 3.7, 'A-'),
    (5, 'PHY501', 90, 3.9, 'A-'),
    (6, 'CHEM601', 75, 2.8, 'B-'),
    (7, 'BIO701', 80, 3.2, 'B'),
    (8, 'GEO801', 93, 4.0, 'A+'),
    (9, 'COMP901', 87, 3.6, 'A-'),
    (10, 'ARTS1001', 82, 3.3, 'B+');


    1.(Retrieve the count of male and female teachers)
SELECT gender, COUNT(*) AS count FROM teacher GROUP BY gender;

2.(Retrieve teachers with a specific blood group and sort them by age in descending order)
SELECT * FROM teacher WHERE blood_group = 'A+' ORDER BY date_of_birth DESC;

3.(Retrieve the count of teachers with a salary above a certain threshold (e.g., 5000):)
SELECT COUNT(*) AS count FROM teacher WHERE salary > 35000;

4.(Retrieve teachers with the highest salary in each gender)
SELECT * FROM teacher t1 WHERE salary = (SELECT MAX(salary) FROM teacher t2 WHERE t1.gender = t2.gender);

5.(Retrieve teachers who have a salary higher than the lowest salary among male teachers)
SELECT * FROM teacher WHERE salary > (SELECT MIN(salary) FROM teacher WHERE gender = 'Male');

6.(Retrieve the longest name among all teachers)
SELECT MAX(LENGTH(name)) AS max_length FROM teacher;

7.(Retrieve teachers who have the same salary as the Second highest salary among female teachers)
SELECT * FROM teacher WHERE salary = (SELECT MAX(salary) FROM teacher WHERE salary < (SELECT MAX(salary) FROM teacher WHERE gender = 'Female'));

1.(Retrieve students who have the same phone number)
SELECT phone_number, COUNT(*) AS count FROM student GROUP BY phone_number HAVING COUNT(*) > 1;

2.(Retrieve the oldest student in each class)
SELECT class_id, MAX(DATEDIFF(CURRENT_DATE(), date_of_birth)) AS oldest_age FROM student GROUP BY class_id;

3.(Retrieve students who have the same address as any other student)
SELECT * FROM student WHERE address IN (SELECT address FROM student GROUP BY address HAVING COUNT(*) > 1);

4.(Retrieve students who have a higher age than the average age of students in their class)
SELECT * FROM student WHERE DATEDIFF(CURRENT_DATE(), date_of_birth) > (SELECT AVG(DATEDIFF(CURRENT_DATE(), date_of_birth)) FROM student WHERE class_id = 1);

5.(Retrieve students who have a lower age than the average age of students with a specific blood group)
SELECT * FROM student WHERE DATEDIFF(CURRENT_DATE(), date_of_birth) < (SELECT AVG(DATEDIFF(CURRENT_DATE(), date_of_birth)) FROM student WHERE blood_group = 'A+');

1.(Retrieve classes that have more students than the average number of students)
SELECT * FROM class WHERE total_students > (SELECT AVG(total_students) FROM class);

2.(Join table class and student)
SELECT s.student_id, s.name, s.gender, s.phone_number, c.class_id, c.total_student
FROM student s
JOIN class c ON s.class_id = c.class_id;

3.
SELECT s.student_id, s.name, s.gender, s.date_of_birth, s.blood_group, s.address, s.phone_number
FROM student s
JOIN class c ON s.class_id = c.class_id
WHERE c.total_student = 40;

1.
SELECT st.student_id, st.name, st.gender, st.date_of_birth, st.blood_group, st.address, st.phone_number, c.class_id, c.total_student, su.subject_code, su.subject_name
FROM student st
JOIN class c ON st.class_id = c.class_id
JOIN subject su ON c.class_id = su.class_id;

