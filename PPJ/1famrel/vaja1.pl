mom(X, Y) :-
    female(X),
    parent(X,Y).

grandparent(X, Y) :-
    parent(X, Z),
    parent(Z, Y).

% \== mora biti na koncu, ker prej X in Y nista fiksirana
% rule of thumb: najprej pravila, nato preverimo vrednosti spremenljivk
bro(X, Y) :-
    parent(Z, X),
    parent(Z, Y),
    male(X),
    X \== Y.

sis(X, Y) :-
    parent(Z, X),
    parent(Z, Y),
    female(X),
    X \== Y.
    
aunt(X, Y) :-
    parent(Z,Y),
    sis(X,Z).

cousin(X, Y) :-
    parent(PY, Y),
    parent(PX, X),
    bro(PX,PY)
    ;
    parent(PY, Y),
    parent(PX, X),
    sis(PX,PY).
    
cousin1(X, Y) :-
    parent(PY, Y),
    parent(PX, X),
    (bro(PX,PY)
    ;
    sis(PX,PY)).
    
predecessor(X, Y) :-
    parent(X,Y)
    ;
    parent(X,Z),
    predecessor(Z,Y).

successor(X, Y) :-
    predecessor(Y, X).

%connected zaeenkrat še ne znamo spisat tako, da se ne zacikla
%moja verzija
connected(X, Y) :-
    predecessor(X, Y)
    ;
    predecessor(Z, X),
    connected(Y, Z).

connected(X, Y) :-
    successor(X, Y)
    ;
    successor(Z, X),
    connected(Y, Z).
    
%uradna verzija
connected1(X, Y) :-
    parent(X, Y)
    ;
    parent(Y, X).
    
connected1(X, Y) :-
    (parent(X,Z)
     ;
     parent(Z,X)),
    connected1(Z,Y).

%debuganje:
%trace
%notrace


%vaje2 
%connected, ki se ne zacikla
connected2(X, Y, _Depth) :-
    parent(X, Y)
    ;
    parent(Y, X).
    
connected2(X, Y, Depth) :-
    Depth > 0,
    Depth1 is Depth - 1,
    (parent(X,Z)
     ;
     parent(Z,X),
    connected2(Z,Y,Depth1)).

%connected s shranjeno potjo%%%%
connected3(X, Y, _Depth, Path) :-
    parent(X, Y), Path=parent(X,Y);
    parent(Y, X), Path=child(X,Y).

connected3(X, Y, Depth, Path) :-
    Depth > 0, Depth1 is Depth - 1,
    (parent(X,Z), Path=parent(X,PathZY);
     parent(Z,X), Path=child(X,PathZY)),
     connected3(Z,Y,Depth1,PathZY).
     
%to zgoraj se splača tracat.
%skrajšana verzija
    %napišemo Path=... kar v glavo.
connected4(X, Y, _Depth, parent(X,Y)) :-
    parent(X,Y).
connected4(X, Y, _Depth, child(X,Y)) :-
    parent(Y, X).

connected4(X, Y, Depth, Path) :-
    Depth > 0, Depth1 is Depth - 1,
    (parent(X,Z), Path=parent(X,PathZY);
     parent(Z,X), Path=child(X,PathZY)),
     connected3(Z,Y,Depth1,PathZY).

