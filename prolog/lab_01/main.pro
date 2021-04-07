DOMAINS
	phone = symbol.
	name = symbol. 
	school_number = integer.
	
PREDICATES
	phonebook(phone, name, school_number).

CLAUSES 
	phonebook("+79998881234", "Alice", 433).
	phonebook("+79998881235", "Pasha", 415).
	phonebook("+79998881236", "Nastya", 433).
	phonebook("+79998881237", "Ivan", 424).
	phonebook("+79998881238", "Dima", 123).
	phonebook("+79998881134", "Oleg", 123).
	phonebook("+79991881334", "Nikita", 25).
	phonebook("+79998391234", "Misha", 1024).

GOAL
	phonebook(Phone_number, Name, 433). 