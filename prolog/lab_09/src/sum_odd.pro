DOMAINS
	list = integer*.
	flag = integer. 

PREDICATES
	sum_odd(list, integer, integer, flag).
	sum_oddWapper(list, integer).
	
CLAUSES
	sum_odd([], Res, Res, _) :- !.
	sum_odd([_|T], CurrValue, Res, 0) :- sum_odd(T, CurrValue, Res, 1).
	
	sum_odd([H|T], CurrValue, Res, 1) :- 
		NewCurrValue = CurrValue + H,
		sum_odd(T, NewCurrValue, Res, 0).
	
	sum_oddWapper(L, Res) :- sum_odd(L, 0, Res, 0). 

GOAL
	% sum_oddWapper([1, 2, 3], Result).
	%sum_oddWapper([], Result).
	%sum_oddWapper([1, 2, 3, 1, 2, 3, 1, 2, 3], Result).
	sum_oddWapper([1, 2, 3, 4, 5], Result).
	%sum_oddWapper([1], Result).