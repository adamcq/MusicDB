insert into student (personal_number, name, phone, email, address_line, zip, city) values ('648223605602', 'Wilmar Genty', '787-135-5178', 'wgenty0@msn.com', 'International', '68877', 'Maae');
insert into student (personal_number, name, phone, email, address_line, zip, city) values ('137996947403', 'Isadore Di Nisco', '455-624-6031', 'idi1@sohu.com', 'Fairview', '97151', 'Oleksandriya');
insert into student (personal_number, name, phone, email, address_line, zip, city) values ('476223414279', 'Bryant Maxwell', '806-973-1836', 'bmaxwell2@sphinn.com', 'Anderson', '43734', 'Ballisodare');
insert into student (personal_number, name, phone, email, address_line, zip, city) values ('282406107662', 'Normie Castanares', '166-379-8090', 'ncastanares3@joomla.org', 'Sullivan', '65790', 'Linëvo');
insert into student (personal_number, name, phone, email, address_line, zip, city) values ('910330773025', 'Elfrieda Brazener', '625-190-9687', 'ebrazener4@bloglovin.com', 'Vidon', '63834', 'Haninge');
insert into student (personal_number, name, phone, email, address_line, zip, city) values ('878348702197', 'Pearce Stapforth', '699-172-4338', 'pstapforth5@multiply.com', 'Kim', '46938', 'Quebo');
insert into student (personal_number, name, phone, email, address_line, zip, city) values ('022213459032', 'Bob Silverstone', '927-196-0753', 'bsilverstone6@xing.com', 'Hollow Ridge', '16571', 'Arnprior');
insert into student (personal_number, name, phone, email, address_line, zip, city) values ('125259621558', 'Louella Steger', '804-321-1708', 'lsteger7@wired.com', 'Division', '53899', 'Si Sa Ket');
insert into student (personal_number, name, phone, email, address_line, zip, city) values ('535716174855', 'Addia Robart', '810-730-4057', 'arobart8@so-net.ne.jp', 'Barnett', '55934', 'Qo’ng’irot Shahri');
insert into student (personal_number, name, phone, email, address_line, zip, city) values ('114214699842', 'Jason Van Ross', '867-508-6065', 'jvan9@bluehost.com', 'Steensland', '11785', 'Vigan');

insert into instructor (personal_number, name, phone, email, address_line, zip, city) values ('133442002673', 'Dukie MacGahy', '612-590-9528', 'dmacgahy0@macromedia.com', 'Mcguire', '69609', 'Vera');
insert into instructor (personal_number, name, phone, email, address_line, zip, city) values ('197185225877', 'Lillis Danks', '640-359-2527', 'ldanks1@weebly.com', 'Gerald', '48327', 'Ciguna');
insert into instructor (personal_number, name, phone, email, address_line, zip, city) values ('759218411335', 'Roby Tregale', '492-431-7726', 'rtregale2@baidu.com', 'Riverside', '13482', 'Greater Napanee');
insert into instructor (personal_number, name, phone, email, address_line, zip, city) values ('186209799740', 'Ferrell Ramelet', '925-204-2515', 'framelet3@chron.com', 'Bashford', '43955', 'Ngantru');
insert into instructor (personal_number, name, phone, email, address_line, zip, city) values ('108280076531', 'Jacques Casaccia', '432-773-1056', 'jcasaccia4@earthlink.net', 'Mayer', '38004', 'Kishiwada');
insert into instructor (personal_number, name, phone, email, address_line, zip, city) values ('693424034369', 'Eamon Panting', '150-242-4738', 'epanting5@fc2.com', 'Warner', '61263', 'Ińsko');
insert into instructor (personal_number, name, phone, email, address_line, zip, city) values ('149171753092', 'Dorian Clopton', '320-483-4204', 'dclopton6@fc2.com', 'Heath', '61284', 'Binawara');
insert into instructor (personal_number, name, phone, email, address_line, zip, city) values ('988537931314', 'Jeni Ions', '945-278-6027', 'jions7@cloudflare.com', 'Northridge', '12403', 'Muaralabuh');
insert into instructor (personal_number, name, phone, email, address_line, zip, city) values ('546492250297', 'Elianora Semens', '592-709-8564', 'esemens8@nhs.uk', 'Holmberg', '99998', 'Ichupampa');
insert into instructor (personal_number, name, phone, email, address_line, zip, city) values ('347178286113', 'Arlyne Culwen', '245-776-0585', 'aculwen9@qq.com', 'Stoughton', '87452', 'Chayek');

