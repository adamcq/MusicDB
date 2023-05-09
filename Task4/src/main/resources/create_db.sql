CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE compensation_schema (
    compensation_schema_id uuid DEFAULT uuid_generate_v4 () NOT NULL, base_compensation FLOAT NOT NULL, individual_lesson_quanitifier FLOAT NOT NULL, group_lesson_quantifier FLOAT NOT NULL, ensemble_quantifier FLOAT NOT NULL, beginner_quantifier FLOAT NOT NULL, intermediate_quantifier FLOAT NOT NULL, advanced_quantifier FLOAT NOT NULL
);

ALTER TABLE compensation_schema
ADD CONSTRAINT PK_compensation_schema PRIMARY KEY (compensation_schema_id);

CREATE TABLE instructor (
    instructor_id uuid DEFAULT uuid_generate_v4 () NOT NULL, personal_number VARCHAR(12) NOT NULL UNIQUE, name VARCHAR(100) NOT NULL, phone VARCHAR(100) NOT NULL, email VARCHAR(100) NOT NULL, address_line VARCHAR(100) NOT NULL, zip VARCHAR(100) NOT NULL, city VARCHAR(100) NOT NULL
);

ALTER TABLE instructor
ADD CONSTRAINT PK_instructor PRIMARY KEY (instructor_id);

CREATE TABLE instrument (
    instrument_id uuid DEFAULT uuid_generate_v4 () NOT NULL, instrument VARCHAR(100) NOT NULL
);

ALTER TABLE instrument
ADD CONSTRAINT PK_instrument PRIMARY KEY (instrument_id);

CREATE TABLE LEVEL (level_id uuid DEFAULT uuid_generate_v4 () NOT NULL, LEVEL VARCHAR(100) UNIQUE);

ALTER TABLE LEVEL
ADD CONSTRAINT PK_level PRIMARY KEY (level_id);

CREATE TABLE pricing_schema (
    pricing_schema_id uuid DEFAULT uuid_generate_v4 () NOT NULL, base_price FLOAT NOT NULL, individual_lesson_quanitifier FLOAT NOT NULL, group_lesson_quantifier FLOAT NOT NULL, ensemble_quantifier FLOAT NOT NULL, beginner_quantifier FLOAT NOT NULL, intermediate_quantifier FLOAT NOT NULL, advanced_quantifier FLOAT NOT NULL, discount_percentage FLOAT NOT NULL
);

ALTER TABLE pricing_schema
ADD CONSTRAINT PK_pricing_schema PRIMARY KEY (pricing_schema_id);

CREATE TABLE rental_instrument (
    rental_instrument_id uuid DEFAULT uuid_generate_v4 () NOT NULL, instrument VARCHAR(100) NOT NULL, brand VARCHAR(100) NOT NULL, category VARCHAR(100) NOT NULL
);

ALTER TABLE rental_instrument
ADD CONSTRAINT PK_rental_instrument PRIMARY KEY (rental_instrument_id);

CREATE TABLE student (
    student_id uuid DEFAULT uuid_generate_v4 () NOT NULL, personal_number VARCHAR(12) NOT NULL UNIQUE, name VARCHAR(100) NOT NULL, phone VARCHAR(100) NOT NULL, email VARCHAR(100) NOT NULL, address_line VARCHAR(100) NOT NULL, zip VARCHAR(100) NOT NULL, city VARCHAR(100) NOT NULL
);

ALTER TABLE student
ADD CONSTRAINT PK_student PRIMARY KEY (student_id);

CREATE TABLE additional_contact_person (
    student_id uuid DEFAULT uuid_generate_v4 () NOT NULL, name VARCHAR(100) NOT NULL, phone VARCHAR(100) NOT NULL, email VARCHAR(100) NOT NULL
);

ALTER TABLE additional_contact_person
ADD CONSTRAINT PK_additional_contact_person PRIMARY KEY (student_id);

CREATE TABLE ensemble (
    ensemble_id uuid DEFAULT uuid_generate_v4 () NOT NULL, min_no_of_students INT NOT NULL, max_no_of_students INT NOT NULL, genre VARCHAR(100) NOT NULL, time TIME NOT NULL, date DATE NOT NULL, instructor_id UUID NOT NULL, pricing_schema_id UUID NOT NULL, compensation_schema_id UUID NOT NULL
);

ALTER TABLE ensemble
ADD CONSTRAINT PK_ensemble PRIMARY KEY (ensemble_id);

CREATE TABLE ensemble_instrument (
    ensemble_id UUID NOT NULL, instrument_id UUID NOT NULL
);

ALTER TABLE ensemble_instrument
ADD CONSTRAINT PK_ensemble_instrument PRIMARY KEY (ensemble_id, instrument_id);

