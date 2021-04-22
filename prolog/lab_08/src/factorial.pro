DOMAINS 
	number = integer

PREDICATES
	factorial(number, number, number).
	factorialWrapper(number, number).
	
CLAUSES
	factorial(0, Res, Res) :- !.
	factorial(Number, Current, Res) :- 
		NextNumber = Number - 1,
		Mult = Current * Number,
		factorial(NextNumber, Mult, Res).
	
	factorialWrapper(Number, -1) :- Number < 0, !. % Error. 
	factorialWrapper(Number, Res) :- factorial(Number, 1, Res).
	
GOAL
	% factorialWrapper(5, Result).
	% factorialWrapper(-5, Result).	
	factorialWrapper(0, Result).