Objective: Build the SQL schema for the Open Projects Platform to support project creation, applications, notifications, and enhancements like filtering and progress tracking.

Instructions:

Reference Shared Schema: Use the users and courses tables from shared_schema.md for student, teacher, and course data.

Core Tables:

Create a projects table for project details:

Columns: project_id (PK), title (varchar), description (text), capacity (int), skills_required (text), course_id (FK to courses), creator_id (FK to users), mentor_id (FK to users, nullable), status (enum: open, closed), created_at (timestamp).

Create a project_applications table for student applications:

Columns: application_id (PK), project_id (FK to projects), student_id (FK to users), status (enum: pending, accepted, rejected), applied_at (timestamp).

Create a project_notifications table for application status updates:


Columns: notification_id (PK), application_id (FK to project_applications), message (text), created_at (timestamp).

Constraints:

Ensure status in projects and project_applications are enums.

Add foreign keys for course_id, creator_id, mentor_id, and student_id.

Enforce capacity limits via application logic or triggers.

Enhancements:

Add indexes on skills_required, course_id, and status for filtering.

Include a progress field in projects for status updates (e.g., JSON or text).
Support mentor tagging by allowing mentor_id to reference users with role = teacher.

Notes:

Discuss with the team if skills_required should be a separate table for normalization.

Ensure notification system integrates with project_applications for real-time updates.
