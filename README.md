# academic-portal-db-schema
AIE Academic Platform
This repository contains the backend schema design for an academic platform supporting Authentication, Timetable, Amrita Calendar, Open Projects, and Course Dump modules for Amrita Institute of Engineering (AIE) classes (AIE-A, AIE-B, AIE-C, AIE-D). The project is developed collaboratively by a four-member team, with each member responsible for specific schema files and contributing to shared documentation.
```
Repository Structure
├── docs/
│   ├── auth-instructions.md        # Instructions for Authentication Module schema
│   ├── calendar-instructions.md    # Instructions for Amrita Calendar Module schema
│   ├── timetable.md               # Instructions for Timetable Module schema
│   └── shared_schema.md           # Global naming conventions and common table definitions
├── er-diagrams/
│   ├── sample-Diagram.drawio      # Sample ER diagram (update with module-specific diagrams)
│   └── sample.txt                 # Placeholder for ER diagram notes
├── schemas/
│   ├── auth.sql                   # SQL schema for Authentication Module
│   ├── calendar.sql               # SQL schema for Amrita Calendar Module
│   ├── courses.sql                # SQL schema for Course Dump Module
│   ├── projects.sql               # SQL schema for Open Projects Platform
│   └── timetable.sql              # SQL schema for Timetable Module
└── README.md                      # This file
```
Project Overview
The platform supports the following modules, each with specific features and enhancements as outlined in the respective instruction files under docs/:

Authentication Module (auth.sql): Secure, role-based login system for students, teachers, and admins with session management, password reset, and registration approval.
Timetable Module (timetable.sql): Weekly timetable views for AIE classes, admin management, and export/filtering capabilities.
Amrita Calendar Module (calendar.sql): View-only academic calendar with events, test announcements, and syncing/filtering features.
Open Projects Platform (projects.sql): Student-led project creation, application workflow, notifications, and filtering/mentorship features.
Course Dump Module (courses.sql): Centralized platform for course materials, announcements, and version tracking/commenting.

Team Responsibilities
Each member is assigned a specific SQL schema file under schemas/ and must contribute to docs/shared_schema.md for shared table definitions and naming conventions. Refer to the respective instruction files in docs/ for detailed tasks:

Member 1: Develop auth.sql (see docs/auth-instructions.md).
Member 2: Develop timetable.sql (see docs/timetable.md).
Member 3: Develop calendar.sql (see docs/calendar-instructions.md).
Member 4: Develop projects.sql and courses.sql (refer to instructions provided separately).

All members must:

Update docs/shared_schema.md with proposed changes to common tables (users, courses) or naming conventions.
Create and update ER diagrams in er-diagrams/ for their respective modules.

Getting Started
Prerequisites

Git: Ensure Git is installed for version control.
Installation: Download from Git Downloads.


Draw.io: Use Draw.io for creating/updating ER diagrams.
Desktop: Download from Draw.io Desktop.
Web: Use app.diagrams.net for online editing.
GitHub Authorization:
Go to app.diagrams.net.
Click "File" > "Open from" > "GitHub".
Authorize Draw.io to access your GitHub account by signing in and granting permissions.
Select your repository and branch to open/save .drawio files (e.g., er-diagrams/sample-Diagram.drawio).


SQL Plugin for Draw.io:
In Draw.io, go to "Extras" > "Plugins" > "SQL".
Enable the SQL plugin to import SQL schemas and auto-generate ER diagrams.
Import your .sql file (e.g., schemas/auth.sql) to visualize tables and relationships.
Save the generated diagram as a .drawio file in er-diagrams/.
Use the plugin to export updated SQL if needed, but manually verify changes.


Setup




Development Guidelines
Schema Development

Follow Instructions: Adhere to the module-specific instructions in docs/ for your assigned schema (auth.sql, timetable.sql, calendar.sql, projects.sql, courses.sql).
Use Shared Schema: Reference docs/shared_schema.md for common tables (users, courses) and naming conventions (e.g., snake_case, created_at timestamps).
Database: Use MySQL with support for enums, JSON, and timestamps. Note that MySQL uses ENUM for fixed-value fields and DATETIME or TIMESTAMP for timestamps.
Constraints: Implement primary keys, foreign keys, unique constraints, and indexes as specified.
Testing: Test your schema locally to ensure no syntax errors or constraint violations.

Shared Schema (docs/shared_schema.md)

Naming Conventions:
Table/column names: snake_case (e.g., user_id, course_name).
Primary keys: <table_name>_id (e.g., user_id).
Timestamps: created_at, updated_at (use DATETIME or TIMESTAMP).
Enums: Use MySQL ENUM for fixed-value fields (e.g., role, status).


Common Tables:
users: user_id (PK, AUTO_INCREMENT), email (VARCHAR, UNIQUE), password_hash (VARCHAR), role (ENUM: 'student', 'teacher', 'admin'), first_name (VARCHAR), last_name (VARCHAR), created_at (DATETIME), updated_at (DATETIME).
courses: course_id (PK, AUTO_INCREMENT), course_name (VARCHAR), course_code (VARCHAR, UNIQUE), description (TEXT), created_at (DATETIME).


Updates:
Propose changes to shared_schema.md via pull requests.
Discuss additions (e.g., class column in courses) with the team.


Ensure all foreign keys reference these common tables.

ER Diagrams

Update er-diagrams/sample-Diagram.drawio or create new .drawio files for your module.
Use the Draw.io SQL plugin to import your .sql file and auto-generate ER diagrams:
Import: In Draw.io, go to "Extras" > "Plugins" > "SQL" > "Import SQL".
Select your schema file (e.g., schemas/auth.sql) to generate tables and relationships.
Customize the diagram to include constraints (e.g., PK, FK, indexes).
Save as <module>-Diagram.drawio in er-diagrams/.


Include tables, relationships, and constraints in the diagram.
Add notes in er-diagrams/sample.txt or create module-specific .txt files for diagram explanations.

Git Workflow

Commit Changes:
Use descriptive commit messages (e.g., “Added sessions table to auth.sql”, “Updated shared_schema.md with class column”).

git add .
git commit -m "Your descriptive message"


Push to Branch:git push origin feature/<module>-schema


Create Pull Requests:
Submit pull requests to merge into the main branch.
Request reviews from at least one other team member.


Resolve Conflicts:
Communicate via GitHub issues or team chat to resolve conflicts, especially in shared_schema.md.



Collaboration Guidelines

Communication: Use GitHub issues or a team chat (e.g., Slack, Discord) for discussions.
Dependencies: Coordinate with members if your schema depends on others (e.g., timetable.sql needs courses table).
Reviews: Review pull requests promptly to avoid delays.
Deadlines:
Submit initial schema drafts by [insert date].
Complete shared_schema.md updates by [insert date].
Finalize ER diagrams by [insert date].



Testing



Sample Data: Add sample INSERT statements to test functionality (e.g., sample users, courses).
Validation: Ensure compatibility with other schemas by testing with shared tables.

Notes

Refer to docs/ for detailed module instructions.
Update shared_schema.md early to avoid blocking other members.
Use er-diagrams/ to visualize table relationships.
