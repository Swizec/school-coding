%skopirano iz 2/list.pl
conc([],L,L).
conc([L1H|L1T],L2,[L1H|L2T]) :-
    conc(L1T,L2,L2T).
insert(X,L,[X|L]).
insert(X,[H|T],[H|LL]) :-
	insert(X,T,LL).
del(X,[X|T],T).
del(X,[H|T],[H|LL]) :-
    del(X,T,LL).

len([], 0).
len([_|T],N) :-
    len(T, N1), 
    N is N1+1.
    
min([A],A).
min([H|T], Min) :-
    min(T,Min),
    Min < H.
min([H|T], H) :-
    min(T,Min),
    Min >= H.
min(T,Min) :-
    del(T,Min,T1),
    min(T1,Min);
    
max([A],A).
max([H|T], Max) :-
    max(T,Max),
    Max >= H.
max([H|T], H) :-
    max(T,Max),
    Max < H.

%reverse
rev([A],[A]).
rev([H|T],Rev) :-
    rev(T,Rev1),
    conc(Rev1,[H],Rev).
    
%permute
perm([A],[A]).
perm([H1|T1],P) :-
    perm(T1,P1),
    insert(H1,P1,P).
    
%1..5000
%num(N,Cons) :-
%    conc(Cons, [N]
%
%num(N,Cons) :-
%    N1 is N+1,
%    N1 <= 5000,
%    num(N1,Cons),
%    Cons1 = conc([N1],Cons1)
%
%num(N,0,Cons) :-
%    num(0,Cons).
    

