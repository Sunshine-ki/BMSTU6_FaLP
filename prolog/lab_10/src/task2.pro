DOMAINS
	list = integer*.
	
 PREDICATES
	odd(list, list).
	
 CLAUSES
	odd([_,H|T], [H|Res]) :- odd(T, Res).
	odd([_], []) :- !.
	odd([],[]) :- !.
	
 GOAL
	odd([0, 1, 2, 3, 4, 5, 7], Result).