DOMAINS
	list = integer*.

PREDICATES
	length(list, integer, integer).
	lengthWapper(list, integer).
	
CLAUSES
	length([], Res, Res) :- !.
	length([_|T], CurrValue, Res) :- 
		NewCurrValue = CurrValue + 1,
		length(T, NewCurrValue, Res). 
	
	lengthWapper(L, Res) :- length(L, 0, Res).

GOAL
	% lengthWapper([1, 2, 3], Result).
	% lengthWapper([], Result).
	lengthWapper([1, 2, 3, 1, 2, 3, 1, 2, 3], Result).