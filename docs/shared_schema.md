
### Shared Schema
Guys, instead of users, we will have students and faculty.

Student Table 
```
CREATE TABLE students (
    roll_number VARCHAR(20) PRIMARY KEY, -- Format: CB.SC.U4AIE23225
    email VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL, -- Using bcrypt hash (optimal for security)
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    class_id INT NOT NULL,
    admission_year INT NOT NULL,
    cgpa DECIMAL(3,2) DEFAULT 0.00,
    is_active BOOLEAN DEFAULT TRUE,
    email_verified BOOLEAN DEFAULT FALSE,
    last_login DATETIME NULL,

    FOREIGN KEY (class_id) REFERENCES classes(class_id) ON DELETE RESTRICT,

    INDEX idx_email (email),
    INDEX idx_class (class_id),
    INDEX idx_admission_year (admission_year),
    INDEX idx_active (is_active)
);
```
Faculty Table
```
CREATE TABLE faculty (
    faculty_id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL, -- Using bcrypt hash
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    faculty_role ENUM('professor', 'associate_professor', 'assistant_professor', 'advisor', 'hod', 'dean', 'admin') NOT NULL,
    specialization VARCHAR(100),
    qualifications VARCHAR(200),
    experience_years INT DEFAULT 0,
    admission_date DATE,
    is_active BOOLEAN DEFAULT TRUE,
    email_verified BOOLEAN DEFAULT FALSE,
    last_login DATETIME NULL,

    INDEX idx_employee_id (employee_id),
    INDEX idx_email (email),
    INDEX idx_faculty_role (faculty_role),
    INDEX idx_active (is_active)
);
```

Courses Table
```
CREATE TABLE courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(255) NOT NULL,
    course_code VARCHAR(50) NOT NULL UNIQUE,
    description TEXT,
    class_id INT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (class_id) REFERENCES classes(class_id) ON DELETE CASCADE,

    INDEX idx_class_id (class_id),
    INDEX idx_course_code (course_code)
);
```

Purpose: Stores course information, linked to events, timetables, and resources.
Columns:
course_id: Primary key, auto-incremented.
course_name: Name of the course.
course_code: Unique code for the course.
description: Course description.
class: Enum for AIE classes, added to support class-specific filtering.
created_at: Timestamp for creation.


i feel like we might need multiple tables beacuse the one that she explained in class looked complex 
so when u create lmk ill make edits in mine


Location table
```
CREATE TABLE location (
    building VARCHAR(100) NOT NULL,
    room_no VARCHAR(20) NOT NULL,
    floor INT,

    PRIMARY KEY (building, room_no)
);
```
Class Table 
```
CREATE TABLE classes (
    class_id INT AUTO_INCREMENT PRIMARY KEY,
    class_name VARCHAR(50) NOT NULL, 
    start_year INT NOT NULL,
    semester INT NOT NULL,
    section ENUM('A', 'B', 'C', 'D', 'E', 'F') NOT NULL, 
    advisor_id INT NULL, 
    cr_student_id INT NULL, 
    building VARCHAR(100) NOT NULL,
    room_no VARCHAR(20) NOT NULL,
    current_strength INT NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,

    FOREIGN KEY (advisor_id) REFERENCES faculty(faculty_id) ON DELETE SET NULL,
    FOREIGN KEY (cr_student_id) REFERENCES students(student_id) ON DELETE SET NULL,
    FOREIGN KEY (building, room_no) REFERENCES location(building, room_no) ON DELETE RESTRICT,

    INDEX idx_start_year (start_year),
    INDEX idx_semester (semester),
    INDEX idx_section (section),
    INDEX idx_advisor (advisor_id),
    INDEX idx_cr_student (cr_student_id),
    INDEX idx_building_room (building, room_no),
    INDEX idx_active (is_active)
);
```