insert into instrument (instrument) values ('Guitar');
insert into instrument (instrument) values ('Piano');
insert into instrument (instrument) values ('Violin');
insert into instrument (instrument) values ('Base');
insert into instrument (instrument) values ('Harp');
insert into instrument (instrument) values ('Flute');
insert into instrument (instrument) values ('Saxophone');
insert into instrument (instrument) values ('Trumpet');
insert into instrument (instrument) values ('Triangle');
insert into instrument (instrument) values ('Tambourine');

insert into instructor_instrument (instrument_id, person_id_instructor) values ((SELECT person_id FROM instructor WHERE name = 'Dukie MacGahy'),(SELECT instrument_id FROM instrument WHERE instrument = 'Piano'));
insert into instructor_instrument (instrument_id, person_id_instructor) values ((SELECT person_id FROM instructor WHERE name = 'Dukie MacGahy'),(SELECT instrument_id FROM instrument WHERE instrument = 'Triangle'));
insert into instructor_instrument (instrument_id, person_id_instructor) values ((SELECT person_id FROM instructor WHERE name = 'Dukie MacGahy'),(SELECT instrument_id FROM instrument WHERE instrument = 'Guitar'));
insert into instructor_instrument (instrument_id, person_id_instructor) values ((SELECT person_id FROM instructor WHERE name = 'Lillis Danks'),(SELECT instrument_id FROM instrument WHERE instrument = 'Guitar'));
insert into instructor_instrument (instrument_id, person_id_instructor) values ((SELECT person_id FROM instructor WHERE name = 'Lillis Danks'),(SELECT instrument_id FROM instrument WHERE instrument = 'Harp'));
insert into instructor_instrument (instrument_id, person_id_instructor) values ((SELECT person_id FROM instructor WHERE name = 'Lillis Danks'),(SELECT instrument_id FROM instrument WHERE instrument = 'Base'));
insert into instructor_instrument (instrument_id, person_id_instructor) values ((SELECT person_id FROM instructor WHERE name = 'Roby Tregale'),(SELECT instrument_id FROM instrument WHERE instrument = 'Piano'));
insert into instructor_instrument (instrument_id, person_id_instructor) values ((SELECT person_id FROM instructor WHERE name = 'Roby Tregale'),(SELECT instrument_id FROM instrument WHERE instrument = 'Saxophone'));
insert into instructor_instrument (instrument_id, person_id_instructor) values ((SELECT person_id FROM instructor WHERE name = 'Roby Tregale'),(SELECT instrument_id FROM instrument WHERE instrument = 'Tambourine'));
insert into instructor_instrument (instrument_id, person_id_instructor) values ((SELECT person_id FROM instructor WHERE name = 'Ferrell Ramelet'),(SELECT instrument_id FROM instrument WHERE instrument = 'Flute'));
insert into instructor_instrument (instrument_id, person_id_instructor) values ((SELECT person_id FROM instructor WHERE name = 'Ferrell Ramelet'),(SELECT instrument_id FROM instrument WHERE instrument = 'Trumpet'));
insert into instructor_instrument (instrument_id, person_id_instructor) values ((SELECT person_id FROM instructor WHERE name = 'Jeni Ions'),(SELECT instrument_id FROM instrument WHERE instrument = 'Harp'));
insert into instructor_instrument (instrument_id, person_id_instructor) values ((SELECT person_id FROM instructor WHERE name = 'Jacques Casaccia'),(SELECT instrument_id FROM instrument WHERE instrument = 'Base'));
insert into instructor_instrument (instrument_id, person_id_instructor) values ((SELECT person_id FROM instructor WHERE name = 'Jacques Casaccia'),(SELECT instrument_id FROM instrument WHERE instrument = 'Guitar'));
insert into instructor_instrument (instrument_id, person_id_instructor) values ((SELECT person_id FROM instructor WHERE name = 'Elianora Semens'),(SELECT instrument_id FROM instrument WHERE instrument = 'Triangle'));
insert into instructor_instrument (instrument_id, person_id_instructor) values ((SELECT person_id FROM instructor WHERE name = 'Elianora Semens'),(SELECT instrument_id FROM instrument WHERE instrument = 'Flute'));
insert into instructor_instrument (instrument_id, person_id_instructor) values ((SELECT person_id FROM instructor WHERE name = 'Arlyne Culwen'),(SELECT instrument_id FROM instrument WHERE instrument = 'Violin'));
insert into instructor_instrument (instrument_id, person_id_instructor) values ((SELECT person_id FROM instructor WHERE name = 'Arlyne Culwen'),(SELECT instrument_id FROM instrument WHERE instrument = 'Tambourine'));

