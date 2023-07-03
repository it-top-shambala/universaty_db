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