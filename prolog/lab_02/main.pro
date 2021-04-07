DOMAINS 
	student_id = integer.
	student_name = symbol.
	student_surname = symbol.
	
	university_id = integer.
	university_name = symbol.
	city = symbol.

PREDICATES
	study(student_id, university_id).
	student(student_id, student_name, student_surname).
	university(university_id, university_name, city).
	
	students(university_id, student_name, student_surname).
	
CLAUSES
	student(0, "Alice", "Sukocheva").
	student(1, "Nika", "Lilova").
	student(2, "Masha", "Perestoronina").
	student(3, "Pasha", "Perestoronin").
	student(4, "Nastya", "Namestnik").
	student(5, "Kirill", "Drovin").
	student(6, "Tim", "Malov").
	
	university(0, "Bauman Moscow State Technical University", "Moscow").
	university(1, "Petersburg State University", "Petersburg").
	university(2, "Kuban State University", "Krasnodar").
	
	study(0, 0).
	study(2, 0).
	study(3, 0).
	study(4, 0).
	
	study(5, 2).
	study(5, 0).
	
	study(6, 0).
	study(6, 1).
	study(6, 2).
	
	students(University_id, Name, Surname) :- 
			study(Student_id, University_id), 
			student(Student_id, Name, Surname).
	
GOAL
	% All infomation about students. 
	% student(Id, Name, Surname).
	
	% All infomation about universities.
	% university(Id, Name, City).
	
	% All id students from the university.
	% study(Id, 0). % 0, 2, 3, 4, 5, 6
	% study(Id, 1). % 6
	% study(Id, 2). % 5, 6

	% All name and surname students from the university.
	% students(0, Name, Surname).
	% students(1, Name, Surname).
	% students(2, Name, Surname).
	
	% All universities where the student studies.
	% study(0, U_id). % 0
	% study(1, U_id). % study(0, U_id). 
	% study(6, U_id). % 0, 1, 2
	


	