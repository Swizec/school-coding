ifthenelse(A,B,C) :-
    (A,!,B)
    ;
    (\+A,!,C).
    
if(A then B else C):- 
    A,!,B;
    C. 
if(A then B):- 
    A,!,B.
         
:- op(200, yfx, else).
:- op(300, yfx, then).
:- op(500, fy, if).


