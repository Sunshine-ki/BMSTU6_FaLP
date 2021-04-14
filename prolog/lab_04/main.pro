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
	
	f(label, color, surname, symbol, phone_number, bank).

CLAUSES
	phonebook("Tilov", "+100", address("Moscow", "2 baumanskaya", 57, 25)).
	phonebook("Alovik", "+111", address("Moscow", "3 baumanskaya", 50, 75)).
	
	car("Tilov", "Buick", "black", 12000000).
	car("Alovik", "Buick", "black", 1500000).
	car("Tilov", "Cadillac", "white", 22000000).
	
	bank_depositor("Alovik", "sberbank", 10000, 25000).
	bank_depositor("Tilov", "vtb", 21500, 3000).
	
	f(Label, Color, Surname, City, Phone, BankName) :- 
			car(Surname, Label, Color, _), 
			phonebook(Surname, Phone, address(City, _, _, _)),
			bank_depositor(Surname, BankName, _, _).
	
GOAL
	f("Buick", "black", SurnameR, CityR, PhoneR, BankNameR).
	

	