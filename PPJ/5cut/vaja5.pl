%negacija... oz. ni negacija, je negacija uspeha
%predpostavka zaprtega sveta - kar ni v factih, ne obstaja
%
%not(P) :-
%   P,!,fail
%   ;
%   true.
%
% member(X). %da vse memberje
% \+ member(X). %vrne false, če vrednost ni konkretna in obstaja kakšna rešitev
% \+ member(neki) %vrne kar bi pričakovali

%te funkcije so "standard" in jih bomo redno uporabljali

%seznam funkcije... copy paste
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
    
%operacije nad množicami

union(T,[],T).
union([],T,T).
union([A],[A],[A]).
union([A],[B],[A,B]).
union([H1|T1],S2=[H2|T2],U) :- 
    union(T1,T2,U2), !,
    ((mem(H,U2), !, U=U2); U=[H|U2]).
    
intersect(_,[],[]).
intersect([],_,[]).
intersect([A],[A],[A]).
intersect([_],[_],[]).
intersect([H|T],S2,I) :- 
    intersect(T,S2,I2),!,
    ((mem(H,S2), !, I=[H|I2]); I=I2).

diff(_,[],_).
diff([],_,[]).
diff([A],[A],[A]).
diff([_],[_],[]).
diff([H|T],S2,I) :- 
    diff(T,S2,I2),!,
    ((mem(H,S2), !, I=[H|I2]); I=I2).
    

%is_superset(S1,S2)
%is_subset(S1,S2)

%subset(S,Subset)

