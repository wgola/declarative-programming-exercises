member([H|T], H).
member([_|T], H) :- member(T, H).

fac(0, 1).
fac(A, B) :- A > 0, A1 is A-1, fac(A1, B1), B is B1 * A.

fib(0, 0).
fib(1, 1).
fib(A, B) :- A > 1, A1 is A-1, A2 is A-2, fib(A1, B1), fib(A2, B2), B is B1 + B2.

gcd(0, X, X):- X > 0, !.
gcd(X, Y, Z):- X >= Y, X1 is X-Y, gcd(X1,Y,Z).
gcd(X, Y, Z):- X < Y, X1 is Y-X, gcd(X1,X,Z).