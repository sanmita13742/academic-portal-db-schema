##### Objective: Develop the SQL schema for the Amrita Calendar Module to manage academic events, test announcements, and enhancements like syncing and filtering.

Instructions:

Reference Shared Schema: Use the users and courses tables from shared_schema.md for teacher and course data.


#### Core Tables:

**Create an events table for academic events and test announcements:
**
Columns: event_id (PK), course_id (FK to courses), title (varchar), description (text), event_type (enum: exam, holiday, test, other), start_date (datetime), end_date (datetime), created_by (FK to users), class (enum: AIE-A, AIE-B, AIE-C, AIE-D).

**Create an event_syncs table for calendar sync functionality:**

Columns: sync_id (PK), event_id (FK to events), user_id (FK to users), sync_status (enum: synced, pending), created_at (timestamp).

**Constraints:**

Ensure event_type and class are enums as specified.

Add foreign keys for course_id, created_by, and user_id.

Ensure start_date and end_date are valid (e.g., end_date >= start_date).

#### Enhancements:

Add indexes on event_type, class, and start_date for filtering and querying.

Include a details field in events for hover/click-based event details.

Support filtering by class or event type via efficient indexing.

#### Notes:

Ensure compatibility with external calendar systems (e.g., Google Calendar) by structuring events for easy export.

Coordinate with the team to align class definitions with the Timetable Module.
