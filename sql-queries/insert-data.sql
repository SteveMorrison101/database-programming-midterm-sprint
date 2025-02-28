-- Insert Speakers
INSERT INTO speakers (first_name, last_name, email, topic) VALUES
('Alice', 'Smith', 'alice.smith@example.com', 'Cybersecurity'),
('Bob', 'Johnson', 'bob.johnson@example.com', 'AI & Machine Learning'),
('Charlie', 'Brown', 'charlie.brown@example.com', 'Cloud Computing'),
('Dana', 'Evans', 'dana.williams@example.com', 'Software Engineering'),
('Betty', 'Brazil', 'betty.brazil@example.com', 'Data Science');

-- Insert Attendees
INSERT INTO attendees (first_name, last_name, email, organization) VALUES
('Tom', 'Delonge', 'tom.delonge@example.com', 'Tech Enterprises'),
('Mark', 'Hoppus', 'mark.hoppus@example.com', 'Open Source Inc.'),
('Travis', 'Barker', 'travis.barker@example.com', NULL),
('Mike', 'Burkett', 'mike.burkett@example.com', 'Tech Startup Org.'),
('Eric', 'Melvin', 'eric.melvin@example.com', NULL),
('El', 'Hefe', 'el.hefe@example.com', 'AI Computing'),
('Erik', 'Sandin', 'eric.sandin@example.com', NULL),
('Henry', 'Rollins', 'henry.rollins@example.com', 'TechX'),
('Milo', 'Aukerman', 'milo.aukerman@example.com', NULL),
('Bill', 'Stevenson', 'bill.stevenson@example.com', 'Cloud Services');

-- Insert Sessions
INSERT INTO sessions (title, speaker_id, date_time) VALUES
('Cybersecurity for Dummies', 1, '2025-06-10 10:00:00'),
('AI and You', 2, '2025-06-10 13:00:00'),
('Building Cloud Applications', 3, '2025-06-11 09:30:00'),
('Modern Coding', 4, '2025-06-11 11:00:00'),
('Introduction to Data Analytics', 5, '2025-06-11 14:00:00'),
('Ethics of AI', 2, '2025-06-12 10:30:00'),
('The Zero Trust Security Model', 1, '2025-06-12 15:00:00');

-- Insert Registrations
INSERT INTO registrations (attendee_id, session_id) VALUES
(1, 1), (1, 3), (2, 2), (2, 4), (3, 5),
(3, 1), (4, 3), (4, 5), (5, 6), (5, 7),
(6, 2), (6, 3), (7, 4), (8, 6), (9, 7);
