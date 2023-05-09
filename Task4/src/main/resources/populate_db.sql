TRUNCATE additional_contact_person ,compensation_schema ,ensemble ,ensemble_instrument ,group_lesson ,individual_lesson ,instructor ,instructor_instrument ,instrument ,instrument_fee ,pricing_schema ,rental_agreement ,rental_instrument ,sibling_relationship ,student ,student_ensemble ,student_group_lesson, "level", lesson_historic, student_lesson, last_backup;

--DROP VIEW students_with_siblings;

insert into student (personal_number, name, phone, email, address_line, zip, city) values ('648223605602', 'Adam', '787-135-5178', 'wgenty0@msn.com', 'International', '68877', 'Maae');
insert into student (personal_number, name, phone, email, address_line, zip, city) values ('137996947403', 'Johan', '455-624-6031', 'idi1@sohu.com', 'Fairview', '97151', 'Oleksandriya');
insert into student (personal_number, name, phone, email, address_line, zip, city) values ('476223414279', 'Chai', '806-973-1836', 'bmaxwell2@sphinn.com', 'Anderson', '43734', 'Ballisodare');
insert into student (personal_number, name, phone, email, address_line, zip, city) values ('282406107662', 'David', '166-379-8090', 'ncastanares3@joomla.org', 'Sullivan', '65790', 'Linëvo');
insert into student (personal_number, name, phone, email, address_line, zip, city) values ('910330773025', 'Filip', '625-190-9687', 'ebrazener4@bloglovin.com', 'Vidon', '63834', 'Haninge');
insert into student (personal_number, name, phone, email, address_line, zip, city) values ('878348702197', 'James', '699-172-4338', 'pstapforth5@multiply.com', 'Kim', '46938', 'Quebo');
insert into student (personal_number, name, phone, email, address_line, zip, city) values ('022213459032', 'Robert', '927-196-0753', 'bsilverstone6@xing.com', 'Hollow Ridge', '16571', 'Arnprior');
insert into student (personal_number, name, phone, email, address_line, zip, city) values ('125259621558', 'Michael', '804-321-1708', 'lsteger7@wired.com', 'Division', '53899', 'Si Sa Ket');
insert into student (personal_number, name, phone, email, address_line, zip, city) values ('535716174855', 'William', '810-730-4057', 'arobart8@so-net.ne.jp', 'Barnett', '55934', 'Qo’ng’irot Shahri');
insert into student (personal_number, name, phone, email, address_line, zip, city) values ('114214699842', 'Donald', '867-508-6065', 'jvan9@bluehost.com', 'Steensland', '11785', 'Vigan');

insert into instructor (personal_number, name, phone, email, address_line, zip, city) values ('133442002673', 'Olivia', '612-590-9528', 'dmacgahy0@macromedia.com', 'Mcguire', '69609', 'Vera');
insert into instructor (personal_number, name, phone, email, address_line, zip, city) values ('197185225877', 'Ava', '640-359-2527', 'ldanks1@weebly.com', 'Gerald', '48327', 'Ciguna');
insert into instructor (personal_number, name, phone, email, address_line, zip, city) values ('759218411335', 'Iris', '492-431-7726', 'rtregale2@baidu.com', 'Riverside', '13482', 'Greater Napanee');
insert into instructor (personal_number, name, phone, email, address_line, zip, city) values ('186209799740', 'Sophia', '925-204-2515', 'framelet3@chron.com', 'Bashford', '43955', 'Ngantru');
insert into instructor (personal_number, name, phone, email, address_line, zip, city) values ('108280076531', 'Hannah', '432-773-1056', 'jcasaccia4@earthlink.net', 'Mayer', '38004', 'Kishiwada');
insert into instructor (personal_number, name, phone, email, address_line, zip, city) values ('693424034369', 'Sarah', '150-242-4738', 'epanting5@fc2.com', 'Warner', '61263', 'Ińsko');
insert into instructor (personal_number, name, phone, email, address_line, zip, city) values ('149171753092', 'Jessica', '320-483-4204', 'dclopton6@fc2.com', 'Heath', '61284', 'Binawara');
insert into instructor (personal_number, name, phone, email, address_line, zip, city) values ('988537931314', 'Samantha', '945-278-6027', 'jions7@cloudflare.com', 'Northridge', '12403', 'Muaralabuh');
insert into instructor (personal_number, name, phone, email, address_line, zip, city) values ('546492250297', 'Amy', '592-709-8564', 'esemens8@nhs.uk', 'Holmberg', '99998', 'Ichupampa');
insert into instructor (personal_number, name, phone, email, address_line, zip, city) values ('347178286113', 'Melissa', '245-776-0585', 'aculwen9@qq.com', 'Stoughton', '87452', 'Chayek');

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

