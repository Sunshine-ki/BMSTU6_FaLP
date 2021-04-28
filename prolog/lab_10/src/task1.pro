DOMAINS
	list = integer*.

PREDICATES
	f(list, integer, list).

CLAUSES
	f([H|T], Elem, [H|Res]) :-
		%write("T = "), write(T), nl,
		%write("H = "), write(H), nl, nl,  
		H > Elem, !,
		f(T, Elem, Res).
		
	f([_|T], Elem, Res) :-
		f(T, Elem, Res), !.
	
	f([], _, []) :- !.

GOAL
	f([4, 5,1, 4, 6], 3, Result).