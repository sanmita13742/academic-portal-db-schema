--timetables table
CREATE TABLE timetables (
    timetable_id INT AUTO_INCREMENT PRIMARY KEY,
    slot_no INT NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    day ENUM('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday') NOT NULL,
    room VARCHAR(50),
    faculty_id INT NOT NULL,
    course_id INT NOT NULL,
    section INT NOT NULL,

    -- Foreign Key Constraints
    FOREIGN KEY (course_id) REFERENCES courses(course_id),
    FOREIGN KEY (section) REFERENCES classes(class_id),
    FOREIGN KEY (faculty_id) REFERENCES faculty(faculty_id)
);

--timetable_metadata table
CREATE TABLE timetable_metadata (
    metadata_id INT AUTO_INCREMENT PRIMARY KEY,
    timetable_id INT NOT NULL,
    export_format ENUM('PDF', 'image') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    -- Foreign Key Constraint
    FOREIGN KEY (timetable_id) REFERENCES timetables(timetable_id)
);
