% zadanie 6

% plus/3

plus(A, B, C) :- plus(A, B, A, C).

plus(A, B, Acc, C) :-
B > 0,
NewAcc is Acc + 1,
NewB is B - 1,
plus(A, NewB, NewAcc, C).

plus(_, 0, Acc, Acc).

% times/3

times(A, B, C) :- times(A, B, 0, C).

times(A, B, Acc, C) :-
B > 0,
NewAcc is Acc + A,
NewB is B - 1,
times(A, NewB, NewAcc, C).

times(_, 0, Acc, Acc).

% fib/2

fib(0, 0).
fib(1, 1).
fib(A, B) :- fib(A, 1, 0, B).

fib(A, Acc1, Acc2, B) :- 
A > 1,
NewAcc1 is Acc1 + Acc2,
NewAcc2 is Acc1,
NewA is A - 1,
fib(NewA, NewAcc1, NewAcc2, B).

fib(1, Acc1, _, Acc1).

% sum-up/2

sum-up(A, B) :- sum-up(A, 0, B).

sum-up(A, Acc, B) :-
A > 0,
NewAcc is Acc + A,
NewA is A - 1,
sum-up(NewA, NewAcc, B).

sum-up(0, Acc, Acc).