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
		car(price, color, year_of_release);
		building(price, size);
		plane(price, size).

PREDICATES
	phonebook(surname, phone_number, address_struct).
	bank_depositor(surname, bank, score, sum).
	own(surname, property).
	
	propertyNames(surname, name).
	namesAndPrices(surname, symbol, price).

CLAUSES
	phonebook("Tilov", "+100", address("Moscow", "2 baumanskaya", 57, 25)).
	phonebook("Alovik", "+111", address("Moscow", "3 baumanskaya", 50, 75)).
	
	bank_depositor("Alovik", "sberbank", 10000, 25000).
	bank_depositor("Tilov", "vtb", 21500, 3000).

	own("Tilov", car(1200, "black", 1993)).
	own("Tilov", plane(8500, 80)).
	
	own("Alovik", car(21500, "red", 1900)).
	own("Alovik", building (45000,  250)).
	own("Alovik", plane(9000, 95)).
	
	propertyNames(Surname, "car") :- own(Surname, car(_, _, _)).
	propertyNames(Surname, "building") :- own(Surname, building(_, _)).
	propertyNames(Surname, "plane") :- own(Surname, plane(_, _)).
		
	namesAndPrices(Surname, "car", PriceProperty) :- own(Surname, car(PriceProperty, _, _)).
	namesAndPrices(Surname, "building", PriceProperty) :- own(Surname, building(PriceProperty, _)).
	namesAndPrices(Surname, "plane", PriceProperty) :- own(Surname, plane(PriceProperty, _)).

GOAL
	%propertyNames("Tilov", NamePropertyR).
	namesAndPrices("Alovik", NamePropertyR, PricePropertyR).

	