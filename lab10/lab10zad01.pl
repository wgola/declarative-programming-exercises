% zadanie 8

% a) last(X,L), which is fulfilled if X is the last element of L.
last(X, [_ | Rest]) :- last(X, Rest).
last(X, [X]). 

% b) delete(X,L1,L2), which is fulfilled if L2 is the list L1 without the element X. 

delete(_, [], []).
delete(X, [X|Tail], NextTail) :- delete(X, Tail, NextTail).
delete(X, [Head|Tail], [Head|NextTail]) :- delete(X, Tail, NextTail).

% c) delete(L1,L2), which is fulfilled if L2 is the list L1 without L1's last three elements.

delete([], []).
delete(L1, []) :- length(L1, X), X =< 3.
delete([Head|Tail], [Head]) :- length(Tail, 3).
delete([Head|Tail], [Head|NextTail]) :- delete(Tail, NextTail).

% d) reverse(L1,L2), which is fulfilled if L2 is the list L2 in reversed order. 

reverse([], []).
reverse([Head|Tail], Result) :- reverse(Tail, X), append(X, [Head], Result).

% e) evenlength(L) and oddlength(L), which are fulfilled if the length of L is even and odd, respectively. 

evenlength([]).
evenlength([_,_|Tail]) :- evenlength(Tail).

oddlength([_]).
oddlength([_,_|Tail]) :- oddlength(Tail).

% f) shift(L1,L2), which is fulfilled if L2 the list L1 after one rotation to left. 

shift([Head|Tail], Res) :- append(Tail, [Head], Res).

% g) quadrat(L1,L2), which is fulfilled if L2 contains the squares of the elements of L1. 

quadrat([], []).
quadrat([Head|Tail], [NewHead|NextTail]) :- NewHead is Head * Head, quadrat(Tail, NextTail).

% h) combine(L1,L2,L3), which is fulfilled if L3 contains the pairs of the elements of L1 and L2. 

combine([], [], []).
combine([Head1|Tail1], [Head2|Tail2], [[Head1, Head2]|NextTail]) :- combine(Tail1, Tail2, NextTail).

% i) palindrom(L), which is fulfilled if L contains a palindrom.

palindrom(L) :- reverse(L, L).


% j) p(X,L,Y,Z), which is fulfilled if Y is the predecessor of X in L and Z is the successor of X in L.

p(X, L, Y, Z) :- predecessor(X, L, Y), successor(X, L, Z).

predecessor(_, [], []).
predecessor(X, [Head,X|_], Head).
predecessor(X, [_, Head2|Tail], Res) :- predecessor(X, [Head2|Tail], Res).

successor(_, [], []).
successor(X, [X,Head|_], Head).
successor(X, [_|Tail], Res) :- successor(X, Tail, Res).

% k) q(X,L1,L2), which is fulfilled if L2 is the beginning of the list L1 up to the (first) double occurence of element X. 

q(_, [], []).
q(X, L1, L2) :- q(X, L1, [], L2).
q(X, [X, X|_], Acc, Res) :-
    !, append(Acc, [X, X], Res).
q(X, [Head|Tail], Acc, Res) :-
    append(Acc, [Head], Acc2),
    q(X, Tail, Acc2, Res).
