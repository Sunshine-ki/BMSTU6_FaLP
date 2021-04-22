DOMAINS 
	number = integer

PREDICATES
	fibonacci(number, number, number, number).
	fibonacciWrapper(number, number).

CLAUSES
	fibonacci(1, Prev, _, Prev) :- !.
	fibonacci(Number, Prev, Current, Res) :-
		NewNumber = Number - 1,
		Newprev = Current,
		NewCurrent = Prev + Current,
		fibonacci(NewNumber, NewPrev, NewCurrent, Res).
	
	
	fibonacciWrapper(Number, -1) :- Number < 1, !. % Error.
	fibonacciWrapper(Number, Res) :- fibonacci(Number, 1, 1, Res).
	
	
GOAL
	% fibonacciWrapper(-15, Result).
	% fibonacciWrapper(1, Result).
	% fibonacciWrapper(2, Result).
	% fibonacciWrapper(3, Result).
	fibonacciWrapper(8, Result).