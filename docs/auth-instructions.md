
##### Objective: Create the SQL schema for the Authentication Module to support secure, role-based login, session management, password reset, and registration approval.

#### Instructions:
Reference Shared Schema: Use the users table from shared_schema.md for user-related data (e.g., user_id, email, password_hash, role).


#### Core Tables:
**Create a sessions table for token-based authentication (e.g., JWT):**

Columns: session_id (PK), user_id (FK to users), token (text), created_at (timestamp), expires_at (timestamp).

**Create a password_resets table for password reset functionality:**

Columns: reset_id (PK), user_id (FK to users), reset_token (text), created_at (timestamp), expires_at (timestamp).

**Create a registration_requests table for role-based registration approval:**

Columns: request_id (PK), email, role (enum: student, teacher, admin), status (enum: pending, approved, rejected), created_at (timestamp).

**Constraints:**
Ensure role in users is an enum (student, teacher, admin) as per the shared schema.
Add unique constraints on email and token fields where applicable.
Use foreign keys to link to users.user_id.


#### Enhancements:

Include indexes on email, token, and user_id for performance.

Add a last_login timestamp in the users table (update shared_schema.md if needed).

#### Notes:

Store passwords as hashed values (password_hash) using a secure hashing algorithm (e.g., bcrypt).

Ensure expires_at in sessions and password_resets supports token expiration logic.

Coordinate with the team to ensure role aligns with access control needs in other modules.
