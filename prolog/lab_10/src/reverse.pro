DOMAINS
	list = integer*.

PREDICATES
	f(list, list, list).
	fWap(list, list).
	
CLAUSES
	f([], Res, Res) :- !.
	f([H|T], CurrL, Res) :- 
		NewCurrL = [H|CurrL],
		f(T, NewCurrL, Res). 
	
	fWap(L, Res) :- f(L, [], Res).

GOAL
	fWap([1, 2, 3], Result).