//Indsæt dig selv i databasen
INSERT INTO students (name,surname,gender) VALUES ('','','');
//Navn på elev og bog eleven har lånt
SELECT students.name, books.name
	FROM students
	LEFT JOIN borrows
		ON students.studentId = borrows.borrowId
	LEFT JOIN books
		ON borrows.bookId = books.bookId
	ORDER BY students.name

//Liste over elever og antal af deres udlån, sorteret på elev navn
SELECT students.name,count() AS antal FROM borrows 
	LEFT JOIN students on borrows.studentId = students.studentId
		GROUP BY borrows.studentId

//Vælg 20 bøger på 6. side
SELECT bookId, name FROM books
	limit 100,20

//Vælg alle elever hvis navn starter med 'Al'
SELECT * FROM students
	WHERE name LIKE 'Al%';

//Hvormange horror bøger er lånt ud (i forhold til antal udlån i alt - ved at bruge nested statement)
SELECT 
	(SELECT count(*) from borrows) as numTotal,
	count(*) as numOfHorror 
	FROM borrows
	LEFT JOIN books
		on borrows.bookId = books.bookId
	LEFT JOIN types
		on books.typeId = types.typeId
	WHERE types.name = 'Horror'

//LEFT JOIN vs JOIN prøv af, ændre LEFT JOIN til INNER JOIN og prøv af igen
SELECT students.name, students.surname, count(borrows.borrowId) as Udlånt
	FROM students
	LEFT JOIN borrows
		ON students.studentId = borrows.studentId
	WHERE students.studentId = 506
	group by students.studentId

//Indsæt udlån
INSERT INTO borrows (studentId,bookId,takenDate, broughtDate) VALUES
	(506,130,'2019-10-17 12:04','');



//Slet alle elevs udlån
DELETE FROM borrows WHERE borrows.studentId = 506

	