CREATE TABLE group_lesson (
    group_lesson_id uuid DEFAULT uuid_generate_v4 () NOT NULL, min_no_of_students INT NOT NULL, max_no_of_students INT NOT NULL, time TIME NOT NULL, date DATE NOT NULL, instructor_id UUID NOT NULL, pricing_schema_id UUID NOT NULL, compensation_schema_id UUID NOT NULL, level_id UUID NOT NULL, instrument_id UUID NOT NULL
);

ALTER TABLE group_lesson
ADD CONSTRAINT PK_group_lesson PRIMARY KEY (group_lesson_id);

CREATE TABLE individual_lesson (
    individual_lesson_id uuid DEFAULT uuid_generate_v4 () NOT NULL, time TIME NOT NULL, date DATE NOT NULL, instructor_id UUID NOT NULL, student_id UUID, pricing_schema_id UUID NOT NULL, compensation_schema_id UUID NOT NULL, level_id UUID, instrument_id UUID
);

ALTER TABLE individual_lesson
ADD CONSTRAINT PK_individual_lesson PRIMARY KEY (individual_lesson_id);

CREATE TABLE instructor_instrument (
    instrument_id UUID NOT NULL, instructor_id UUID NOT NULL
);

ALTER TABLE instructor_instrument
ADD CONSTRAINT PK_instructor_instrument PRIMARY KEY (instrument_id, instructor_id);

CREATE TABLE instrument_fee (
    instrument_fee_id uuid DEFAULT uuid_generate_v4 () NOT NULL, rental_instrument_id UUID NOT NULL, fee INT NOT NULL, starting_from DATE NOT NULL
);

ALTER TABLE instrument_fee
ADD CONSTRAINT PK_instrument_fee PRIMARY KEY (instrument_fee_id);

CREATE TABLE rental_agreement (
    rental_agreement_id uuid DEFAULT uuid_generate_v4 () NOT NULL, date_rented DATE NOT NULL, date_returned DATE, student_id UUID NOT NULL, rental_instrument_id UUID NOT NULL
);

ALTER TABLE rental_agreement
ADD CONSTRAINT PK_rental_agreement PRIMARY KEY (rental_agreement_id);

CREATE TABLE sibling_relationship (
    first_student_id UUID NOT NULL, second_student_id UUID NOT NULL
);

ALTER TABLE sibling_relationship
ADD CONSTRAINT PK_sibling_relationship PRIMARY KEY (first_student_id, second_student_id);

CREATE TABLE student_ensemble (
    ensemble_id uuid DEFAULT uuid_generate_v4 () NOT NULL, student_id uuid DEFAULT uuid_generate_v4 () NOT NULL
);

ALTER TABLE student_ensemble
ADD CONSTRAINT PK_student_ensemble PRIMARY KEY (ensemble_id, student_id);

CREATE TABLE student_group_lesson (
    group_lesson_id uuid DEFAULT uuid_generate_v4 () NOT NULL, student_id uuid DEFAULT uuid_generate_v4 () NOT NULL
);

ALTER TABLE student_group_lesson
ADD CONSTRAINT PK_student_group_lesson PRIMARY KEY (group_lesson_id, student_id);

ALTER TABLE additional_contact_person
ADD CONSTRAINT FK_additional_contact_person_0 FOREIGN KEY (student_id) REFERENCES student (student_id);

ALTER TABLE ensemble
ADD CONSTRAINT FK_ensemble_0 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id);

ALTER TABLE ensemble
ADD CONSTRAINT FK_ensemble_1 FOREIGN KEY (pricing_schema_id) REFERENCES pricing_schema (pricing_schema_id);

ALTER TABLE ensemble
ADD CONSTRAINT FK_ensemble_2 FOREIGN KEY (compensation_schema_id) REFERENCES compensation_schema (compensation_schema_id);

ALTER TABLE ensemble_instrument
ADD CONSTRAINT FK_ensemble_instrument_0 FOREIGN KEY (ensemble_id) REFERENCES ensemble (ensemble_id);

ALTER TABLE ensemble_instrument
ADD CONSTRAINT FK_ensemble_instrument_1 FOREIGN KEY (instrument_id) REFERENCES instrument (instrument_id);

ALTER TABLE group_lesson
ADD CONSTRAINT FK_group_lesson_0 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id);

ALTER TABLE group_lesson
ADD CONSTRAINT FK_group_lesson_1 FOREIGN KEY (pricing_schema_id) REFERENCES pricing_schema (pricing_schema_id);

ALTER TABLE group_lesson
ADD CONSTRAINT FK_group_lesson_2 FOREIGN KEY (compensation_schema_id) REFERENCES compensation_schema (compensation_schema_id);

ALTER TABLE group_lesson
ADD CONSTRAINT FK_group_lesson_3 FOREIGN KEY (level_id) REFERENCES LEVEL (level_id);

