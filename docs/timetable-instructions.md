##### Objective: Design the SQL schema for the Timetable Module to support weekly timetable views, admin management, and enhancements like export and filtering.

#### Instructions:

Reference Shared Schema: Use the courses table from shared_schema.md for course-related data (e.g., course_id, course_name).

#### Core Tables:

**Create a timetables table for timetable entries:**
Columns: timetable_id (PK), course_id (FK to courses), class (enum: AIE-A, AIE-B, AIE-C, AIE-D), day (enum: Monday, Tuesday, etc.), start_time (time), end_time (time), room (varchar), teacher_id (FK to users).

**Create a timetable_metadata table for admin-managed settings (e.g., export configurations):**
Columns: metadata_id (PK), timetable_id (FK to timetables), export_format (enum: PDF, image), created_at (timestamp).

**Constraints:**
Ensure class is an enum for AIE-A, AIE-B, AIE-C, AIE-D.
Add foreign keys for course_id and teacher_id.
Prevent overlapping time slots for the same class and day (use constraints or triggers if needed).

**Enhancements:**
Add indexes on class, day, and teacher_id for efficient filtering.
Include a description field for additional timetable details (e.g., special notes).
Support teacher-specific views by ensuring teacher_id queries are optimized.

**Notes:**
Discuss with the team if courses in shared_schema.md needs additional fields (e.g., class).
Ensure timetable data supports export functionality (e.g., PDF/image) via timetable_metadata.
