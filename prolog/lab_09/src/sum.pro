DOMAINS
	list = integer*.

PREDICATES
	sum(list, integer, integer).
	sumWapper(list, integer).
	
CLAUSES
	sum([], Res, Res) :- !.
	sum([H|T], CurrValue, Res) :- 
		NewCurrValue = CurrValue + H,
		sum(T, NewCurrValue, Res). 
	
	sumWapper(L, Res) :- sum(L, 0, Res).

GOAL
	% sumWapper([1, 2, 3], Result).
	% sumWapper([], Result).
	sumWapper([1, 2, 3, 1, 2, 3, 1, 2, 3], Result).