ALTER TABLE group_lesson
ADD CONSTRAINT FK_group_lesson_4 FOREIGN KEY (instrument_id) REFERENCES instrument (instrument_id);

ALTER TABLE individual_lesson
ADD CONSTRAINT FK_individual_lesson_0 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id);

ALTER TABLE individual_lesson
ADD CONSTRAINT FK_individual_lesson_1 FOREIGN KEY (student_id) REFERENCES student (student_id);

ALTER TABLE individual_lesson
ADD CONSTRAINT FK_individual_lesson_2 FOREIGN KEY (pricing_schema_id) REFERENCES pricing_schema (pricing_schema_id);

ALTER TABLE individual_lesson
ADD CONSTRAINT FK_individual_lesson_3 FOREIGN KEY (compensation_schema_id) REFERENCES compensation_schema (compensation_schema_id);

ALTER TABLE individual_lesson
ADD CONSTRAINT FK_individual_lesson_4 FOREIGN KEY (level_id) REFERENCES LEVEL (level_id);

ALTER TABLE individual_lesson
ADD CONSTRAINT FK_individual_lesson_5 FOREIGN KEY (instrument_id) REFERENCES instrument (instrument_id);

ALTER TABLE instructor_instrument
ADD CONSTRAINT FK_instructor_instrument_0 FOREIGN KEY (instrument_id) REFERENCES instrument (instrument_id) ON
DELETE CASCADE;

ALTER TABLE instructor_instrument
ADD CONSTRAINT FK_instructor_instrument_1 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id) ON
DELETE CASCADE;

ALTER TABLE instrument_fee
ADD CONSTRAINT FK_instrument_fee_0 FOREIGN KEY (rental_instrument_id) REFERENCES rental_instrument (rental_instrument_id);

ALTER TABLE rental_agreement
ADD CONSTRAINT FK_rental_agreement_0 FOREIGN KEY (student_id) REFERENCES student (student_id);

ALTER TABLE rental_agreement
ADD CONSTRAINT FK_rental_agreement_1 FOREIGN KEY (rental_instrument_id) REFERENCES rental_instrument (rental_instrument_id);

ALTER TABLE sibling_relationship
ADD CONSTRAINT FK_sibling_relationship_0 FOREIGN KEY (first_student_id) REFERENCES student (student_id);

ALTER TABLE sibling_relationship
ADD CONSTRAINT FK_sibling_relationship_1 FOREIGN KEY (second_student_id) REFERENCES student (student_id);

ALTER TABLE student_ensemble
ADD CONSTRAINT FK_student_ensemble_0 FOREIGN KEY (ensemble_id) REFERENCES ensemble (ensemble_id) ON
DELETE CASCADE;

ALTER TABLE student_ensemble
ADD CONSTRAINT FK_student_ensemble_1 FOREIGN KEY (student_id) REFERENCES student (student_id) ON
DELETE CASCADE;

ALTER TABLE student_group_lesson
ADD CONSTRAINT FK_student_group_lesson_0 FOREIGN KEY (group_lesson_id) REFERENCES group_lesson (group_lesson_id) ON
DELETE CASCADE;

ALTER TABLE student_group_lesson
ADD CONSTRAINT FK_student_group_lesson_1 FOREIGN KEY (student_id) REFERENCES student (student_id) ON
DELETE CASCADE;

-- historic data
CREATE TABLE last_backup (
 last_backup_id uuid DEFAULT uuid_generate_v4() NOT NULL,
 date DATE
);

ALTER TABLE last_backup ADD CONSTRAINT PK_last_backup PRIMARY KEY (last_backup_id);


CREATE TABLE lesson_historic (
 lesson_id UUID NOT NULL,
 time TIME NOT NULL,
 date DATE NOT NULL,
 type VARCHAR(100) NOT NULL,
 genre VARCHAR(100),
 level VARCHAR(100),
 instrument VARCHAR(100),
 last_backup_id UUID NOT NULL
);

ALTER TABLE lesson_historic ADD CONSTRAINT PK_lesson_historic PRIMARY KEY (lesson_id);


CREATE TABLE student_lesson (
 student_id UUID NOT NULL,
 lesson_id UUID NOT NULL,
 price FLOAT NOT NULL
);

ALTER TABLE student_lesson ADD CONSTRAINT PK_student_lesson PRIMARY KEY (student_id,lesson_id);


ALTER TABLE lesson_historic ADD CONSTRAINT FK_lesson_historic_0 FOREIGN KEY (last_backup_id) REFERENCES last_backup (last_backup_id);


ALTER TABLE student_lesson ADD CONSTRAINT FK_student_lesson_0 FOREIGN KEY (lesson_id) REFERENCES lesson_historic (lesson_id);





