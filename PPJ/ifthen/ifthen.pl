ifthenelse(A,B,C) :-
    (A,!,B)
    ;
    (\+A,!,C).
    
if(A then B else C):- 
    A,!,B;
    C. 
if(A then B):- 
    A,!,B.
         
:- op(500, yfx, else).
:- op(600, yfx, then).
:- op(700, fy, if).