insert into instructor_instrument (instructor_id, instrument_id) values ((SELECT instructor_id FROM instructor WHERE name = 'Olivia'),(SELECT instrument_id FROM instrument WHERE instrument = 'Piano'));
insert into instructor_instrument (instructor_id, instrument_id) values ((SELECT instructor_id FROM instructor WHERE name = 'Olivia'),(SELECT instrument_id FROM instrument WHERE instrument = 'Triangle'));
insert into instructor_instrument (instructor_id, instrument_id) values ((SELECT instructor_id FROM instructor WHERE name = 'Olivia'),(SELECT instrument_id FROM instrument WHERE instrument = 'Guitar'));
insert into instructor_instrument (instructor_id, instrument_id) values ((SELECT instructor_id FROM instructor WHERE name = 'Ava'),(SELECT instrument_id FROM instrument WHERE instrument = 'Guitar'));
insert into instructor_instrument (instructor_id, instrument_id) values ((SELECT instructor_id FROM instructor WHERE name = 'Ava'),(SELECT instrument_id FROM instrument WHERE instrument = 'Harp'));
insert into instructor_instrument (instructor_id, instrument_id) values ((SELECT instructor_id FROM instructor WHERE name = 'Ava'),(SELECT instrument_id FROM instrument WHERE instrument = 'Base'));
insert into instructor_instrument (instructor_id, instrument_id) values ((SELECT instructor_id FROM instructor WHERE name = 'Iris'),(SELECT instrument_id FROM instrument WHERE instrument = 'Piano'));
insert into instructor_instrument (instructor_id, instrument_id) values ((SELECT instructor_id FROM instructor WHERE name = 'Iris'),(SELECT instrument_id FROM instrument WHERE instrument = 'Saxophone'));
insert into instructor_instrument (instructor_id, instrument_id) values ((SELECT instructor_id FROM instructor WHERE name = 'Iris'),(SELECT instrument_id FROM instrument WHERE instrument = 'Tambourine'));
insert into instructor_instrument (instructor_id, instrument_id) values ((SELECT instructor_id FROM instructor WHERE name = 'Sophia'),(SELECT instrument_id FROM instrument WHERE instrument = 'Flute'));
insert into instructor_instrument (instructor_id, instrument_id) values ((SELECT instructor_id FROM instructor WHERE name = 'Sophia'),(SELECT instrument_id FROM instrument WHERE instrument = 'Trumpet'));
insert into instructor_instrument (instructor_id, instrument_id) values ((SELECT instructor_id FROM instructor WHERE name = 'Samantha'),(SELECT instrument_id FROM instrument WHERE instrument = 'Harp'));
insert into instructor_instrument (instructor_id, instrument_id) values ((SELECT instructor_id FROM instructor WHERE name = 'Hannah'),(SELECT instrument_id FROM instrument WHERE instrument = 'Base'));
insert into instructor_instrument (instructor_id, instrument_id) values ((SELECT instructor_id FROM instructor WHERE name = 'Hannah'),(SELECT instrument_id FROM instrument WHERE instrument = 'Guitar'));
insert into instructor_instrument (instructor_id, instrument_id) values ((SELECT instructor_id FROM instructor WHERE name = 'Amy'),(SELECT instrument_id FROM instrument WHERE instrument = 'Triangle'));
insert into instructor_instrument (instructor_id, instrument_id) values ((SELECT instructor_id FROM instructor WHERE name = 'Amy'),(SELECT instrument_id FROM instrument WHERE instrument = 'Flute'));
insert into instructor_instrument (instructor_id, instrument_id) values ((SELECT instructor_id FROM instructor WHERE name = 'Melissa'),(SELECT instrument_id FROM instrument WHERE instrument = 'Violin'));
insert into instructor_instrument (instructor_id, instrument_id) values ((SELECT instructor_id FROM instructor WHERE name = 'Melissa'),(SELECT instrument_id FROM instrument WHERE instrument = 'Tambourine'));

insert into rental_instrument (instrument, brand, category) values ('Guitar', 'Chevrolet', 'String');
insert into rental_instrument (instrument, brand, category) values ('Guitar', '1', 'String');
insert into rental_instrument (instrument, brand, category) values ('Guitar', '2', 'String');
insert into rental_instrument (instrument, brand, category) values ('Guitar', '3', 'String');
insert into rental_instrument (instrument, brand, category) values ('Guitar', '4', 'String');
insert into rental_instrument (instrument, brand, category) values ('Guitar', '5', 'String');
insert into rental_instrument (instrument, brand, category) values ('Guitar', '6', 'String');
insert into rental_instrument (instrument, brand, category) values ('Guitar', '7', 'String');
insert into rental_instrument (instrument, brand, category) values ('Guitar', '8', 'String');
insert into rental_instrument (instrument, brand, category) values ('Guitar', '9', 'String');
insert into rental_instrument (instrument, brand, category) values ('Piano', 'Steinway', 'String');
insert into rental_instrument (instrument, brand, category) values ('Violin', '1', 'String');
insert into rental_instrument (instrument, brand, category) values ('Violin', '2', 'String');
insert into rental_instrument (instrument, brand, category) values ('Violin', '3', 'String');
insert into rental_instrument (instrument, brand, category) values ('Violin', '4', 'String');
insert into rental_instrument (instrument, brand, category) values ('Violin', '5', 'String');
insert into rental_instrument (instrument, brand, category) values ('Base', 'Toyota', 'String');
insert into rental_instrument (instrument, brand, category) values ('Harp', 'Subaru', 'String');
insert into rental_instrument (instrument, brand, category) values ('Flute', '1', 'Wind');
insert into rental_instrument (instrument, brand, category) values ('Flute', '2', 'Wind');
insert into rental_instrument (instrument, brand, category) values ('Flute', '3', 'Wind');
insert into rental_instrument (instrument, brand, category) values ('Flute', '4', 'Wind');
insert into rental_instrument (instrument, brand, category) values ('Flute', '5', 'Wind');
insert into rental_instrument (instrument, brand, category) values ('Flute', '6', 'Wind');
insert into rental_instrument (instrument, brand, category) values ('Saxophone', 'Mercury', 'Wind');
insert into rental_instrument (instrument, brand, category) values ('Trumpet', 'Ford', 'Wind');
insert into rental_instrument (instrument, brand, category) values ('Triangle', 'Lincoln', 'Percussion');
insert into rental_instrument (instrument, brand, category) values ('Tambourine', 'Chevrolet', 'Percussion');

insert into compensation_schema (base_compensation, individual_lesson_quanitifier ,group_lesson_quantifier,ensemble_quantifier, beginner_quantifier, intermediate_quantifier, advanced_quantifier) values (25, 1.25, 1, 0.25, 1, 2, 3);

insert into pricing_schema (base_price, individual_lesson_quanitifier,group_lesson_quantifier,ensemble_quantifier, beginner_quantifier , advanced_quantifier,intermediate_quantifier, discount_percentage) values (25, 1.25, 1, 0.25, 1, 2, 3, 5);

insert into additional_contact_person (student_id, name, email, phone) values ((SELECT student_id FROM student WHERE name = 'Adam'), 'Lizzie Earwaker', 'learwaker0@cocolog-nifty.com', '495-737-3797');
insert into additional_contact_person (student_id, name, email, phone) values ((SELECT student_id FROM student WHERE name = 'William'), 'Kinnie Kerwood', 'kkerwood1@cocolog-nifty.com', '927-117-5495');
insert into additional_contact_person (student_id, name, email, phone) values ((SELECT student_id FROM student WHERE name = 'Robert'), 'Merlina Roache', 'mroache2@dagondesign.com', '564-633-7598');

