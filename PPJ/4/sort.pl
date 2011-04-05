%copy paste
mem(X,[X|_]).
mem(X,[_|T]) :-
	 mem(X,T).

conc([],L,L).
conc([L1H|L1T],L2,[L1H|L2T]) :-
    conc(L1T,L2,L2T).

insert(X,L,[X|L]).
insert(X,[H|T],[H|LL]) :-
	insert(X,T,LL).
	    
del(X,[X|T],T).
del(X,[H|T],[H|LL]) :-
    del(X,T,LL).
    
sublist(L,S) :-
    conc(_,LL,L),
    conc(S,_,LL).

perm([A],[A]).
perm([H1|T1],P) :-
    perm(T1,P1),
    insert(H1,P1,P).
    
%sort

is_sorted([]).
is_sorted([_]).
is_sorted([H1,H2|T]) :-
    H1 =< H2,
    is_sorted([H2|T]).

slowsort(L,SL) :-
    perm(L,SL),
    is_sorted(SL).

%sortedinsert    
sinsert(X,L,S) :-
    insert(X,L,S),
    is_sorted(S).

%doesn't work...
bubblesort([],[]).
bubblesort([A],[A]).
bubblesort([A,B],[A,B]) :- A =< B.
bubblesort([A,B],[B,A]) :- A > B.
bubblesort([H1,H2|T],[H1,H2|ST]) :-
    H1 =< H2,
    bubblesort([H2|T],[H2|ST]).    
bubblesort([H1,H2|T],[HS2,HS1|TS]) :-
    H1 > H2,
    bubblesort([H1|T],[H1|TS]).
    

insertsort([A],[A]).
insertsort([H|T],TS) :-
    insertsort(T,TS1),
    sinsert(H,TS1,TS).

pivot(_,[],[],[]).
pivot(P,[H|T],Lower,[H|Greater]) :- 
    H >= P,
    pivot(P,T,Lower,Greater).
pivot(P,[H|T],[H|Lower],Greater) :- 
    H < P,
    pivot(P,T,Lower,Greater).
    
qsort([],[]).
qsort([A],[A]).
qsort([H|T],SL) :-
    pivot(H,T,Low,Gre),
    qsort(Low,Slow),
    qsort(Gre,Sgre),
    conc(Slow,[H|Sgre],SL).
    
    
