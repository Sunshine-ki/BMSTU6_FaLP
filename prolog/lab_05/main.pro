DOMAINS 
	surname = symbol.
	phone_number = symbol.
	address_struct = address(symbol, symbol, integer, integer).

	name = symbol.
	color = symbol.
	price = integer.
	size = integer.
	year_of_release = integer.
	
	bank = symbol.
	score = integer.
	sum = integer.
	
	property = 
		car(name, price, color, year_of_release);
		building(name, price, size);
		plane(name, price, size).

PREDICATES
	phonebook(surname, phone_number, address_struct).
	bank_depositor(surname, bank, score, sum).
	own(surname, property).
	
	propertyNames(surname, name).
	namesAndPrices(surname, name, price).

CLAUSES
	phonebook("Tilov", "+100", address("Moscow", "2 baumanskaya", 57, 25)).
	phonebook("Alovik", "+111", address("Moscow", "3 baumanskaya", 50, 75)).
	
	bank_depositor("Alovik", "sberbank", 10000, 25000).
	bank_depositor("Tilov", "vtb", 21500, 3000).

	own("Tilov", car("Buick", 1200, "black", 1993)).
	own("Tilov", plane("S7", 8500, 80)).
	
	own("Alovik", car("Lg", 21500, "red", 1900)).
	own("Alovik", building ("little House", 45000,  250)).
	own("Alovik", plane("NewAir", 9000, 95)).
	
	propertyNames(Surname, NameProperty) :- own(Surname, car(NameProperty, _, _, _)).
	propertyNames(Surname, NameProperty) :- own(Surname, building(NameProperty, _, _)).
	propertyNames(Surname, NameProperty) :- own(Surname, plane(NameProperty, _, _)).
		
	namesAndPrices(Surname, NameProperty, PriceProperty) :- own(Surname, car(NameProperty, PriceProperty, _, _)).
	namesAndPrices(Surname, NameProperty, PriceProperty) :- own(Surname, building(NameProperty, PriceProperty, _)).
	namesAndPrices(Surname, NameProperty, PriceProperty) :- own(Surname, plane(NameProperty, PriceProperty, _)).

GOAL
	propertyNames("Tilov", NamePropertyR).
	% namesAndPrices("Alovik", NamePropertyR, PricePropertyR).

	