insert into sibling_relationship (first_student_id, second_student_id) values ((SELECT student_id FROM student WHERE name = 'Adam'), (SELECT student_id FROM student WHERE name = 'Johan'));
insert into sibling_relationship (first_student_id, second_student_id) values ((SELECT student_id FROM student WHERE name = 'Adam'), (SELECT student_id FROM student WHERE name = 'Chai'));
insert into sibling_relationship (first_student_id, second_student_id) values ((SELECT student_id FROM student WHERE name = 'Johan'), (SELECT student_id FROM student WHERE name = 'Chai'));
insert into sibling_relationship (first_student_id, second_student_id) values ((SELECT student_id FROM student WHERE name = 'David'), (SELECT student_id FROM student WHERE name = 'Filip'));
insert into sibling_relationship (first_student_id, second_student_id) values ((SELECT student_id FROM student WHERE name = 'Robert'), (SELECT student_id FROM student WHERE name = 'Michael'));
insert into sibling_relationship (first_student_id, second_student_id) values ((SELECT student_id FROM student WHERE name = 'Robert'), (SELECT student_id FROM student WHERE name = 'Donald'));
insert into sibling_relationship (first_student_id, second_student_id) values ((SELECT student_id FROM student WHERE name = 'Michael'), (SELECT student_id FROM student WHERE name = 'Donald'));



insert into instrument_fee (rental_instrument_id, fee, starting_from) values ((SELECT rental_instrument_id FROM rental_instrument WHERE instrument = 'Guitar' AND brand = 'Chevrolet'), 300, '07/02/2022');
insert into instrument_fee (rental_instrument_id, fee, starting_from) values ((SELECT rental_instrument_id FROM rental_instrument WHERE instrument = 'Guitar' AND brand = '1'), 100, '07/02/2022');
insert into instrument_fee (rental_instrument_id, fee, starting_from) values ((SELECT rental_instrument_id FROM rental_instrument WHERE instrument = 'Guitar' AND brand = '2'), 200, '07/02/2022');
insert into instrument_fee (rental_instrument_id, fee, starting_from) values ((SELECT rental_instrument_id FROM rental_instrument WHERE instrument = 'Guitar' AND brand = '3'), 300, '07/02/2022');
insert into instrument_fee (rental_instrument_id, fee, starting_from) values ((SELECT rental_instrument_id FROM rental_instrument WHERE instrument = 'Guitar' AND brand = '4'), 400, '07/02/2022');
insert into instrument_fee (rental_instrument_id, fee, starting_from) values ((SELECT rental_instrument_id FROM rental_instrument WHERE instrument = 'Guitar' AND brand = '5'), 500, '07/02/2022');
insert into instrument_fee (rental_instrument_id, fee, starting_from) values ((SELECT rental_instrument_id FROM rental_instrument WHERE instrument = 'Guitar' AND brand = '6'), 600, '07/02/2022');
insert into instrument_fee (rental_instrument_id, fee, starting_from) values ((SELECT rental_instrument_id FROM rental_instrument WHERE instrument = 'Guitar' AND brand = '7'), 700, '07/02/2022');
insert into instrument_fee (rental_instrument_id, fee, starting_from) values ((SELECT rental_instrument_id FROM rental_instrument WHERE instrument = 'Guitar' AND brand = '8'), 800, '07/02/2022');
insert into instrument_fee (rental_instrument_id, fee, starting_from) values ((SELECT rental_instrument_id FROM rental_instrument WHERE instrument = 'Guitar' AND brand = '9'), 900, '07/02/2022');
insert into instrument_fee (rental_instrument_id, fee, starting_from) values ((SELECT rental_instrument_id FROM rental_instrument WHERE instrument = 'Piano'), 300, '07/02/2022');
insert into instrument_fee (rental_instrument_id, fee, starting_from) values ((SELECT rental_instrument_id FROM rental_instrument WHERE instrument = 'Violin' AND brand = '1'), 100, '07/02/2022');
insert into instrument_fee (rental_instrument_id, fee, starting_from) values ((SELECT rental_instrument_id FROM rental_instrument WHERE instrument = 'Violin' AND brand = '2'), 200, '07/02/2022');
insert into instrument_fee (rental_instrument_id, fee, starting_from) values ((SELECT rental_instrument_id FROM rental_instrument WHERE instrument = 'Violin' AND brand = '3'), 300, '07/02/2022');
insert into instrument_fee (rental_instrument_id, fee, starting_from) values ((SELECT rental_instrument_id FROM rental_instrument WHERE instrument = 'Violin' AND brand = '4'), 400, '07/02/2022');
insert into instrument_fee (rental_instrument_id, fee, starting_from) values ((SELECT rental_instrument_id FROM rental_instrument WHERE instrument = 'Violin' AND brand = '5'), 500, '07/02/2022');
insert into instrument_fee (rental_instrument_id, fee, starting_from) values ((SELECT rental_instrument_id FROM rental_instrument WHERE instrument = 'Base'), 300, '07/02/2022');
insert into instrument_fee (rental_instrument_id, fee, starting_from) values ((SELECT rental_instrument_id FROM rental_instrument WHERE instrument = 'Harp'), 300, '07/02/2022');
insert into instrument_fee (rental_instrument_id, fee, starting_from) values ((SELECT rental_instrument_id FROM rental_instrument WHERE instrument = 'Flute' AND brand = '1'), 100, '07/02/2022');
insert into instrument_fee (rental_instrument_id, fee, starting_from) values ((SELECT rental_instrument_id FROM rental_instrument WHERE instrument = 'Flute' AND brand = '2'), 200, '07/02/2022');
insert into instrument_fee (rental_instrument_id, fee, starting_from) values ((SELECT rental_instrument_id FROM rental_instrument WHERE instrument = 'Flute' AND brand = '3'), 300, '07/02/2022');
insert into instrument_fee (rental_instrument_id, fee, starting_from) values ((SELECT rental_instrument_id FROM rental_instrument WHERE instrument = 'Flute' AND brand = '4'), 400, '07/02/2022');
insert into instrument_fee (rental_instrument_id, fee, starting_from) values ((SELECT rental_instrument_id FROM rental_instrument WHERE instrument = 'Flute' AND brand = '5'), 500, '07/02/2022');
insert into instrument_fee (rental_instrument_id, fee, starting_from) values ((SELECT rental_instrument_id FROM rental_instrument WHERE instrument = 'Flute' AND brand = '6'), 600, '07/02/2022');
insert into instrument_fee (rental_instrument_id, fee, starting_from) values ((SELECT rental_instrument_id FROM rental_instrument WHERE instrument = 'Saxophone'), 300, '07/02/2022');
insert into instrument_fee (rental_instrument_id, fee, starting_from) values ((SELECT rental_instrument_id FROM rental_instrument WHERE instrument = 'Trumpet'), 300, '07/02/2022');
insert into instrument_fee (rental_instrument_id, fee, starting_from) values ((SELECT rental_instrument_id FROM rental_instrument WHERE instrument = 'Triangle'), 300, '07/02/2022');
insert into instrument_fee (rental_instrument_id, fee, starting_from) values ((SELECT rental_instrument_id FROM rental_instrument WHERE instrument = 'Tambourine'), 300, '07/02/2022');