insert into rental_instrument (instrument, brand, category) values ('Guitar', 'Chevrolet', 'String');
insert into rental_instrument (instrument, brand, category) values ('Piano', 'Steinway', 'String');
insert into rental_instrument (instrument, brand, category) values ('Violin', 'Pontiac', 'String');
insert into rental_instrument (instrument, brand, category) values ('Base', 'Toyota', 'String');
insert into rental_instrument (instrument, brand, category) values ('Harp', 'Subaru', 'String');
insert into rental_instrument (instrument, brand, category) values ('Flute', 'Mazda', 'Wind');
insert into rental_instrument (instrument, brand, category) values ('Saxophone', 'Mercury', 'Wind');
insert into rental_instrument (instrument, brand, category) values ('Trumpet', 'Ford', 'Wind');
insert into rental_instrument (instrument, brand, category) values ('Triangle', 'Lincoln', 'Percussion');
insert into rental_instrument (instrument, brand, category) values ('Tambourine', 'Chevrolet', 'Percussion');

insert into compensation_schema (base_compensation, individual_lesson_quanitifier ,group_lesson_quantifier,ensemble_quantifier, beginner_quantifier, intermediate_quantifier, advanced_quantifier) values (25, 1.25, 1, 0.25, 1, 2, 3);

insert into pricing_schema (base_price, individual_lesson_quanitifier,group_lesson_quantifier,ensemble_quantifier, beginner_quantifier , advanced_quantifier,intermediate_quantifier, discount_percentage) values (25, 1.25, 1, 0.25, 1, 2, 3, 5);

insert into additional_contact_person (person_id_student, name, email, phone) values ((SELECT person_id FROM student WHERE name = 'Wilmar Genty'), 'Lizzie Earwaker', 'learwaker0@cocolog-nifty.com', '495-737-3797');
insert into additional_contact_person (person_id_student, name, email, phone) values ((SELECT person_id FROM student WHERE name = 'Addia Robart'), 'Kinnie Kerwood', 'kkerwood1@cocolog-nifty.com', '927-117-5495');
insert into additional_contact_person (person_id_student, name, email, phone) values ((SELECT person_id FROM student WHERE name = 'Bob Silverstone'), 'Merlina Roache', 'mroache2@dagondesign.com', '564-633-7598');

insert into sibling_relationship (first_person_id_student, second_person_id_student) values ((SELECT person_id FROM student WHERE name = 'Wilmar Genty'), (SELECT person_id FROM student WHERE name = 'Isadore Di Nisco'));
insert into sibling_relationship (first_person_id_student, second_person_id_student) values ((SELECT person_id FROM student WHERE name = 'Wilmar Genty'), (SELECT person_id FROM student WHERE name = 'Bryant Maxwell'));
insert into sibling_relationship (first_person_id_student, second_person_id_student) values ((SELECT person_id FROM student WHERE name = 'Isadore Di Nisco'), (SELECT person_id FROM student WHERE name = 'Bryant Maxwell'));

insert into instrument_fee (rental_instrument_id, fee, starting_from) values ((SELECT rental_instrument_id FROM rental_instrument WHERE instrument = 'Guitar'), 300, '07/02/2022');
insert into instrument_fee (rental_instrument_id, fee, starting_from) values ((SELECT rental_instrument_id FROM rental_instrument WHERE instrument = 'Piano'), 300, '07/02/2022');
insert into instrument_fee (rental_instrument_id, fee, starting_from) values ((SELECT rental_instrument_id FROM rental_instrument WHERE instrument = 'Violin'), 300, '07/02/2022');
insert into instrument_fee (rental_instrument_id, fee, starting_from) values ((SELECT rental_instrument_id FROM rental_instrument WHERE instrument = 'Base'), 300, '07/02/2022');
insert into instrument_fee (rental_instrument_id, fee, starting_from) values ((SELECT rental_instrument_id FROM rental_instrument WHERE instrument = 'Harp'), 300, '07/02/2022');
insert into instrument_fee (rental_instrument_id, fee, starting_from) values ((SELECT rental_instrument_id FROM rental_instrument WHERE instrument = 'Flute'), 300, '07/02/2022');
insert into instrument_fee (rental_instrument_id, fee, starting_from) values ((SELECT rental_instrument_id FROM rental_instrument WHERE instrument = 'Saxophone'), 300, '07/02/2022');
insert into instrument_fee (rental_instrument_id, fee, starting_from) values ((SELECT rental_instrument_id FROM rental_instrument WHERE instrument = 'Trumpet'), 300, '07/02/2022');
insert into instrument_fee (rental_instrument_id, fee, starting_from) values ((SELECT rental_instrument_id FROM rental_instrument WHERE instrument = 'Triangle'), 300, '07/02/2022');
insert into instrument_fee (rental_instrument_id, fee, starting_from) values ((SELECT rental_instrument_id FROM rental_instrument WHERE instrument = 'Tambourine'), 300, '07/02/2022');

