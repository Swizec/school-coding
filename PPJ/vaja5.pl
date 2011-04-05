%len([],0).  %isto
len([], N):-
    N is 0.

len([_H|T],N):-
    len(T,N1),
    N is N1+1.

%min([A],A).  %isto
min([A],N):-
    N = A.    


min([H|T],M):-
    min(T,M1),
    M1>=H,
    M = H.

min([H|T],M):-
    min(T,M1),
    M1 < H,
    M = M1.

max([A],A).

max([H|T],M):-
    max(T,M1),
    M1 =< H,
    M = H.

max([H|T],M):-
    max(T,M1),
    M1 > H,
    M = M1.

permute([A],[A]).

permute([H|T],P):-
    permute(T,P1),
    insert(H,P1,P).
    

rev([A],[A]).
    
rev([H|T],P):-
    rev(T,P1),
    conc(P1,[H],P).
    


divisible(X, Y):-
	N is Y*Y, 
	N =< X, 
	X mod Y =:= 0.

divisible(X, Y):-
  Root is sqrt(X),
  Y < Root, 
  Y1 is Y + 1, 
  divisible(X, Y1).

isprime(X):-
  Y is 2, 
  X > 1 , 
  \+divisible(X, Y).

primes(Max,N):-
  primes(Max, 0, N).
    
primes(_,N,P):-
  isprime(N),
  P = N.    
    
primes(Max,A,N):-
  A < Max,
  A1 is A+1,
  primes(Max,A1,N).

ssumprimes([A], A).

ssumprimes([H|T],N):-
  ssumprimes(T,N1),
  N is N1+H.

sumprimes(Max, P):-
  findall(N,primes(Max,N),L),
  ssumprimes(L,P).

numbers(Max,N):-
  numbers(Max, 0, N).
    
numbers(_,N,P):-
  P = N.    
    
numbers(Max,A,N):-
  A < Max,
  A1 is A+1,
  numbers(Max,A1,N).



