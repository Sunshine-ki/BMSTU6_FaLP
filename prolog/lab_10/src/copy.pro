DOMAINS
	list = integer*.

PREDICATES
	f(list, list).

CLAUSES
	f([H|T], [H|Res]) :- 
		write("T = "), write(T), nl,
		write("H = "), write(H), nl, nl,  
		f(T, Res).
	
	f([],[]) :- !.

GOAL
	f([1, 2, 3], Result).