insert into rental_agreement (date_rented, date_returned, person_id_student, rental_instrument_id) values ('10/02/2022', null, (SELECT person_id FROM student WHERE name = 'Wilmar Genty'), (SELECT rental_instrument_id FROM rental_instrument WHERE instrument = 'Piano'));
insert into rental_agreement (date_rented, date_returned, person_id_student, rental_instrument_id) values ('10/02/2022', null, (SELECT person_id FROM student WHERE name = 'Bryant Maxwell'), (SELECT rental_instrument_id FROM rental_instrument WHERE instrument = 'Base'));
insert into rental_agreement (date_rented, date_returned, person_id_student, rental_instrument_id) values ('10/02/2022', null, (SELECT person_id FROM student WHERE name = 'Addia Robart'), (SELECT rental_instrument_id FROM rental_instrument WHERE instrument = 'Violin'));


insert into ensemble (min_no_of_students, max_no_of_students, genre, time, date, person_id_instructor, pricing_schema_id, compensation_schema_id) values (1, 10, 'Jazz', '18:00', '10/02/2022', (SELECT person_id FROM instructor WHERE name = 'Dukie MacGahy'), (SELECT pricing_schema_id FROM pricing_schema),(SELECT compensation_schema_id FROM compensation_schema));
insert into ensemble (min_no_of_students, max_no_of_students, genre, time, date, person_id_instructor, pricing_schema_id, compensation_schema_id) values (1, 10, 'Jazz', '20:00', '12/02/2022', (SELECT person_id FROM instructor WHERE name = 'Dukie MacGahy'), (SELECT pricing_schema_id FROM pricing_schema),(SELECT compensation_schema_id FROM compensation_schema));

insert into level(level) values ('beginner');
insert into level(level) values ('intermediate');
insert into level(level) values ('advanced');

insert into student_ensemble(ensemble_id, person_id_student) values ((SELECT ensemble_id FROM ensemble WHERE date = '10/02/2022'), (SELECT person_id FROM student WHERE name = 'Wilmar Genty'));
insert into student_ensemble(ensemble_id, person_id_student) values ((SELECT ensemble_id FROM ensemble WHERE date = '12/02/2022'), (SELECT person_id FROM student WHERE name = 'Elfrieda Brazener'));

insert into ensemble_instrument(ensemble_id, instrument_id) values ((SELECT ensemble_id FROM ensemble WHERE date = '10/02/2022'), (SELECT instrument_id FROM instrument WHERE instrument = 'Piano'));
insert into ensemble_instrument(ensemble_id, instrument_id) values ((SELECT ensemble_id FROM ensemble WHERE date = '12/02/2022'), (SELECT instrument_id FROM instrument WHERE instrument = 'Guitar'));
insert into ensemble_instrument(ensemble_id, instrument_id) values ((SELECT ensemble_id FROM ensemble WHERE date = '12/02/2022'), (SELECT instrument_id FROM instrument WHERE instrument = 'Violin'));

insert into individual_lesson (time, date, person_id_instructor, instrument_id, pricing_schema_id ,compensation_schema_id ,level_id) values ('18:00', '11/02/2022', (SELECT person_id FROM student WHERE name = 'Wilmar Genty'), (SELECT instrument_id FROM instrument WHERE instrument = 'Piano'), (SELECT pricing_schema_id FROM pricing_schema), (SELECT compensation_schema_id FROM compensation_schema), (SELECT level_id FROM level WHERE level = 'beginner'));
insert into individual_lesson (time, date, person_id_instructor, instrument_id, pricing_schema_id ,compensation_schema_id ,level_id) values ('20:00', '11/04/2022', (SELECT person_id FROM instructor WHERE name = 'Roby Tregale'), (SELECT instrument_id FROM instrument WHERE instrument = 'Saxophone'), (SELECT pricing_schema_id FROM pricing_schema), (SELECT compensation_schema_id FROM compensation_schema), (SELECT level_id FROM level WHERE level = 'intermediate'));

