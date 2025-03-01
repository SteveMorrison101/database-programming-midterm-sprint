# Instructions for Running the CLI Application

## Prerequisites
Before running the CLI application, ensure that following are installed:
- Node.js (v14 or later)
- PostgreSQL (Ensure PostgreSQL service is running)
- The required dependencies (install using `npm install`)

## Setting Up the Project
1. **Clone the repository**
   ```
   git clone https://github.com/SteveMorrison101/database-programming-midterm-sprint.git
   cd database-programming-midterm-sprint/cli-app
   ```

2. **Install dependencies**:
   ```
   npm install
   ```

3. **Ensure PostgreSQL is running**:
   ```
   psql -U postgres -d conference_db -p 5432
   ```

## Running the CLI Application

To run the CLI, use the following commands:

### Show all sessions:
```
node index.js show
```

### Insert a new session:
```
node index.js insert "Session Title" <speaker_id> "YYYY-MM-DD" "HH:MM"
```
Example:
```
node index.js insert "Intro to PostgreSQL" 1 "2025-06-13" "09:00"
```

### Update an attendee's email:
```
node index.js update <attendee_id> "new.email@example.com"
```
Example:
```
node index.js update 2 "updated.email@example.com"
```

### Remove an attendee:
```
node index.js remove <attendee_id>
```
Example:
```
node index.js remove 5
```

## Troubleshooting:
If you encounter any issues:
- Ensure PostgreSQL is running using:
  ```
  psql -U postgres -d conference_db -p 5432
  ```
- Check for any missing dependencies and reinstall:
  ```
  npm install
  ```
- Restart the application and database if needed.