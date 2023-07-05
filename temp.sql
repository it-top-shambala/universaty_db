SELECT table_persons.id AS 'id',
       table_last_names.name AS 'last_name',
       table_first_names.name AS 'first_name'
FROM table_persons
JOIN table_first_names
    ON table_persons.id_first_name = table_first_names.id
JOIN table_last_names
    ON table_persons.id_last_name = table_last_names.id;

/*
SELECT table_persons.id AS 'id',
       table_last_names.name AS 'last_name',
       table_first_names.name AS 'first_name'
FROM table_persons, table_last_names, table_first_names
WHERE table_persons.id_first_name = table_first_names.id
  AND table_persons.id_last_name = table_last_names.id;
*/

SELECT * FROM view_persons;
SELECT * FROM table_persons;

SELECT * FROM view_persons WHERE first_name = 'Andrey';
/*
SELECT table_persons.id AS 'id',
       table_last_names.name AS 'last_name',
       table_first_names.name AS 'first_name'
FROM table_persons
JOIN table_first_names
    ON table_persons.id_first_name = table_first_names.id
JOIN table_last_names
    ON table_persons.id_last_name = table_last_names.id
WHERE table_first_names.name = 'Andrey';
*/

SELECT table_teachers.id AS 'id',
       view_persons.last_name AS 'last_name',
       view_persons.first_name AS 'first_name',
       table_faculties.name AS 'faculty'
FROM table_teachers
JOIN table_faculties
    ON table_teachers.id_faculty = table_faculties.id
JOIN view_persons
    ON table_teachers.id_person = view_persons.id;

SELECT * FROM view_teachers;

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

SELECT * FROM view_students;

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

SELECT * FROM view_ratings ORDER BY date;
SELECT *
FROM view_ratings
WHERE subject_name = 'Programming'
ORDER BY date;

SELECT AVG(mark) AS 'average_mark'
FROM view_ratings
WHERE subject_name = 'Programming';

SELECT MIN(mark) AS 'min_mark'
FROM view_ratings
WHERE subject_name = 'Programming';

SELECT DISTINCT student_first_name, mark FROM view_ratings;
SELECT student_first_name, mark FROM view_ratings;
SELECT DISTINCT last_name FROM view_persons;

SELECT AVG(DISTINCT mark)
FROM view_ratings;

SELECT COUNT(*),
       MIN(mark),
       MAX(mark),
       AVG(mark)
FROM view_ratings
WHERE subject_name = 'Programming';

SELECT COUNT(*),
       MIN(mark),
       MAX(mark),
       AVG(mark)
FROM view_ratings;

/*
SELECT table_ratings.id AS 'id',
       table_ratings.date AS 'date',
       table_last_names.name AS 'student_last_name',
       table_first_names.name AS 'student_first_name',
       table_subjects.name AS 'subject_name',
       table_last_names.last_name AS 'teacher_last_name',
       table_first_names.first_name AS 'teacher_first_name',
       table_ratings.mark AS 'mark'
FROM table_ratings
JOIN table_subjects
    ON table_ratings.id_subject = table_subjects.id
JOIN table_teachers
    ON table_ratings.id_teacher = table_teachers.id
JOIN table_faculties
    ON table_teachers.id_faculty = table_faculties.id
JOIN table_persons
    ON table_teachers.id_person = table_persons.id
JOIN table_students
    ON table_ratings.id_student = table_students.id
JOIN table_faculties
    ON table_students.id_faculty = table_faculties.id
JOIN table_groups
    ON table_students.id_group = table_groups.id
JOIN table_persons
    ON table_students.id_person = table_persons.id
JOIN table_first_names
    ON table_persons.id_first_name = table_first_names.id
JOIN table_last_names
    ON table_persons.id_last_name = table_last_names.id
*/