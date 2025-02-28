-- Create Speakers Table
CREATE TABLE speakers (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    topic VARCHAR(100) NOT NULL
);

-- Create Attendees Table
CREATE TABLE attendees (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    organization VARCHAR(100)
);

-- Create Sessions Table
CREATE TABLE sessions (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    speaker_id INTEGER NOT NULL,
    date_time TIMESTAMP NOT NULL,
    FOREIGN KEY (speaker_id) REFERENCES speakers(id) ON DELETE CASCADE
);

-- Create Registrations Table
CREATE TABLE registrations (
    attendee_id INTEGER NOT NULL,
    session_id INTEGER NOT NULL,
    PRIMARY KEY (attendee_id, session_id),
    FOREIGN KEY (attendee_id) REFERENCES attendees(id) ON DELETE CASCADE,
    FOREIGN KEY (session_id) REFERENCES sessions(id) ON DELETE CASCADE
);
