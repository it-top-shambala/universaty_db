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