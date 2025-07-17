CREATE TABLE location (
    building VARCHAR(100) NOT NULL,
    room_no VARCHAR(20) NOT NULL,
    floor INT,
    PRIMARY KEY (building, room_no)
);

CREATE TABLE courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(255) NOT NULL,
    course_code VARCHAR(50) NOT NULL UNIQUE,
    description TEXT,
    class_id INT NOT NULL,
    building VARCHAR(100) NOT NULL,
    room_no VARCHAR(20) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (class_id) REFERENCES classes(class_id) ON DELETE CASCADE,
    FOREIGN KEY (building, room_no) REFERENCES location(building, room_no),

    INDEX idx_class_id (class_id),
    INDEX idx_course_code (course_code),
    INDEX idx_location (building, room_no)
);

CREATE TABLE course_materials (
    material_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    file_type ENUM('notes', 'slides', 'assignment', 'other') NOT NULL,
    file_url VARCHAR(500) NOT NULL,
    uploaded_by_faculty_id INT NULL,
    uploaded_by_student_roll_number VARCHAR(20) NULL,
    version INT DEFAULT 1,
    notification_flag BOOLEAN DEFAULT TRUE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    FOREIGN KEY (course_id) REFERENCES courses(course_id),
    FOREIGN KEY (uploaded_by_faculty_id) REFERENCES faculty(faculty_id) ON DELETE SET NULL,
    FOREIGN KEY (uploaded_by_student_roll_number) REFERENCES students(roll_number) ON DELETE SET NULL,

    INDEX idx_course_id (course_id),
    INDEX idx_file_type (file_type),
    INDEX idx_created_at (created_at)
);

CREATE TABLE announcements (
    announcement_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    created_by_faculty_id INT NULL,
    created_by_student_roll_number VARCHAR(20) NULL,
    notification_flag BOOLEAN DEFAULT TRUE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (course_id) REFERENCES courses(course_id),
    FOREIGN KEY (created_by_faculty_id) REFERENCES faculty(faculty_id) ON DELETE SET NULL,
    FOREIGN KEY (created_by_student_roll_number) REFERENCES students(roll_number) ON DELETE SET NULL,

    INDEX idx_course_id (course_id),
    INDEX idx_created_at (created_at)
);

CREATE TABLE material_comments (
    comment_id INT AUTO_INCREMENT PRIMARY KEY,
    material_id INT NOT NULL,
    user_faculty_id INT NULL,
    user_student_roll_number VARCHAR(20) NULL,
    comment TEXT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (material_id) REFERENCES course_materials(material_id),
    FOREIGN KEY (user_faculty_id) REFERENCES faculty(faculty_id) ON DELETE SET NULL,
    FOREIGN KEY (user_student_roll_number) REFERENCES students(roll_number) ON DELETE SET NULL,

    INDEX idx_material_id (material_id),
    INDEX idx_user_faculty_id (user_faculty_id),
    INDEX idx_user_student_roll_number (user_student_roll_number),
    INDEX idx_created_at (created_at)
);
