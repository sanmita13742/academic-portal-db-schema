-- Table for Batches entity (to be replaced with classes from auth.sql later if needed)
CREATE TABLE batches (
    batch_id INT PRIMARY KEY AUTO_INCREMENT,
    batch_name VARCHAR(50) UNIQUE NOT NULL,
    description TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Table for Events entity
CREATE TABLE events (
    event_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    event_type ENUM('exam', 'holiday', 'test', 'assignment', 'other') NOT NULL,
    start_date DATETIME NOT NULL,
    end_date DATETIME NOT NULL,
    created_by_faculty_id INT NULL,
    created_by_student_roll_number VARCHAR(20) NULL,
    is_global BOOLEAN DEFAULT FALSE,
    details TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (created_by_faculty_id) REFERENCES faculty(faculty_id) ON DELETE SET NULL,
    FOREIGN KEY (created_by_student_roll_number) REFERENCES students(roll_number) ON DELETE SET NULL
);

-- Table for Event Batches entity (to be replaced with event_classes later if needed)
CREATE TABLE event_batches (
    event_id INT NOT NULL,
    batch_id INT NOT NULL,
    PRIMARY KEY (event_id, batch_id),
    FOREIGN KEY (event_id) REFERENCES events(event_id) ON DELETE CASCADE,
    FOREIGN KEY (batch_id) REFERENCES batches(batch_id) ON DELETE CASCADE
);

-- Table for Event Courses entity
CREATE TABLE event_courses (
    event_id INT NOT NULL,
    course_id INT NOT NULL,
    PRIMARY KEY (event_id, course_id),
    FOREIGN KEY (event_id) REFERENCES events(event_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE
);

-- Table for Event Syncs entity
CREATE TABLE event_syncs (
    sync_id INT PRIMARY KEY AUTO_INCREMENT,
    event_id INT NOT NULL,
    user_type ENUM('student', 'faculty') NOT NULL,
    user_id VARCHAR(255) NOT NULL,
    sync_status ENUM('synced', 'pending') NOT NULL DEFAULT 'pending',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE (event_id, user_type, user_id),
    FOREIGN KEY (event_id) REFERENCES events(event_id) ON DELETE CASCADE
    -- Note: user_id will map to students.roll_number or faculty.faculty_id based on user_type
);

-- Indexes for performance
CREATE INDEX idx_events_event_type ON events(event_type);
CREATE INDEX idx_events_start_date ON events(start_date);
CREATE INDEX idx_events_end_date ON events(end_date);
CREATE INDEX idx_events_created_by_faculty ON events(created_by_faculty_id);
CREATE INDEX idx_events_created_by_student ON events(created_by_student_roll_number);
CREATE INDEX idx_event_batches_batch_id ON event_batches(batch_id);
CREATE INDEX idx_event_courses_course_id ON event_courses(course_id);
CREATE INDEX idx_event_syncs_event_id ON event_syncs(event_id);
CREATE INDEX idx_event_syncs_user_type_id ON event_syncs(user_type, user_id);
