
### Shared Schema
for creating my calendar i needed user and course keys 
ive structed two fields from courses and auth for now. if you are changing it, do ping me

Table/column names: snake_case (e.g., user_id, course_name).
Primary keys: <table_name>_id (e.g., user_id).
Timestamps: created_at, updated_at (use DATETIME for MySQL).
Enums: Use MySQL ENUM for fixed-value fields (e.g., role, status).
Foreign keys: Reference the parent table’s primary key (e.g., user_id references users.user_id).

Common Table Definitions
Users Table
```
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    role ENUM('student', 'teacher', 'advisor', 'assistant_faculty', 'admin') NOT NULL,
    is_cr BOOLEAN DEFAULT FALSE,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
```

Purpose: Stores user information for authentication and role-based access.
Columns:
user_id: Primary key, auto-incremented.
email: Unique email for login. (i think you might have do do smth to extract roll no from this or verfiy if the student is actually from aie from the email itself)

password_hash: Hashed password for security.
role: Enum for user roles, expanded to include advisor and assistant_faculty. (idk if this is scalable tho)
is_cr: Boolean flag to identify students who are class representatives. (again might have multiple crs make that scalable too)
first_name, last_name: User’s name. (this one idk)
created_at, updated_at: Timestamps for tracking. (crucial)



Courses Table
```
CREATE TABLE courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(255) NOT NULL,
    course_code VARCHAR(50) NOT NULL UNIQUE,
    description TEXT,
    class ENUM('AIE-A', 'AIE-B', 'AIE-C', 'AIE-D') NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
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
    admission_year INT NOT NULL,
    semester INT NOT NULL, 
    section ENUM('A', 'B', 'C', 'D', 'E', 'F') NOT NULL, 
    advisor_id INT NULL, 
    cr_student_id INT NULL, 
    location_id INT NOT NULL, 
    current_strength INT NOT NULL, 
    is_active BOOLEAN DEFAULT TRUE,
    
    INDEX idx_start_year (start_year),
    INDEX idx_semester (semester),
    INDEX idx_section (section),
    INDEX idx_advisor (advisor_id),
    INDEX idx_cr_student (cr_student_id),
    INDEX idx_location (location_id),
    INDEX idx_active (is_active)
);
```

