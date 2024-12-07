CREATE TABLE Timetable (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(255),
    day VARCHAR(50),
    time VARCHAR(50),
    room VARCHAR(50),
    level INT
);

INSERT INTO Timetable (course_name, day, time, room, level) VALUES
('System Analysis and Design', 'Friday', '2:00 PM', 'Room 101', 1),
('Introduction to Psychology', 'Tuesday', '2:00 PM', 'Room 102', 1),
('Introduction to Media	', 'Wednesday', '9:00 AM', 'Room 103', 2),
('Writing in the Workplace	', 'Friday', '1:00 PM', 'Room 105', 2),
('Data Structure I', 'Monday', '2:00 PM', 'Room 106', 3),
('IT Project Management', 'Monday', '11:30 AM', 'Room 106', 3);

CREATE TABLE Students (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    level INT
);

INSERT INTO Students (name, level) VALUES
('Alice Johnson', 1),
('Bob Smith', 2),
('Charlie Brown', 3),
('David Lee', 1);