insert into rental_agreement (date_rented, date_returned, student_id, rental_instrument_id) values ('10/02/2022', null, (SELECT student_id FROM student WHERE name = 'Adam'), (SELECT rental_instrument_id FROM rental_instrument WHERE instrument = 'Piano'));
insert into rental_agreement (date_rented, date_returned, student_id, rental_instrument_id) values ('10/02/2022', null, (SELECT student_id FROM student WHERE name = 'Chai'), (SELECT rental_instrument_id FROM rental_instrument WHERE instrument = 'Base'));
insert into rental_agreement (date_rented, date_returned, student_id, rental_instrument_id) values ('10/02/2022', null, (SELECT student_id FROM student WHERE name = 'William'), (SELECT rental_instrument_id FROM rental_instrument WHERE instrument = 'Violin' AND brand = '1'));
insert into rental_agreement (date_rented, date_returned, student_id, rental_instrument_id) values ('10/02/2022', null, (SELECT student_id FROM student WHERE name = 'William'), (SELECT rental_instrument_id FROM rental_instrument WHERE instrument = 'Violin' AND brand = '2'));
insert into rental_agreement (date_rented, date_returned, student_id, rental_instrument_id) values ('10/02/2022', null, (SELECT student_id FROM student WHERE name = 'James'), (SELECT rental_instrument_id FROM rental_instrument WHERE instrument = 'Guitar' AND brand = '1'));
insert into rental_agreement (date_rented, date_returned, student_id, rental_instrument_id) values ('10/02/2022', null, (SELECT student_id FROM student WHERE name = 'James'), (SELECT rental_instrument_id FROM rental_instrument WHERE instrument = 'Guitar' AND brand = '2'));


insert into ensemble (min_no_of_students, max_no_of_students, genre, time, date, instructor_id, pricing_schema_id, compensation_schema_id) values (1, 10, 'Jazz', '18:00', '10/02/2022', (SELECT instructor_id FROM instructor WHERE name = 'Olivia'), (SELECT pricing_schema_id FROM pricing_schema),(SELECT compensation_schema_id FROM compensation_schema));
insert into ensemble (min_no_of_students, max_no_of_students, genre, time, date, instructor_id, pricing_schema_id, compensation_schema_id) values (1, 10, 'Jazz', '20:00', '12/01/2022', (SELECT instructor_id FROM instructor WHERE name = 'Olivia'), (SELECT pricing_schema_id FROM pricing_schema),(SELECT compensation_schema_id FROM compensation_schema));
insert into ensemble (min_no_of_students, max_no_of_students, genre, time, date, instructor_id, pricing_schema_id, compensation_schema_id) values (1, 10, 'Jazz', '19:00', '12/01/2022', (SELECT instructor_id FROM instructor WHERE name = 'Olivia'), (SELECT pricing_schema_id FROM pricing_schema),(SELECT compensation_schema_id FROM compensation_schema));
insert into ensemble (min_no_of_students, max_no_of_students, genre, time, date, instructor_id, pricing_schema_id, compensation_schema_id) values (1, 10, 'Jazz', '18:00', '12/01/2022', (SELECT instructor_id FROM instructor WHERE name = 'Olivia'), (SELECT pricing_schema_id FROM pricing_schema),(SELECT compensation_schema_id FROM compensation_schema));
insert into ensemble (min_no_of_students, max_no_of_students, genre, time, date, instructor_id, pricing_schema_id, compensation_schema_id) values (1, 10, 'Jazz', '17:00', '12/01/2022', (SELECT instructor_id FROM instructor WHERE name = 'Olivia'), (SELECT pricing_schema_id FROM pricing_schema),(SELECT compensation_schema_id FROM compensation_schema));
insert into ensemble (min_no_of_students, max_no_of_students, genre, time, date, instructor_id, pricing_schema_id, compensation_schema_id) values (1, 10, 'Rock', '08:00', '12/01/2022', (SELECT instructor_id FROM instructor WHERE name = 'Amy'), (SELECT pricing_schema_id FROM pricing_schema),(SELECT compensation_schema_id FROM compensation_schema));
insert into ensemble (min_no_of_students, max_no_of_students, genre, time, date, instructor_id, pricing_schema_id, compensation_schema_id) values (1, 10, 'Rock', '07:00', '12/01/2022', (SELECT instructor_id FROM instructor WHERE name = 'Amy'), (SELECT pricing_schema_id FROM pricing_schema),(SELECT compensation_schema_id FROM compensation_schema));
insert into ensemble (min_no_of_students, max_no_of_students, genre, time, date, instructor_id, pricing_schema_id, compensation_schema_id) values (1, 10, 'Rock', '06:00', '12/01/2022', (SELECT instructor_id FROM instructor WHERE name = 'Amy'), (SELECT pricing_schema_id FROM pricing_schema),(SELECT compensation_schema_id FROM compensation_schema));
insert into ensemble (min_no_of_students, max_no_of_students, genre, time, date, instructor_id, pricing_schema_id, compensation_schema_id) values (1, 10, 'Jazz', '18:00', '12/05/2022', (SELECT instructor_id FROM instructor WHERE name = 'Olivia'), (SELECT pricing_schema_id FROM pricing_schema),(SELECT compensation_schema_id FROM compensation_schema));
insert into ensemble (min_no_of_students, max_no_of_students, genre, time, date, instructor_id, pricing_schema_id, compensation_schema_id) values (1, 10, 'Jazz', '20:00', '12/06/2022', (SELECT instructor_id FROM instructor WHERE name = 'Olivia'), (SELECT pricing_schema_id FROM pricing_schema),(SELECT compensation_schema_id FROM compensation_schema));

