plus(A, B, C) :- C is A + B.

times(A, B, C) :- C is A * B.

sum-up(0, 0).
sum-up(A, B) :-
A1 is A-1,
sum-up(A1, C),
B is C + A.