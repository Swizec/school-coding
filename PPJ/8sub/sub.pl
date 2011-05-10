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

%-----------

%atom(X)                   |
%integer(X)   |            | atomic(X)
%float(X)     | number(X)  |
%%
%compound(X)
%noncompound(X)
%%
%var(X)
%nonvar(X)

e( a + (3 * b + sin( a + X )) ).
e2( a + (3 * b + sin( a + c )) ).

%groundlist - pove, ali so vsi v seznamu instancirani
gndlist([]).
gndlist([H|T]) :-
    atomic(H),
    gndlist(T).
    
%ground
gnd(X) :-
    atomic(X)
    ;
    compound(X),
    X =.. L,
    gnd2(L).
    
%ta samo futra nazaj gndju
gnd2([]).
gnd2([H|T]) :-
    gnd(H),
    gnd2(T).
   
%tobase - N, Baza 2..9, Nout ... dela naj samo v eno stran, bomo drugič splošno
tobase(0,_,0).
tobase(N,B,Nb) :-
    N2 is N // B, 
    tobase(N2, B, Nb2),
    Nb is N mod B + 10*Nb2.

%substitute - zamenja nek del izraza 
sub(X, Sub, Expr, NewExpr) :-
    X == Expr, NewExpr = Sub, !
    ;
    compound(X), !,
    X =.. [H|T], % head je predznak
    sub2(T, Sub, Expr, NewExpr2),
    NewExpr =.. [H|NewExpr2]
    ;
    NewExpr = X.
    
sub2([], _,_,[]).
sub2([H|T], Sub, Expr, [NewH|NewExpr]) :-
    sub(H, Sub, Expr, NewH),
    sub2(T, Sub, Expr, NewExpr).
    
    
    