insert into ensemble (min_no_of_students, max_no_of_students, genre, time, date, instructor_id, pricing_schema_id, compensation_schema_id) values (1, 3, 'Jazz', '19:00', '12/07/2022', (SELECT instructor_id FROM instructor WHERE name = 'Olivia'), (SELECT pricing_schema_id FROM pricing_schema),(SELECT compensation_schema_id FROM compensation_schema));
insert into ensemble (min_no_of_students, max_no_of_students, genre, time, date, instructor_id, pricing_schema_id, compensation_schema_id) values (3, 4, 'Jazz', '18:00', '12/08/2022', (SELECT instructor_id FROM instructor WHERE name = 'Olivia'), (SELECT pricing_schema_id FROM pricing_schema),(SELECT compensation_schema_id FROM compensation_schema));
insert into ensemble (min_no_of_students, max_no_of_students, genre, time, date, instructor_id, pricing_schema_id, compensation_schema_id) values (1, 6, 'Jazz', '17:00', '12/09/2022', (SELECT instructor_id FROM instructor WHERE name = 'Olivia'), (SELECT pricing_schema_id FROM pricing_schema),(SELECT compensation_schema_id FROM compensation_schema));
insert into ensemble (min_no_of_students, max_no_of_students, genre, time, date, instructor_id, pricing_schema_id, compensation_schema_id) values (1, 4, 'Rock', '08:00', '12/10/2022', (SELECT instructor_id FROM instructor WHERE name = 'Amy'), (SELECT pricing_schema_id FROM pricing_schema),(SELECT compensation_schema_id FROM compensation_schema));
insert into ensemble (min_no_of_students, max_no_of_students, genre, time, date, instructor_id, pricing_schema_id, compensation_schema_id) values (1, 5, 'Rock', '07:00', '12/11/2022', (SELECT instructor_id FROM instructor WHERE name = 'Amy'), (SELECT pricing_schema_id FROM pricing_schema),(SELECT compensation_schema_id FROM compensation_schema));
insert into ensemble (min_no_of_students, max_no_of_students, genre, time, date, instructor_id, pricing_schema_id, compensation_schema_id) values (1, 5, 'Rock', '06:00', '12/11/2022', (SELECT instructor_id FROM instructor WHERE name = 'Amy'), (SELECT pricing_schema_id FROM pricing_schema),(SELECT compensation_schema_id FROM compensation_schema));

insert into level(level) values ('beginner');
insert into level(level) values ('intermediate');
insert into level(level) values ('advanced');

insert into student_ensemble(ensemble_id, student_id) values ((SELECT ensemble_id FROM ensemble WHERE date = '10/02/2022' AND time = '18:00'), (SELECT student_id FROM student WHERE name = 'Adam'));
insert into student_ensemble(ensemble_id, student_id) values ((SELECT ensemble_id FROM ensemble WHERE date = '12/01/2022' AND time = '20:00'), (SELECT student_id FROM student WHERE name = 'Filip'));

insert into student_ensemble(ensemble_id, student_id) values ((SELECT ensemble_id FROM ensemble WHERE date = '12/07/2022' AND time = '19:00'), (SELECT student_id FROM student WHERE name = 'Filip')); -- 3/3 FULL booked
insert into student_ensemble(ensemble_id, student_id) values ((SELECT ensemble_id FROM ensemble WHERE date = '12/07/2022' AND time = '19:00'), (SELECT student_id FROM student WHERE name = 'Adam'));
insert into student_ensemble(ensemble_id, student_id) values ((SELECT ensemble_id FROM ensemble WHERE date = '12/07/2022' AND time = '19:00'), (SELECT student_id FROM student WHERE name = 'Chai'));

insert into student_ensemble(ensemble_id, student_id) values ((SELECT ensemble_id FROM ensemble WHERE date = '12/08/2022' AND time = '18:00'), (SELECT student_id FROM student WHERE name = 'David')); -- 3/4 1 left
insert into student_ensemble(ensemble_id, student_id) values ((SELECT ensemble_id FROM ensemble WHERE date = '12/08/2022' AND time = '18:00'), (SELECT student_id FROM student WHERE name = 'Johan'));
insert into student_ensemble(ensemble_id, student_id) values ((SELECT ensemble_id FROM ensemble WHERE date = '12/08/2022' AND time = '18:00'), (SELECT student_id FROM student WHERE name = 'James'));

insert into student_ensemble(ensemble_id, student_id) values ((SELECT ensemble_id FROM ensemble WHERE date = '12/09/2022' AND time = '17:00'), (SELECT student_id FROM student WHERE name = 'Robert')); -- 2/6
insert into student_ensemble(ensemble_id, student_id) values ((SELECT ensemble_id FROM ensemble WHERE date = '12/09/2022' AND time = '17:00'), (SELECT student_id FROM student WHERE name = 'Michael'));

