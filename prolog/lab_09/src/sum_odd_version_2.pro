DOMAINS
	list = integer*.
	flag = integer. 

PREDICATES
	sum_odd(list, integer, integer).
	sum_oddWapper(list, integer).
	
	test(list, list).
	
	sum_odd2(list, integer, integer, flag).
	sum_odd2Wapper(list, integer).
	
CLAUSES
	sum_odd([], Res, Res) :- !.
	sum_odd([_, H|T], CurrValue, Res) :- 
		NewCurrValue = CurrValue + H,
		sum_odd(T, NewCurrValue, Res), !. 
	sum_odd(_, Res, Res).
	
	sum_oddWapper(L, Res) :- sum_odd(L, 0, Res).
	
	test([_, _|T], T). 
	
	sum_odd2([], Res, Res, _).
	sum_odd2([_|T], CurrValue, Res, 0) :- sum_odd2(T, CurrValue, Res, 1).
	
	sum_odd2([H|T], CurrValue, Res, 1) :- 
		NewCurrValue = CurrValue + H,
		sum_odd2(T, NewCurrValue, Res, 0).
	
	sum_odd2Wapper(L, Res) :-sum_odd2(L, 0, Res, 0). 

GOAL
	%sumWapper([1, 2, 3], Result).
	% sumWapper([], Result).
	% sum_oddWapper([1, 2, 3, 1, 2, 3, 1, 2, 3], Result).
	% test([1, 2, 3, 1, 2, 3, 1, 2, 3], Result).
	sum_odd2Wapper([1, 2, 3, 4, 5], Result).