-- Что будем хранить: студентов, преподаватели, предметы, оценки

CREATE TABLE table_first_names (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE table_last_names (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE table_persons (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    id_first_name INTEGER NOT NULL,
    id_last_name INTEGER NOT NULL,
    phone TEXT NOT NULL,
    FOREIGN KEY (id_first_name) REFERENCES table_first_names(id),
    FOREIGN KEY (id_last_name) REFERENCES table_last_names(id)
);

CREATE TABLE table_faculties (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE table_groups (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE table_students (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    id_person INTEGER NOT NULL,
    id_faculty INTEGER NOT NULL,
    id_group INTEGER NOT NULL,
    FOREIGN KEY (id_person) REFERENCES table_persons(id),
    FOREIGN KEY (id_faculty) REFERENCES table_faculties(id),
    FOREIGN KEY (id_group) REFERENCES table_groups(id)
);

CREATE TABLE table_teachers (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    id_person INTEGER NOT NULL,
    id_faculty INTEGER NOT NULL,
    FOREIGN KEY (id_person) REFERENCES table_persons(id),
    FOREIGN KEY (id_faculty) REFERENCES table_faculties(id)
);

CREATE TABLE table_subjects (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE table_ratings (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    date TEXT NOT NULL,
    id_student INTEGER NOT NULL,
    id_subject INTEGER NOT NULL,
    id_teacher INTEGER NOT NULL,
    mark INTEGER NOT NULL,
    FOREIGN KEY (id_student) REFERENCES table_students(id),
    FOREIGN KEY (id_subject) REFERENCES table_subjects(id),
    FOREIGN KEY (id_teacher) REFERENCES table_teachers(id)
);

CREATE VIEW view_persons AS
    SELECT table_persons.id AS 'id',
       table_last_names.name AS 'last_name',
       table_first_names.name AS 'first_name'
    FROM table_persons
    JOIN table_first_names
        ON table_persons.id_first_name = table_first_names.id
    JOIN table_last_names
        ON table_persons.id_last_name = table_last_names.id;

CREATE VIEW view_teachers AS
    SELECT table_teachers.id AS 'id',
       view_persons.last_name AS 'last_name',
       view_persons.first_name AS 'first_name',
       table_faculties.name AS 'faculty'
    FROM table_teachers
    JOIN table_faculties
        ON table_teachers.id_faculty = table_faculties.id
    JOIN view_persons
        ON table_teachers.id_person = view_persons.id;

CREATE VIEW view_students AS
    SELECT table_students.id AS 'id',
       view_persons.last_name AS 'last_name',
       view_persons.first_name AS 'first_name',
       table_faculties.name AS 'faculty_name',
       table_groups.name AS 'group_name'
    FROM table_students
    JOIN view_persons
        ON table_students.id_person = view_persons.id
    JOIN table_faculties
        ON table_students.id_faculty = table_faculties.id
    JOIN table_groups
        ON table_students.id_group = table_groups.id;

CREATE VIEW view_ratings AS
    SELECT table_ratings.id AS 'id',
       table_ratings.date AS 'date',
       view_students.last_name 'student_last_name',
       view_students.first_name 'student_first_name',
       table_subjects.name AS 'subject_name',
       view_teachers.last_name AS 'teacher_last_name',
       view_teachers.first_name AS 'teacher_first_name',
       table_ratings.mark AS 'mark'
    FROM table_ratings
    JOIN view_students
        ON table_ratings.id_student = view_students.id
    JOIN table_subjects
        ON table_ratings.id_subject = table_subjects.id
    JOIN view_teachers
        ON table_ratings.id_teacher = view_teachers.id;