insert into student_ensemble(ensemble_id, student_id) values ((SELECT ensemble_id FROM ensemble WHERE date = '12/10/2022' AND time = '08:00'), (SELECT student_id FROM student WHERE name = 'William')); -- 2/4 2 left
insert into student_ensemble(ensemble_id, student_id) values ((SELECT ensemble_id FROM ensemble WHERE date = '12/10/2022' AND time = '08:00'), (SELECT student_id FROM student WHERE name = 'Donald'));

insert into student_ensemble(ensemble_id, student_id) values ((SELECT ensemble_id FROM ensemble WHERE date = '12/11/2022' AND time = '07:00'), (SELECT student_id FROM student WHERE name = 'Adam')); -- 5/5 FULL booked
insert into student_ensemble(ensemble_id, student_id) values ((SELECT ensemble_id FROM ensemble WHERE date = '12/11/2022' AND time = '07:00'), (SELECT student_id FROM student WHERE name = 'Filip'));
insert into student_ensemble(ensemble_id, student_id) values ((SELECT ensemble_id FROM ensemble WHERE date = '12/11/2022' AND time = '07:00'), (SELECT student_id FROM student WHERE name = 'Donald'));
insert into student_ensemble(ensemble_id, student_id) values ((SELECT ensemble_id FROM ensemble WHERE date = '12/11/2022' AND time = '07:00'), (SELECT student_id FROM student WHERE name = 'Chai'));
insert into student_ensemble(ensemble_id, student_id) values ((SELECT ensemble_id FROM ensemble WHERE date = '12/11/2022' AND time = '07:00'), (SELECT student_id FROM student WHERE name = 'Johan'));

insert into student_ensemble(ensemble_id, student_id) values ((SELECT ensemble_id FROM ensemble WHERE date = '12/11/2022' AND time = '06:00'), (SELECT student_id FROM student WHERE name = 'Adam')); -- 4/5 1 left
insert into student_ensemble(ensemble_id, student_id) values ((SELECT ensemble_id FROM ensemble WHERE date = '12/11/2022' AND time = '06:00'), (SELECT student_id FROM student WHERE name = 'Donald'));
insert into student_ensemble(ensemble_id, student_id) values ((SELECT ensemble_id FROM ensemble WHERE date = '12/11/2022' AND time = '06:00'), (SELECT student_id FROM student WHERE name = 'William'));
insert into student_ensemble(ensemble_id, student_id) values ((SELECT ensemble_id FROM ensemble WHERE date = '12/11/2022' AND time = '06:00'), (SELECT student_id FROM student WHERE name = 'Robert'));

insert into ensemble_instrument(ensemble_id, instrument_id) values ((SELECT ensemble_id FROM ensemble WHERE date = '12/01/2022' AND time = '17:00'), (SELECT instrument_id FROM instrument WHERE instrument = 'Piano'));
insert into ensemble_instrument(ensemble_id, instrument_id) values ((SELECT ensemble_id FROM ensemble WHERE date = '12/01/2022' AND time = '18:00'), (SELECT instrument_id FROM instrument WHERE instrument = 'Guitar'));
insert into ensemble_instrument(ensemble_id, instrument_id) values ((SELECT ensemble_id FROM ensemble WHERE date = '12/01/2022' AND time = '20:00'), (SELECT instrument_id FROM instrument WHERE instrument = 'Violin'));

