SELECT *
FROM 
  ( SELECT *, 
           COUNT(1) OVER (PARTITION BY studentId) AS student_occurs
    FROM borrows
  ) AS brws
INNER JOIN
	students ON students.studentId = brws.studentId
INNER JOIN
	books ON books.bookId = brws.bookId
WHERE
	students.birtdate LIKE "2000%" AND students.class LIKE "%A" AND books.name = "Self Reliance" AND student_occurs > 12