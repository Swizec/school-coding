btree( b(b(b(nil,4,nil),2,nil),1,b(b(nil,5,nil),3,b(nil,6,nil))) ).

max([A,B],Max) :- A >= B, Max is A ; Max is B.

%nil je dogovor, ni built-in
%depthBT(nil,0).
depthBT(nil,0).
depthBT(b(L,_,R), D) :-
    depthBT(L, DL),
    depthBT(R, DR),
    max([DL,DR], MaxD),
    D is MaxD+1.

%memberBT(X, BT)
memberBT(X, b(_,X,_)).
memberBT(X, b(L,_,R)) :- 
    memberBT(X, L);
    memberBT(X, R).
    
%deleteBT(X, BT, BT1).
deleteBT(X, b(nil,X,R), R).
deleteBT(X, b(L,X,nil), L).
deleteBT(X, b( L, X, b(R1,RE,nil) ), b(L, RE, R1)).
deleteBT(X, b( L, X, b(nil,RE,R2) ), b(L, RE, R2)).
deleteBT(X, b( b(L1,LE,nil), X, R ), b(L1, LE, R)).
deleteBT(X, b( b(nil,LE,L2), X, R ), b(L2, LE, R)).
%deleteBT(X, b(L, X, R), BT1) :-
%    memberBT(nil, L), !
%        
%    ;    
       
%insertBT(X,BT,BT1)
%insertBT(X,b(L,E,nil),BT1) :-
%    X >= E

%--------------
%numberBT(BT,N).
numberBT(nil,0).
numberBT(b(L,E,R),N) :- 
    numberBT(L,NL),
    numberBT(R,NR),
    N is NL + NR + 1.

%sumBT(BT,N).
sumBT(nil,0).
sumBT(b(L,E,R),N) :- 
    sumBT(L,NL),
    sumBT(R,NR),
    N is NL + NR + E.

%tolist(BT,List)
tolist(BT, List) :- findall(X, memberBT(X, BT), List).

%write(BT)

