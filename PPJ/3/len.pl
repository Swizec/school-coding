len([], 0).
len([_|T],N) :-
    len(T, N1), 
    N is N1+1.
    
min([A],A).
min([H|T], Min) :-
    min(T,Min1),
    Min1 < H,
    Min = Min1.
min([H|T], Min) :-
    min(T,Min1),
    Min1 >= H,
    Min = H.

max([A],A).
max([H|T], Max) :-
    max(T,Max1),
    Max1 >= H,
    Max = Max1.
max([H|T], Max) :-
    max(T,Max1),
    Max1 < H,
    Max = H.

%permutate
%perm(L,P) :-
    
    
