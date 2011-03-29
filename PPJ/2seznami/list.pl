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
	    
delete(X,[X|T],T).
delete(X,[H|T],[H|LL]) :-
    delete(X,T,LL).
