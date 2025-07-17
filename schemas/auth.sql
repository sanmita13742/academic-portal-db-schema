
CREATE TABLE faculty (
    faculty_id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
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

    INDEX idx_email (email),
    INDEX idx_faculty_role (faculty_role),
    INDEX idx_active (is_active)
);

CREATE TABLE students (
    roll_number VARCHAR(20) PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
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


CREATE TABLE classes (
    class_id INT AUTO_INCREMENT PRIMARY KEY,
    class_name VARCHAR(50) NOT NULL,
    start_year INT NOT NULL,
    semester INT NOT NULL,
    section ENUM('A', 'B', 'C', 'D', 'E', 'F') NOT NULL,
    advisor_id INT NULL,
    cr_student_id VARCHAR(20) NULL,
    building VARCHAR(100) NOT NULL,
    room_no VARCHAR(20) NOT NULL,
    current_strength INT NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,

    FOREIGN KEY (advisor_id) REFERENCES faculty(faculty_id) ON DELETE SET NULL,
    FOREIGN KEY (cr_student_id) REFERENCES students(roll_number) ON DELETE SET NULL,
    FOREIGN KEY (building, room_no) REFERENCES location(building, room_no) ON DELETE RESTRICT,

    INDEX idx_start_year (start_year),
    INDEX idx_semester (semester),
    INDEX idx_section (section),
    INDEX idx_advisor (advisor_id),
    INDEX idx_cr_student (cr_student_id),
    INDEX idx_building_room (building, room_no),
    INDEX idx_active (is_active)
);

CREATE TABLE sessions (
    session_id INT AUTO_INCREMENT PRIMARY KEY,
    user_type ENUM('student', 'faculty') NOT NULL,
    user_id VARCHAR(255) NOT NULL, -- roll_number or faculty_id
    token TEXT NOT NULL,
    token_type ENUM('access', 'refresh') DEFAULT 'access',
    device_info VARCHAR(255),
    ip_address VARCHAR(45),
    user_agent TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    expires_at DATETIME NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,

    INDEX idx_user_type_id (user_type, user_id),
    INDEX idx_token_hash (token(64)),
    INDEX idx_expires_at (expires_at),
    INDEX idx_active (is_active)
);


CREATE TABLE password_resets (
    reset_id INT AUTO_INCREMENT PRIMARY KEY,
    user_type ENUM('student', 'faculty') NOT NULL,
    user_id VARCHAR(255) NOT NULL,
    reset_token VARCHAR(255) NOT NULL UNIQUE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    expires_at DATETIME NOT NULL,
    is_used BOOLEAN DEFAULT FALSE,
    used_at DATETIME NULL,
    ip_address VARCHAR(45),

    INDEX idx_user_type_id (user_type, user_id),
    INDEX idx_reset_token (reset_token),
    INDEX idx_expires_at (expires_at),
    INDEX idx_is_used (is_used)
);


CREATE TABLE registration_requests (
    request_id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    user_type ENUM('student', 'faculty') NOT NULL,

    -- Student-specific
    roll_number VARCHAR(20),
    admission_year INT,

    -- Faculty-specific
    faculty_role ENUM('professor', 'associate_professor', 'assistant_professor', 'advisor', 'hod', 'dean', 'admin'),
    qualifications VARCHAR(200),

    status ENUM('pending', 'approved', 'rejected') DEFAULT 'pending',
    approved_by_type ENUM('faculty') NULL,
    approved_by_id INT NULL,
    rejection_reason TEXT,
    processed_at DATETIME NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    INDEX idx_email (email),
    INDEX idx_status (status),
    INDEX idx_user_type (user_type),
    INDEX idx_roll_number (roll_number)
);
