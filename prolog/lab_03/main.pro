DOMAINS 
	surname = symbol.
	phone_number = symbol.
	address_struct = address(symbol, symbol, integer, integer).

	label = symbol.
	color = symbol.
	price = integer.
	
	bank = symbol.
	score = integer.
	sum = integer.

PREDICATES
	phonebook(surname, phone_number, address_struct).
	car(surname, label, color, price).
	bank_depositor(surname, bank, score, sum).
	
	f1(surname, phone_number, label, price).
	f1_2(phone_number, label).
	f2(surname, symbol, phone_number, symbol, bank).

CLAUSES
	phonebook("Tilov", "89999899999", address("Moscow", "2 baumanskaya", 57, 25)).
	phonebook("Tilov", "89999899977", address("Moscow", "2 baumanskaya", 57, 25)).
	phonebook("Alovik", "89999812999", address("Moscow", "3 baumanskaya", 50, 75)).
	
	car("Tilov", "Buick", "black", 12000000).
	car("Tilov", "Cadillac", "white", 22000000).
	
	bank_depositor("Alovik", "sberbank", 10000, 25000).
	bank_depositor("Alovik", "vtb", 20000, 35000).
	
	f1(Surname, Phone_number, Label, Price) :-  
		phonebook(Surname, Phone_number, _), 
		car(Surname, Label, _, Price). 
		
	f1_2(Phone_number, Label) :- 
		f1(_, Phone_number, Label, _).
	
	f2(Surname, City, Phone_number, Street, Bank) :- 
		phonebook(Surname, Phone_number, address(City, Street, _, _)), bank_depositor(Surname, Bank, _, _).
	
GOAL
	f1(Surname, "89999899999", Label, Price).
	% f1_2("89999899999", Label).
	% f2("Alovik", "Moscow", Phone_number, Street, Bank).
	

	