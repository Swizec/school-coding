is_sorted([]).
is_sorted([_A]).

is_sorted([A,B|T]):-
	A =< B,
	is_sorted([B|T]).

slow_sort(L,SL):-
    permute(L,SL),
    is_sorted(SL).


slow_sorted_insert(X,L,SL):-
    insert(X,L,SL),
    is_sorted(SL).



sorted_insert(X,[A],[A,X]):-
    X > A.

sorted_insert(X,[H|T],[X,H|T]):-
    X =< H.

sorted_insert(X,[H|T],[H|SL1]):-
    X > H,
    sorted_insert(X,T,SL1).


insert_sort([A],[A]).

insert_sort([H|T], S) :-
    insert_sort(T,S1),
    sorted_insert(H,S1,S).



partition(P,[A],[],[A]):-
    P =< A.
partition(P,[A],[A],[]):-
    P > A.

partition(P,[H|T],[H|Left1],Right1):-
    partition(P,T,Left1,Right1),
    H < P.

partition(P,[H|T],Left1,[H|Right1]):-
    partition(P,T,Left1,Right1),
    H >= P.

quicksort([A],[A]).
quicksort([],[]).

quicksort([H|T],SL) :-
    partition(H,T,L,R),
    quicksort(R,RS),
    quicksort(L,LS),
    conc(LS,[H|RS],SL).



