DOMAINS 
	number = integer

PREDICATES
	maximum(number, number, number, number).

CLAUSES
	maximum(A, B, C, A) :- A >= B, A >= C.
	maximum(A, B, C, B) :- B >= A, B >= C.
	maximum(A, B, C, C) :- C >= A, C >= B.
	
GOAL
	maximum(35, 35, 2, Result).
	
	