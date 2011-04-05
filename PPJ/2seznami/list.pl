%te funkcije so "standard" in jih bomo redno uporabljali

member1(X,[X|_]).
member1(X,[_|T]) :-
	 member1(X,T).

conc([],L,L).
conc([L1H|L1T],L2,[L1H|L2T]) :-
    conc(L1T,L2,L2T).

insert(X,L,[X|L]).
insert(X,[H|T],[H|LL]) :-
	insert(X,T,LL).
	    
del(X,[X|T],T).
del(X,[H|T],[H|LL]) :-
    del(X,T,LL).
    
member2(X,L) :-
	 conc(_,[X|_],L).

insert2(X,L1,L2) :-
    del(X,L2,L1).
    
member3(X,L) :-
    del(X,L,_).
    
sublist(L,S) :-
    conc(_,LL,L),
    conc(S,_,LL).
