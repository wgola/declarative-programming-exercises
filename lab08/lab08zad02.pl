# zadanie 2

child(X, Y) :- parent(Y, X).
mother(X, Y) :- parent(X, Y), female(X).
sister(X, Y) :- female(X), parent(X, Z), parent(Y, Z).
has_a_child(X) :- parent(X, _).
grandparent(X, Y) :- parent(X, Z), parent(Z, Y).
predecessor(X, Y) :- child(X, Z), child(Z, Y).