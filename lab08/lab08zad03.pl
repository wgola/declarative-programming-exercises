% zadanie 4

digit(i, 1).
digit(v, 5).
digit(x, 10).
digit(l, 50).
digit(c, 100).
digit(d, 500).
digit(m, 1000).

latin(A, B) :- latin(A, 0, B).

latin([], Acc, Acc).

latin([A], Acc, B) :- 
digit(A, AVal),
NewAcc is Acc + AVal,
latin([], NewAcc, B).

latin([A, B | Rest], Acc, C) :- 
digit(A, AVal), 
digit(B, BVal),
AVal < BVal,
NewAcc is Acc + BVal - AVal,
latin(Rest, NewAcc, C).

latin([A, B | Rest], Acc, C) :- 
digit(A, AVal), 
digit(B, BVal),
AVal >= BVal,
NewAcc is Acc + AVal,
latin([B | Rest], NewAcc, C).
