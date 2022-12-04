-- CREATE LAST_BACKUP
INSERT INTO last_backup (date) VALUES (current_date);

-- DROP EXISTING VIEWS
DROP VIEW IF EXISTS il_pricing_info CASCADE;
DROP VIEW IF EXISTS students_with_siblings CASCADE;
DROP VIEW IF EXISTS gl_and_nof_students CASCADE;
DROP VIEW IF EXISTS gl_pricing_info CASCADE;
DROP VIEW IF EXISTS e_and_nof_students CASCADE;
DROP VIEW IF EXISTS e_pricing_info CASCADE;

-- CREATE VIEWS

CREATE VIEW students_with_siblings AS 
SELECT DISTINCT UNNEST(ARRAY[first_student_id, second_student_id]) AS student_id, 'true' AS has_siblings
FROM sibling_relationship sr;

CREATE VIEW il_pricing_info AS 
SELECT individual_lesson_id AS 
	lesson_id,
	il.student_id,
	date, 
	'individual' AS "type", 
	LEVEL,
	has_siblings,
	il.pricing_schema_id,
	base_price, 
	individual_lesson_quanitifier, 
	beginner_quantifier,
	intermediate_quantifier,
	advanced_quantifier,
	discount_percentage
FROM individual_lesson il 
LEFT JOIN LEVEL 
ON il.level_id = LEVEL.level_id 
LEFT JOIN students_with_siblings sws
ON il.student_id = sws.student_id
LEFT JOIN pricing_schema ps 
ON il.pricing_schema_id = ps.pricing_schema_id;

CREATE VIEW gl_and_nof_students AS
SELECT group_lesson_id, COUNT(student_id) AS nof_students FROM student_group_lesson GROUP BY group_lesson_id;

CREATE VIEW gl_pricing_info AS
SELECT sgl.group_lesson_id AS lesson_id,
	sgl.student_id,
	date, 
	'group' AS "type", 
	gl.min_no_of_students,
	nof_students,
	LEVEL,
	has_siblings,
	gl.pricing_schema_id,
	base_price, 
	ps.group_lesson_quantifier, 
	beginner_quantifier,
	intermediate_quantifier,
	advanced_quantifier, ps.
	discount_percentage
FROM student_group_lesson sgl 
LEFT JOIN group_lesson gl  
ON sgl.group_lesson_id = gl.group_lesson_id
LEFT JOIN gl_and_nof_students glans
ON glans.group_lesson_id = sgl.group_lesson_id 
LEFT JOIN LEVEL l
ON gl.level_id = l.level_id 
LEFT JOIN students_with_siblings sws
ON sgl.student_id = sws.student_id
LEFT JOIN pricing_schema ps 
ON gl.pricing_schema_id = ps.pricing_schema_id;

CREATE VIEW e_and_nof_students AS
SELECT ensemble_id, COUNT(student_id) AS nof_students FROM student_ensemble GROUP BY ensemble_id;

CREATE VIEW e_pricing_info AS
SELECT se.ensemble_id AS lesson_id,
	se.student_id,
	date, 
	'group' AS "type", 
	e.min_no_of_students,
	nof_students,
	has_siblings,
	e.pricing_schema_id,
	base_price, 
	ps.ensemble_quantifier, 
	beginner_quantifier,
	intermediate_quantifier,
	advanced_quantifier, ps.
	discount_percentage
FROM student_ensemble se
LEFT JOIN ensemble e  
ON se.ensemble_id = e.ensemble_id
LEFT JOIN e_and_nof_students eans
ON eans.ensemble_id = e.ensemble_id
LEFT JOIN students_with_siblings sws
ON se.student_id = sws.student_id
LEFT JOIN pricing_schema ps 
ON e.pricing_schema_id = ps.pricing_schema_id;

-- INDIVIDUAL LESSON

-- lesson_historic table
INSERT INTO lesson_historic (lesson_id, time, date, "type", genre, "level", instrument, last_backup_id)
SELECT 
	individual_lesson_id AS lesson_id, 
	time, 
	date, 
	'individual' AS "type", 
	NULL AS genre, 
	(SELECT "level" FROM "level" AS l WHERE l.level_id = il.level_id) ,
	(SELECT instrument FROM instrument i WHERE i.instrument_id = il.instrument_id), 
	(SELECT last_backup_id FROM last_backup WHERE date = (SELECT max(date) FROM last_backup))
FROM individual_lesson il 
WHERE date > (SELECT MAX (date)
FROM last_backup
WHERE date NOT IN (SELECT Max (date)
FROM last_backup))
AND date <= current_date
AND student_id IS NOT NULL;