insert into group_lesson (min_no_of_students, max_no_of_students, time, date, person_id_instructor, pricing_schema_id, compensation_schema_id, level_id, instrument_id) values (1, 8, '18:00', '10/02/2022', (SELECT person_id FROM instructor WHERE name = 'Jeni Ions'), (SELECT pricing_schema_id FROM pricing_schema),(SELECT compensation_schema_id FROM compensation_schema), (SELECT level_id FROM level WHERE level = 'advanced'), (SELECT instrument_id FROM instrument WHERE instrument = 'Harp'));
insert into group_lesson (min_no_of_students, max_no_of_students, time, date, person_id_instructor, pricing_schema_id, compensation_schema_id, level_id, instrument_id) values (1, 8, '18:00', '08/12/2022', (SELECT person_id FROM instructor WHERE name = 'Jeni Ions'), (SELECT pricing_schema_id FROM pricing_schema),(SELECT compensation_schema_id FROM compensation_schema), (SELECT level_id FROM level WHERE level = 'advanced'), (SELECT instrument_id FROM instrument WHERE instrument = 'Harp'));
insert into group_lesson (min_no_of_students, max_no_of_students, time, date, person_id_instructor, pricing_schema_id, compensation_schema_id, level_id, instrument_id) values (1, 8, '18:00', '05/03/2022', (SELECT person_id FROM instructor WHERE name = 'Jeni Ions'), (SELECT pricing_schema_id FROM pricing_schema),(SELECT compensation_schema_id FROM compensation_schema), (SELECT level_id FROM level WHERE level = 'advanced'), (SELECT instrument_id FROM instrument WHERE instrument = 'Harp'));
insert into group_lesson (min_no_of_students, max_no_of_students, time, date, person_id_instructor, pricing_schema_id, compensation_schema_id, level_id, instrument_id) values (10, 50, '15:00', '04/03/2022', (SELECT person_id FROM instructor WHERE name = 'Elianora Semens'), (SELECT pricing_schema_id FROM pricing_schema),(SELECT compensation_schema_id FROM compensation_schema), (SELECT level_id FROM level WHERE level = 'advanced'), (SELECT instrument_id FROM instrument WHERE instrument = 'Triangle'));

insert into student_group_lesson (group_lesson_id, person_id_student) values ((SELECT group_lesson_id FROM group_lesson WHERE date = '04/03/2022'), (SELECT person_id FROM student WHERE name = 'Wilmar Genty'));
insert into student_group_lesson (group_lesson_id, person_id_student) values ((SELECT group_lesson_id FROM group_lesson WHERE date = '04/03/2022'), (SELECT person_id FROM student WHERE name = 'Isadore Di Nisco'));
insert into student_group_lesson (group_lesson_id, person_id_student) values ((SELECT group_lesson_id FROM group_lesson WHERE date = '04/03/2022'), (SELECT person_id FROM student WHERE name = 'Bryant Maxwell'));
insert into student_group_lesson (group_lesson_id, person_id_student) values ((SELECT group_lesson_id FROM group_lesson WHERE date = '04/03/2022'), (SELECT person_id FROM student WHERE name = 'Normie Castanares'));
insert into student_group_lesson (group_lesson_id, person_id_student) values ((SELECT group_lesson_id FROM group_lesson WHERE date = '04/03/2022'), (SELECT person_id FROM student WHERE name = 'Elfrieda Brazener'));
insert into student_group_lesson (group_lesson_id, person_id_student) values ((SELECT group_lesson_id FROM group_lesson WHERE date = '04/03/2022'), (SELECT person_id FROM student WHERE name = 'Pearce Stapforth'));
insert into student_group_lesson (group_lesson_id, person_id_student) values ((SELECT group_lesson_id FROM group_lesson WHERE date = '04/03/2022'), (SELECT person_id FROM student WHERE name = 'Bob Silverstone'));
insert into student_group_lesson (group_lesson_id, person_id_student) values ((SELECT group_lesson_id FROM group_lesson WHERE date = '04/03/2022'), (SELECT person_id FROM student WHERE name = 'Louella Steger'));
insert into student_group_lesson (group_lesson_id, person_id_student) values ((SELECT group_lesson_id FROM group_lesson WHERE date = '04/03/2022'), (SELECT person_id FROM student WHERE name = 'Addia Robart'));
insert into student_group_lesson (group_lesson_id, person_id_student) values ((SELECT group_lesson_id FROM group_lesson WHERE date = '04/03/2022'), (SELECT person_id FROM student WHERE name = 'Jason Van Ross'));