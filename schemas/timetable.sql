--timetables table
CREATE TABLE timetables (
    timetable_id INT AUTO_INCREMENT PRIMARY KEY,
    slot_no INT NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    day ENUM('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday') NOT NULL,
    room VARCHAR(50),
    teacher_id INT NOT NULL,
    course_id INT NOT NULL,
    class_sec INT NOT NULL,

    -- Foreign Key Constraints
    FOREIGN KEY (course_id) REFERENCES courses(course_id),
    FOREIGN KEY (class_sec) REFERENCES class(class_id),
    FOREIGN KEY (teacher_id) REFERENCES users(user_id)
);

