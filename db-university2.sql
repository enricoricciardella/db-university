1 Selezionare tutti gli studenti iscritti al Corso di Laurea INN Economia
SELECT * FROM `students` JOIN `degrees` ON `degree_id` = `degrees`.id
WHERE degrees.`name` = 'Corso di Laurea in Economia'

2 Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze
SELECT * FROM `degrees` JOIN `departments` ON `department_id` = `departments`.id
WHERE departments.`name` = 'Dipartimento di Neuroscienze' AND `level` = 'magistrale'

3 Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT * FROM `courses`  JOIN `course_teacher` ON `courses`.id = `course_teacher`.course_id 
JOIN `teachers` ON `teacher_id` = `teachers`.id
WHERE teachers.`name` = 'Fulvio' AND `surname` = 'Amato'

4 Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il
relativo dipartimento, INN ordine alfabetico per cognome e nome
FROM students
INNER JOIN degrees 
on students.degree_id = degrees.id

INNER JOIN departments
on degrees.department_id = departments.id

ORDER BY students.name, students.surname

5 Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT teachers.name, teachers.surname, courses.name AS tipologia_corso , degrees.name AS tipologia_laurea
FROM teachers
INNER JOIN course_teacher
ON teachers.id = course_teacher.teacher_id
INNER JOIN courses
ON courses.id =  course_teacher.course_id
INNER JOIN degrees
ON degrees.id = courses.degree_id;

6 Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
SELECT departments.name, teachers.*
FROM teachers
INNER JOIN course_teacher
ON teachers.id = course_teacher.teacher_id
INNER JOIN courses
ON courses.id =  course_teacher.course_id
INNER JOIN degrees
ON degrees.id = courses.degree_id
INNER JOIN departments
ON departments.id = degrees.department_id
WHERE departments.name = "Dipartimento di matematica"
ORDER BY teachers.name, teachers.surname

