CREATE TABLE teacher (
  teacher_id INT PRIMARY KEY,
  gender VARCHAR(10) NOT NULL CHECK (gender IN ('Male', 'Female', 'Other')),
  name VARCHAR(50) NOT NULL,
  date_of_birth DATE NOT NULL,
  blood_group VARCHAR(10) NOT NULL,
  address VARCHAR(100) NOT NULL,
  phone_number VARCHAR(20) NOT NULL,
  salary INT NOT NULL CHECK (salary >= 0)
);

CREATE TABLE student (
  student_id INT PRIMARY KEY,
  class_id INT NOT NULL,
  gender VARCHAR(10) NOT NULL CHECK (gender IN ('Male', 'Female', 'Other')),
  name VARCHAR(50) NOT NULL,
  date_of_birth DATE NOT NULL,
  blood_group VARCHAR(10) NOT NULL,
  address VARCHAR(100) NOT NULL,
  phone_number VARCHAR(20) NOT NULL,
  FOREIGN KEY (class_id) REFERENCES class (class_id)
);

CREATE TABLE class (
    class_id INT PRIMARY KEY,
    total_student INT NOT NULL
);

CREATE TABLE subject (
    subject_code VARCHAR(10) PRIMARY KEY,
    subject_name VARCHAR(50),
    class_id INT,
    FOREIGN KEY (class_id) REFERENCES class(class_id)
);

CREATE TABLE result (
    student_id INT,
    subject_code VARCHAR(10),
    mark INT,
    gpa DECIMAL(3,2),
    grade VARCHAR(2),
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (subject_code) REFERENCES subject(subject_code)
);
