--Student Table

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

--Faculty Table

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

--Class Table

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
