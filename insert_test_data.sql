INSERT INTO table_last_names (name) VALUES ('Starinin');
INSERT INTO table_last_names (name) VALUES ('Anonimus');

INSERT INTO table_first_names (name) VALUES ('Andrey');
INSERT INTO table_first_names (name) VALUES ('Anonim');

INSERT INTO table_persons (id_first_name, id_last_name, phone)
VALUES (1, 1, '+79042144491');
INSERT INTO table_persons (id_first_name, id_last_name, phone)
VALUES (2, 2, '+71231231212');

INSERT INTO table_faculties (name) VALUES ('SoftDev');
INSERT INTO table_faculties (name) VALUES ('Design');

INSERT INTO table_teachers (id_person, id_faculty) VALUES (1, 1);
INSERT INTO table_teachers (id_person, id_faculty) VALUES (1, 2);

INSERT INTO table_groups (name) VALUES ('G1');

INSERT INTO table_students (id_person, id_faculty, id_group) VALUES (2, 1, 1);

INSERT INTO table_subjects (name) VALUES ('Programming');
INSERT INTO table_subjects (name) VALUES ('DB');

INSERT INTO table_ratings (date, id_student, id_subject, id_teacher, mark)
VALUES ('2023-7-4', 1, 1, 1, 3);
INSERT INTO table_ratings (date, id_student, id_subject, id_teacher, mark)
VALUES ('2023-7-5', 1, 1, 1, 5);
INSERT INTO table_ratings (date, id_student, id_subject, id_teacher, mark)
VALUES ('2023-7-3', 1, 2, 1, 5);