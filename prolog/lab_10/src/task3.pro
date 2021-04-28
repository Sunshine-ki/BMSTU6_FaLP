DOMAINS
	list = integer*.

PREDICATES
	del(integer, list, list).
	createSet(list, list).

CLAUSES
	del(Elem, [H|T], [H|Res]) :- 
		H <> Elem, !,
		del(Elem, T, Res).
		
	del(Elem, [_|T], Res) :-
		del(Elem, T, Res), !.
	
	del(_, [], []) :- !.
	
	
	createSet([H|T], [H|Res]) :-
		del(H, T, Tmp),
		createSet(Tmp, Res).
	createSet([], []).

GOAL
	del(3, [4, 3, 1, 2, 3], Result).
	% createSet([1, 2, 3, 4, 5, 6, 1, 2, 3, 4, 5, 3, 2, 6], Result).