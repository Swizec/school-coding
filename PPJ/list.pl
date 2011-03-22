%te funkcije so "standard" in jih bomo redno uporabljali

member1(X,L) :-
	L=[H|T],
	(X=H;
	 member1(X,T)).

conc(L1,L2,L) :-
    L1=[], L=L2.
conc(L1,L2,L) :-
    L1=[L1H|L1T],
    conc(L1T,L2,LL),
    L=[L1H|LL].
%skrajšana verzija... *kjer je = se verjetno da
%append([], Ys, Ys).
%append([X|Xs], Ys, [X|Zs]) :- append(Xs, Ys, Zs).

insert(X,L,L1) :-
    L1=[X|L].
insert(X,L,[H|LL]) :-
	L=[H|T],
	insert(X,T,LL),
	    
delete(X,L,L1) :-
    L=[H|T],
    X=H, L1=T.
delete(X,L,[H|LL]) :-
    L=[H|T],
    %\+ H=X,
    delete(X,T,LL),
    
    

