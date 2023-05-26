% Zadanie 10

% nth(N,L,X), which is fulfilled if X is the N-th element in the list L.

nth(1, [Res|_], Res) :- !.
nth(N, [_|Tail], Res) :-
    N2 is N - 1,
    nth(N2, Tail, Res).

% ordered(L), which is fulfilled if list L is ordered.

ordered([_]) :- !.
ordered([Head1, Head2|Tail]) :-
    Head1 < Head2,
    ordered([Head2|Tail]).

% mergesort(L1,L2), which is fulfilled if L2 is the ordered version of the list L1. The predicate should simulate algorithm mergesort. 

merge(List, List, []).
merge(List, [], List).

merge([MinList1|RestMerged], [MinList1|RestList1], [MinList2|RestList2]) :-
    MinList1 =< MinList2,
    merge(RestMerged,RestList1,[MinList2|RestList2]).
merge([MinList2|RestMerged], [MinList1|RestList1], [MinList2|RestList2]) :-
    MinList2 =< MinList1,
    merge(RestMerged,[MinList1|RestList1],RestList2).

mergeSort([], []).
mergeSort([A], [A|[]]).

mergeSort(List, Sorted) :-
    length(List, N),
    FirstLength is //(N, 2),
    SecondLength is N - FirstLength,
    length(FirstUnsorted, FirstLength),
    length(SecondUnsorted, SecondLength),
    append(FirstUnsorted, SecondUnsorted, List),
    mergeSort(FirstUnsorted, FirstSorted),
    mergeSort(SecondUnsorted, SecondSorted),
    merge(Sorted, FirstSorted, SecondSorted).