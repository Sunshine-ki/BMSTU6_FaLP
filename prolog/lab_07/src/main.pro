DOMAINS 
	number = integer

PREDICATES
	maximumTwo(number, number, number).
	maximumTwo2(number, number, number).

	maximumThree(number, number, number, number).
	maximumThree2(number, number, number, number).
	
CLAUSES
	maximumTwo(A, B, A) :- A >= B.
	maximumTwo(A, B, B) :- A < B.
	
	maximumTwo2(A, B, A) :- A >= B, !.
	maximumTwo2(_, B, B).
	
	maximumThree(A, B, C, A) :- A >= B, A >= C.
	maximumThree(_, B, C, Res) :- maximumTwo(B, C, Res).
	
	maximumThree2(A, B, C, A) :- A >= B, A >= C, !.
	maximumThree2(_, B, C, Res) :- maximumTwo(B, C, Res). 
	
	
GOAL
	maximumThree(3, 3, 3, Result).
	