insert into individual_lesson (time, date, instructor_id, student_id, instrument_id, pricing_schema_id ,compensation_schema_id ,level_id) values ('18:00', '11/02/2022', (SELECT instructor_id FROM instructor WHERE name = 'Iris'), (SELECT student_id FROM student WHERE name = 'Chai'), (SELECT instrument_id FROM instrument WHERE instrument = 'Piano'), (SELECT pricing_schema_id FROM pricing_schema), (SELECT compensation_schema_id FROM compensation_schema), (SELECT level_id FROM level WHERE level = 'beginner'));
insert into individual_lesson (time, date, instructor_id, student_id, instrument_id, pricing_schema_id ,compensation_schema_id ,level_id) values ('20:00', '11/04/2022', (SELECT instructor_id FROM instructor WHERE name = 'Iris'), (SELECT student_id FROM student WHERE name = 'Chai'),(SELECT instrument_id FROM instrument WHERE instrument = 'Saxophone'), (SELECT pricing_schema_id FROM pricing_schema), (SELECT compensation_schema_id FROM compensation_schema), (SELECT level_id FROM level WHERE level = 'intermediate'));
insert into individual_lesson (time, date, instructor_id, student_id, instrument_id, pricing_schema_id ,compensation_schema_id ,level_id) values ('20:00', '12/01/2022', (SELECT instructor_id FROM instructor WHERE name = 'Iris'), (SELECT student_id FROM student WHERE name = 'Chai'),(SELECT instrument_id FROM instrument WHERE instrument = 'Saxophone'), (SELECT pricing_schema_id FROM pricing_schema), (SELECT compensation_schema_id FROM compensation_schema), (SELECT level_id FROM level WHERE level = 'intermediate'));
insert into individual_lesson (time, date, instructor_id, student_id, instrument_id, pricing_schema_id ,compensation_schema_id ,level_id) values ('20:00', '12/01/2022', (SELECT instructor_id FROM instructor WHERE name = 'Iris'), (SELECT student_id FROM student WHERE name = 'Chai'),(SELECT instrument_id FROM instrument WHERE instrument = 'Saxophone'), (SELECT pricing_schema_id FROM pricing_schema), (SELECT compensation_schema_id FROM compensation_schema), (SELECT level_id FROM level WHERE level = 'intermediate'));
insert into individual_lesson (time, date, instructor_id, student_id, instrument_id, pricing_schema_id ,compensation_schema_id ,level_id) values ('20:00', '12/01/2022', (SELECT instructor_id FROM instructor WHERE name = 'Iris'), (SELECT student_id FROM student WHERE name = 'Chai'),(SELECT instrument_id FROM instrument WHERE instrument = 'Saxophone'), (SELECT pricing_schema_id FROM pricing_schema), (SELECT compensation_schema_id FROM compensation_schema), (SELECT level_id FROM level WHERE level = 'intermediate'));
insert into individual_lesson (time, date, instructor_id, student_id, instrument_id, pricing_schema_id ,compensation_schema_id ,level_id) values ('17:00', '12/01/2022', (SELECT instructor_id FROM instructor WHERE name = 'Sarah'), (SELECT student_id FROM student WHERE name = 'Chai'),(SELECT instrument_id FROM instrument WHERE instrument = 'Piano'), (SELECT pricing_schema_id FROM pricing_schema), (SELECT compensation_schema_id FROM compensation_schema), (SELECT level_id FROM level WHERE level = 'intermediate'));
insert into individual_lesson (time, date, instructor_id, student_id, instrument_id, pricing_schema_id ,compensation_schema_id ,level_id) values ('15:00', '12/01/2022', (SELECT instructor_id FROM instructor WHERE name = 'Sarah'), (SELECT student_id FROM student WHERE name = 'Chai'),(SELECT instrument_id FROM instrument WHERE instrument = 'Piano'), (SELECT pricing_schema_id FROM pricing_schema), (SELECT compensation_schema_id FROM compensation_schema), (SELECT level_id FROM level WHERE level = 'beginner'));
insert into individual_lesson (time, date, instructor_id, student_id, instrument_id, pricing_schema_id ,compensation_schema_id ,level_id) values ('20:00', '12/01/2022', (SELECT instructor_id FROM instructor WHERE name = 'Sarah'), (SELECT student_id FROM student WHERE name = 'Chai'),(SELECT instrument_id FROM instrument WHERE instrument = 'Piano'), (SELECT pricing_schema_id FROM pricing_schema), (SELECT compensation_schema_id FROM compensation_schema), (SELECT level_id FROM level WHERE level = 'beginner'));
insert into individual_lesson (time, date, instructor_id, student_id, instrument_id, pricing_schema_id ,compensation_schema_id ,level_id) values ('23:00', '12/01/2022', (SELECT instructor_id FROM instructor WHERE name = 'Sarah'), (SELECT student_id FROM student WHERE name = 'William'),(SELECT instrument_id FROM instrument WHERE instrument = 'Piano'), (SELECT pricing_schema_id FROM pricing_schema), (SELECT compensation_schema_id FROM compensation_schema), (SELECT level_id FROM level WHERE level = 'beginner'));
insert into individual_lesson (time, date, instructor_id, student_id, instrument_id, pricing_schema_id ,compensation_schema_id ,level_id) values ('23:00', '12/01/2022', (SELECT instructor_id FROM instructor WHERE name = 'Sarah'), NULL,(SELECT instrument_id FROM instrument WHERE instrument = 'Piano'), (SELECT pricing_schema_id FROM pricing_schema), (SELECT compensation_schema_id FROM compensation_schema), (SELECT level_id FROM level WHERE level = 'beginner'));


