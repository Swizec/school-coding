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
    
%atom(X)                   |
%integer(X)   |            | atomic(X)
%float(X)     | number(X)  |
%%
%compound(X)
%%
%var(X)
%nonvar(X)

%naloga 14 iz PDFja z ucilnice
%iz stringa tablice ugotovi, če je iz cifer moč sestavit izraz

in( ['L','J',' ','X',4,'-',2,5,7] ).

getdigits([], []).
getdigits([A], [A]) :- integer(A).
getdigits([H|T], Digs) :-
    getdigits([H], D),
    getdigits(T, DT),
    conc(D, DT, Digs).

%da prvemu element -, ali pa ne
minus([H|T], NL) :- 
    H2 is -H, NL = [H2|T]
    ;
    NL = [H|T].
    
%združi cifre
%trenutno ne, ampak mogoče bi moralo delat tudi vse delne združitve [1,2,1,2], ..., [1,212], ..., [1212]
%to delam v permdigits
joindigits([L], [L]).
joindigits([H|T], Res) :-
    length(T, Len),
    P is 10^Len,
    joindigits(T,R),
    Res is H*P+R.

%not done...
permdigits([A], [A]).
permdigits(A, A).
permdigits([H1,H2|T], Res) :-
    joindigits([H1,H2],R),
    conc([R],T,R1),
    permdigits(R1, Res).

genexpr(L,Exp) :-
    mem(Op,[+,-,*,/]),
    mem(Num1,L),
    mem(Num2,L),
    Exp =.. [Op,Num1,Num2].
    
%...
