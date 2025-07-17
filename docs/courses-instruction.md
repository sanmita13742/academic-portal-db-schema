Objective: Design the SQL schema for the Course Dump Module to manage course materials, announcements, and enhancements like version tracking and commenting.

Instructions:

Reference Shared Schema: Use the users and courses tables from shared_schema.md for teacher, student, and course data.



Core Tables:





Create a course_materials table for lecture notes, slides, and assignments:





Columns: material_id (PK), course_id (FK to courses), title (varchar), description (text), file_type (enum: notes, slides, assignment, other), file_url (varchar), uploaded_by (FK to users), version (int), created_at (timestamp), updated_at (timestamp).



Create an announcements table for class-related updates:





Columns: announcement_id (PK), course_id (FK to courses), title (varchar), content (text), created_by (FK to users), created_at (timestamp).



Create a material_comments table for commenting/Q&A on resources:





Columns: comment_id (PK), material_id (FK to course_materials), user_id (FK to users), comment (text), created_at (timestamp).



Constraints:





Ensure file_type is an enum as specified.



Add foreign keys for course_id, uploaded_by, and user_id.



Enforce version tracking by incrementing version on updates.



Enhancements:





Add indexes on course_id, file_type, and created_at for efficient browsing.



Include a notification_flag in course_materials and announcements for new upload/update notifications.



Support timestamping via updated_at for version tracking.

Notes:

Ensure file_url supports cloud storage links (e.g., S3, Google Drive).



Coordinate with the team to align courses table usage across modules.