insert into group_lesson (min_no_of_students, max_no_of_students, time, date, instructor_id, pricing_schema_id, compensation_schema_id, level_id, instrument_id) values (1, 8, '18:00', '10/02/2022', (SELECT instructor_id FROM instructor WHERE name = 'Samantha'), (SELECT pricing_schema_id FROM pricing_schema),(SELECT compensation_schema_id FROM compensation_schema), (SELECT level_id FROM level WHERE level = 'advanced'), (SELECT instrument_id FROM instrument WHERE instrument = 'Harp'));
insert into group_lesson (min_no_of_students, max_no_of_students, time, date, instructor_id, pricing_schema_id, compensation_schema_id, level_id, instrument_id) values (1, 8, '18:00', '08/12/2022', (SELECT instructor_id FROM instructor WHERE name = 'Samantha'), (SELECT pricing_schema_id FROM pricing_schema),(SELECT compensation_schema_id FROM compensation_schema), (SELECT level_id FROM level WHERE level = 'advanced'), (SELECT instrument_id FROM instrument WHERE instrument = 'Harp'));
insert into group_lesson (min_no_of_students, max_no_of_students, time, date, instructor_id, pricing_schema_id, compensation_schema_id, level_id, instrument_id) values (1, 8, '18:00', '05/03/2022', (SELECT instructor_id FROM instructor WHERE name = 'Samantha'), (SELECT pricing_schema_id FROM pricing_schema),(SELECT compensation_schema_id FROM compensation_schema), (SELECT level_id FROM level WHERE level = 'advanced'), (SELECT instrument_id FROM instrument WHERE instrument = 'Harp'));
insert into group_lesson (min_no_of_students, max_no_of_students, time, date, instructor_id, pricing_schema_id, compensation_schema_id, level_id, instrument_id) values (1, 8, '18:00', '12/04/2022', (SELECT instructor_id FROM instructor WHERE name = 'Samantha'), (SELECT pricing_schema_id FROM pricing_schema),(SELECT compensation_schema_id FROM compensation_schema), (SELECT level_id FROM level WHERE level = 'advanced'), (SELECT instrument_id FROM instrument WHERE instrument = 'Harp'));
insert into group_lesson (min_no_of_students, max_no_of_students, time, date, instructor_id, pricing_schema_id, compensation_schema_id, level_id, instrument_id) values (1, 8, '18:00', '12/15/2022', (SELECT instructor_id FROM instructor WHERE name = 'Samantha'), (SELECT pricing_schema_id FROM pricing_schema),(SELECT compensation_schema_id FROM compensation_schema), (SELECT level_id FROM level WHERE level = 'advanced'), (SELECT instrument_id FROM instrument WHERE instrument = 'Harp'));
insert into group_lesson (min_no_of_students, max_no_of_students, time, date, instructor_id, pricing_schema_id, compensation_schema_id, level_id, instrument_id) values (10, 50, '15:00', '11/21/2022', (SELECT instructor_id FROM instructor WHERE name = 'Amy'), (SELECT pricing_schema_id FROM pricing_schema),(SELECT compensation_schema_id FROM compensation_schema), (SELECT level_id FROM level WHERE level = 'advanced'), (SELECT instrument_id FROM instrument WHERE instrument = 'Triangle'));
insert into group_lesson (min_no_of_students, max_no_of_students, time, date, instructor_id, pricing_schema_id, compensation_schema_id, level_id, instrument_id) values (3, 15, '15:00', '06/03/2022', (SELECT instructor_id FROM instructor WHERE name = 'Amy'), (SELECT pricing_schema_id FROM pricing_schema),(SELECT compensation_schema_id FROM compensation_schema), (SELECT level_id FROM level WHERE level = 'advanced'), (SELECT instrument_id FROM instrument WHERE instrument = 'Guitar'));
insert into group_lesson (min_no_of_students, max_no_of_students, time, date, instructor_id, pricing_schema_id, compensation_schema_id, level_id, instrument_id) values (4, 12, '15:00', '06/03/2022', (SELECT instructor_id FROM instructor WHERE name = 'Amy'), (SELECT pricing_schema_id FROM pricing_schema),(SELECT compensation_schema_id FROM compensation_schema), (SELECT level_id FROM level WHERE level = 'advanced'), (SELECT instrument_id FROM instrument WHERE instrument = 'Piano'));
insert into group_lesson (min_no_of_students, max_no_of_students, time, date, instructor_id, pricing_schema_id, compensation_schema_id, level_id, instrument_id) values (4, 12, '15:00', '12/01/2022', (SELECT instructor_id FROM instructor WHERE name = 'Amy'), (SELECT pricing_schema_id FROM pricing_schema),(SELECT compensation_schema_id FROM compensation_schema), (SELECT level_id FROM level WHERE level = 'advanced'), (SELECT instrument_id FROM instrument WHERE instrument = 'Piano'));
insert into group_lesson (min_no_of_students, max_no_of_students, time, date, instructor_id, pricing_schema_id, compensation_schema_id, level_id, instrument_id) values (4, 12, '15:00', '12/01/2022', (SELECT instructor_id FROM instructor WHERE name = 'Amy'), (SELECT pricing_schema_id FROM pricing_schema),(SELECT compensation_schema_id FROM compensation_schema), (SELECT level_id FROM level WHERE level = 'advanced'), (SELECT instrument_id FROM instrument WHERE instrument = 'Piano'));
insert into group_lesson (min_no_of_students, max_no_of_students, time, date, instructor_id, pricing_schema_id, compensation_schema_id, level_id, instrument_id) values (4, 12, '15:00', '12/01/2022', (SELECT instructor_id FROM instructor WHERE name = 'Amy'), (SELECT pricing_schema_id FROM pricing_schema),(SELECT compensation_schema_id FROM compensation_schema), (SELECT level_id FROM level WHERE level = 'advanced'), (SELECT instrument_id FROM instrument WHERE instrument = 'Piano'));
insert into group_lesson (min_no_of_students, max_no_of_students, time, date, instructor_id, pricing_schema_id, compensation_schema_id, level_id, instrument_id) values (4, 12, '15:00', '12/02/2022', (SELECT instructor_id FROM instructor WHERE name = 'Amy'), (SELECT pricing_schema_id FROM pricing_schema),(SELECT compensation_schema_id FROM compensation_schema), (SELECT level_id FROM level WHERE level = 'advanced'), (SELECT instrument_id FROM instrument WHERE instrument = 'Piano'));
insert into group_lesson (min_no_of_students, max_no_of_students, time, date, instructor_id, pricing_schema_id, compensation_schema_id, level_id, instrument_id) values (4, 12, '15:00', '12/01/2022', (SELECT instructor_id FROM instructor WHERE name = 'Amy'), (SELECT pricing_schema_id FROM pricing_schema),(SELECT compensation_schema_id FROM compensation_schema), (SELECT level_id FROM level WHERE level = 'advanced'), (SELECT instrument_id FROM instrument WHERE instrument = 'Piano'));


insert into student_group_lesson (group_lesson_id, student_id) values ((SELECT group_lesson_id FROM group_lesson WHERE date = '11/21/2022'), (SELECT student_id FROM student WHERE name = 'Adam'));
insert into student_group_lesson (group_lesson_id, student_id) values ((SELECT group_lesson_id FROM group_lesson WHERE date = '11/21/2022'), (SELECT student_id FROM student WHERE name = 'Johan'));
insert into student_group_lesson (group_lesson_id, student_id) values ((SELECT group_lesson_id FROM group_lesson WHERE date = '11/21/2022'), (SELECT student_id FROM student WHERE name = 'Chai'));
insert into student_group_lesson (group_lesson_id, student_id) values ((SELECT group_lesson_id FROM group_lesson WHERE date = '11/21/2022'), (SELECT student_id FROM student WHERE name = 'David'));
insert into student_group_lesson (group_lesson_id, student_id) values ((SELECT group_lesson_id FROM group_lesson WHERE date = '11/21/2022'), (SELECT student_id FROM student WHERE name = 'Filip'));
insert into student_group_lesson (group_lesson_id, student_id) values ((SELECT group_lesson_id FROM group_lesson WHERE date = '11/21/2022'), (SELECT student_id FROM student WHERE name = 'James'));
insert into student_group_lesson (group_lesson_id, student_id) values ((SELECT group_lesson_id FROM group_lesson WHERE date = '11/21/2022'), (SELECT student_id FROM student WHERE name = 'Robert'));
insert into student_group_lesson (group_lesson_id, student_id) values ((SELECT group_lesson_id FROM group_lesson WHERE date = '11/21/2022'), (SELECT student_id FROM student WHERE name = 'Michael'));
insert into student_group_lesson (group_lesson_id, student_id) values ((SELECT group_lesson_id FROM group_lesson WHERE date = '11/21/2022'), (SELECT student_id FROM student WHERE name = 'William'));
insert into student_group_lesson (group_lesson_id, student_id) values ((SELECT group_lesson_id FROM group_lesson WHERE date = '11/21/2022'), (SELECT student_id FROM student WHERE name = 'Donald'));

INSERT INTO last_backup (date) values ('09/15/2022');
INSERT INTO last_backup (date) values ('11/15/2022');