-- student_lesson
INSERT INTO student_lesson(student_id, lesson_id, price)
SELECT 
	student_id, 
	lesson_id,
	(
	CASE WHEN has_siblings IS NOT NULL
	THEN (CASE WHEN LEVEL = 'beginner' 
		THEN (SELECT (base_price * beginner_quantifier * individual_lesson_quanitifier * (100-discount_percentage)/100) AS price)
		WHEN LEVEL = 'intermediate' 
		THEN (SELECT (base_price * intermediate_quantifier * individual_lesson_quanitifier * (100-discount_percentage)/100) AS price)
		ELSE (SELECT (base_price * advanced_quantifier * individual_lesson_quanitifier * (100-discount_percentage)/100) AS price)
		END)
	ELSE (CASE WHEN LEVEL = 'beginner'
		THEN (SELECT (base_price * beginner_quantifier * individual_lesson_quanitifier) AS price)
		WHEN LEVEL = 'intermediate' 
		THEN (SELECT (base_price * intermediate_quantifier * individual_lesson_quanitifier) AS price)
		ELSE (SELECT (base_price * advanced_quantifier * individual_lesson_quanitifier) AS price)
		END)
	END 
	)
FROM il_pricing_info ilpi
WHERE date > (SELECT max(date) FROM last_backup)
AND date <= current_date
AND student_id IS NOT NULL;

-- GROUP LESSON

-- lesson_historic table
-- all group lessons between now and last update
INSERT INTO lesson_historic (lesson_id, time, date, "type", genre, "level", instrument, last_backup_id)
SELECT 
	group_lesson_id AS lesson_id, 
	time, date, 
	'group' AS "type", 
	NULL AS genre, 
	(SELECT "level" FROM "level" AS l WHERE l.level_id = gl.level_id) ,
	(SELECT instrument FROM instrument i WHERE i.instrument_id = gl.instrument_id), 
	(SELECT last_backup_id FROM last_backup WHERE date = (SELECT max(date) FROM last_backup))
FROM group_lesson gl 
WHERE date > (SELECT MAX (date)
FROM last_backup
WHERE date NOT IN (SELECT Max (date)
FROM last_backup))
AND date <= current_date
AND (SELECT count(*)
FROM student_group_lesson sgl
WHERE gl.group_lesson_id = sgl.group_lesson_id) >= gl.min_no_of_students;

-- student_lesson
INSERT INTO student_lesson(student_id, lesson_id, price)
SELECT  
	student_id, 
	glpi.lesson_id AS lesson_id ,
	(CASE WHEN has_siblings IS NOT NULL
	THEN (CASE WHEN LEVEL = 'beginner' 
		THEN (SELECT (base_price * beginner_quantifier * group_lesson_quantifier * (100-discount_percentage)/100) AS price)
		WHEN LEVEL = 'intermediate' 
		THEN (SELECT (base_price * intermediate_quantifier * group_lesson_quantifier * (100-discount_percentage)/100) AS price)
		ELSE (SELECT (base_price * advanced_quantifier * group_lesson_quantifier * (100-discount_percentage)/100) AS price)
		END)
	ELSE (CASE WHEN LEVEL = 'beginner'
		THEN (SELECT (base_price * beginner_quantifier * group_lesson_quantifier) AS price)
		WHEN LEVEL = 'intermediate' 
		THEN (SELECT (base_price * intermediate_quantifier * group_lesson_quantifier) AS price)
		ELSE (SELECT (base_price * advanced_quantifier * group_lesson_quantifier) AS price)
		END)
	END)
FROM gl_pricing_info glpi
WHERE date > (SELECT MAX (date) 
FROM last_backup 
WHERE date NOT IN (SELECT Max (date) 
FROM last_backup)) -- lower date bound
AND date <= current_date -- upper date bound
AND nof_students >= min_no_of_students;

-- ENSEMBLE

-- lesson_historic table
INSERT INTO lesson_historic (lesson_id, time, date, "type", genre, "level", instrument, last_backup_id)
SELECT 
	ensemble_id AS lesson_id, 
	time, 
	date, 
	'ensemble' AS "type", 
	genre, NULL AS "level" , 
	NULL AS instrument, 
	(SELECT last_backup_id FROM last_backup WHERE date = (SELECT max(date) FROM last_backup))
FROM ensemble e 
WHERE date > (SELECT MAX (date)
FROM last_backup
WHERE date NOT IN (SELECT Max (date)
FROM last_backup))
AND date <= current_date
AND (SELECT count(*)
FROM student_ensemble se 
WHERE e.ensemble_id = se.ensemble_id) >= e.min_no_of_students;

-- student_lesson
INSERT INTO student_lesson(student_id, lesson_id, price)
SELECT  
	student_id, 
	epi.lesson_id AS lesson_id,
	(CASE WHEN has_siblings IS NOT NULL
	THEN (SELECT (base_price * ensemble_quantifier * (100-discount_percentage)/100) AS price)
	ELSE (SELECT (base_price * ensemble_quantifier) AS price)
	END)
FROM e_pricing_info epi
WHERE date > (SELECT MAX (date) 
FROM last_backup 
WHERE date NOT IN (SELECT Max (date) 
FROM last_backup)) -- lower date bound
AND date <= current_date -- upper date bound
AND nof_students >= min_no_of_students;
