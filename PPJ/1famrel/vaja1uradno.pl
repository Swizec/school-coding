% mother(X, Y)
% "mama" ustrezno nadomesti slavni "hello, world!" :-)

mother(X, Y):-
  parent(X, Y),
  female(X).

grandparent(X, Y):-
  parent(X, Z),
  parent(Z, Y).

% brother(X, Y)
% ce damo pogoj X \== Y recimo na zacetek, ni nujno da dela!
% stos je, da X ali Y se nima nujno neke konkretne vrednosti
% in posledicno X in Y tisti hip (!) seveda se nista identicna
% kasneje pri CLP (Constraint Logic Programming) bomo videli
% da CLP zna kontrolirati take omejitve in vrstni red tam ni vazen

brother(X, Y):-
  parent(P, X),
  parent(P, Y),
  male(X),
  X \== Y.

sister(X, Y):-
  parent(P, X),
  parent(P, Y),
  female(X),
  X \== Y.

% aunt(X, Y)
% za definicijo tete si je najlazje pomagati z definicijo sestre
% definicija sestre poskrbi za pravi spol in da ne gre za isto osebo

aunt(X, Y):-
  sister(X, Z),
  parent(Z, Y).

% se "dolga" verzija za teto
% (v bistvu povsem enaka oni zgoraj)

aunt2(X, Y):-
  parent(P, X),
  parent(P, Z),
  female(X),
  X \== Z,
  parent(Z, Y).

% cousin(X, Y)
% v anglescini je cousin lahko bratranec ali sestricna

cousin(X, Y):-
  parent(PX, X),
  parent(PY, Y),
  ( brother(PX, PY)
    ;
    sister(PX, PY) ).

% ancestor(X, Y)
% prva rekurzija, a se veliko jih pride :-)

ancestor(X, Y):-
  parent(X, Y).		% robni pogoj (enkrat se je potrebno ustaviti)

ancestor(X, Y):-
  parent(X, Z),		% en korak blizje k resitvi
  ancestor(Z, Y).	% za ostalo poskrbi rekurzija

% descendant(X, Y)
% naslednik je ravno nasprotno kot predhodnik
% zato samo obrnemo spremenljivke v klicu ancestor-ja
% prolog namrec velikokrat deluje v vse mogoce smeri

descendant(X, Y):-
  ancestor(Y, X).

% connected(X, Y)
% ugotovi, ce sta X in Y v istem druzinskem drevesu
% samo predecessor in ancestor ni zadosti ("bocne" povezave)!
% kar poskusite na primeru connected(vanessa, jill)
% ideja: v bistvu plezamo po drevesu (po parent povezavah) gor in dol
% problem: ker plezamo gor in dol nastanejo cikli
% resitev: cikle preprecimo ali s seznamom ze obiskanih oseb
% ali z omejitvijo globine rekurzije (stevila plezanj)

% osnovna verzija, ki se zacikla

connected(X, Y):-	% robni pogoj
  parent(X, Y)
  ;
  parent(Y, X).

connected(X, Y):-
  ( parent(X, Z)	% naredi en korak dol
    ;
    parent(Z, X) ),	% ali en korak gor
  connected(Z, Y).	% in poskusi povezati Z in Y

% "popravljena" verzija, ki omeji stevilo plezanj (podano z N)

connected(X, Y, _):-	% v tem stavku omejitev ni potrebna, ker ni ciklanja
  parent(X, Y)
  ;
  parent(Y, X).

connected(X, Y, N):-
  N > 0,		% preveri, ce se ni presegel omejitve globine
  N1 is N - 1,		% zmanjsaj globino za 1
  ( parent(X, Z)	% naredi en korak dol
    ;
    parent(Z, X) ),	% ali en korak gor
  connected(Z, Y, N1).	% nadaljuj iskanje z globino manjso za 1
  
% ter se tretja verzija, ki uposteva omejitev globine, 
% obenem pa se izpise pot med X in Y

connected(X, Y, _, parent(X, Y)):-	% pot = parent(X,Y)
  parent(X, Y).				% ce velja parent(X,Y)

connected(X, Y, _, child(X, Y)):-	% pot = child(X,Y)
  parent(Y, X).				% ce velja parent(Y,X)

connected(X, Y, N, Path):-
  N > 0,
  N1 is N - 1,
  ( parent(X, Z),
    Path = parent(X, PathZY)		% X je stars od Z, ki je povezan z Y
    ;
    parent(Z, X),
    Path = child(X, PathZY) ),		% X je otrok od Z, ki je povezan z Y
  connected(Z, Y, N1, PathZY).		% rekurzija *vrne* pot med Z in Y (PathZY)


