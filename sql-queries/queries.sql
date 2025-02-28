-- Find all sessions a specific attendee is registered for (by email)
SELECT s.title, s.date_time, sp.first_name, sp.last_name
FROM sessions s
JOIN registrations r ON s.id = r.session_id
JOIN attendees a ON r.attendee_id = a.id
JOIN speakers sp ON s.speaker_id = sp.id
WHERE a.email = 'mark.hoppus@example.com';

-- Given a session title, list all attendees registered for that session
SELECT a.first_name, a.last_name, a.email, a.organization
FROM attendees a
JOIN registrations r ON a.id = r.attendee_id
JOIN sessions s ON r.session_id = s.id
WHERE s.title = 'AI and You';

-- Retrieve the schedule (title, time, and speaker) for all sessions by a specific speaker
SELECT s.title, s.date_time
FROM sessions s
JOIN speakers sp ON s.speaker_id = sp.id
WHERE sp.email = 'bob.johnson@example.com';

-- Find all attendees attending at least one session from a specific speaker
SELECT DISTINCT a.first_name, a.last_name, a.email
FROM attendees a
JOIN registrations r ON a.id = r.attendee_id
JOIN sessions s ON r.session_id = s.id
JOIN speakers sp ON s.speaker_id = sp.id
WHERE sp.email = 'alice.smith@example.com';

-- List all sessions occurring on a specific date
SELECT title, date_time, (sp.first_name || ' ' || sp.last_name) AS speaker
FROM sessions s
JOIN speakers sp ON s.speaker_id = sp.id
WHERE DATE(s.date_time) = '2025-06-11';
