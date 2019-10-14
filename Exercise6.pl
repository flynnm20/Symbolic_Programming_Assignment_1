numeral(0).
numeral(s(X)) :- numeral(X).
numeral(X+Y) :- numeral(X), numeral(Y).
numeral(p(X)) :- numeral(X).
numeral(-X) :- numeral(X).
numeral(X-Y) :- numeral(X), numeral(Y).


%add
add(p(s(X)),Y,Z) :- add(X,Y,Z).
add(s(p(X)),Y,Z) :- add(X,Y,Z).

add(0,X,X).

add(p(X),s(Y),Z) :- add(X,Y,Z).
add(s(X),p(Y),Z) :- add(X,Y,Z).
add(s(X),Y,s(Z)) :- add(X,Y,Z).
add(p(X),Y,p(Z)) :- add(X,Y,Z).

%add2

add2(-X,Y,Z) :- minus(X,W),add2(W,Y,Z).
add2(X,-Y,Z) :- minus(Y,W),add2(X,W,Z).

add2(p(s(X)),Y,Z) :- add2(X,Y,Z).
add2(s(p(X)),Y,Z) :- add2(X,Y,Z).
add2(X,p(s(Y)),Z) :- add2(X,Y,Z).
add2(X,s(p(Y)),Z) :- add2(X,Y,Z).

add2(s(W+X),Y,s(Z)) :- add2(W+X,Y,Z).
add2(X,s(W+Y),s(Z)) :- add2(X,W+Y,Z).
add2(s(W+X),s(V+Y),s(s(Z))) :- add2(W+X,V+Y,Z).


add2(W+X,Y,Z) :- add(W,X,Q),add2(Q,Y,Z).
add2(X,W+Y,Z) :- add(W,Y,Q),add2(X,Q,Z).
add2(W+X,V+Y,Z) :- add(W,X,Q),add(V,Y,R),add2(Q,R,Z).


add2(X,Y,Z) :- add(X,Y,Z).

%minus
minus(0,X) :- numeral(X).

minus(s(W)+p(X),Y) :- minus(s(W),A),minus(p(X),B),add2(A,B,Y).
minus(s(W)-p(X),Y) :-  minus(s(W),A),minus(-p(X),B),add2(A,B,Y).
minus(p(W)+s(X),Y) :- minus(p(W),A),minus(s(X),B),add2(A,B,Y).
minus(p(W)-s(X),Y) :- minus(p(W),A),minus(-s(X),B),add2(A,B,Y).
minus(-p(X),Y) :- minus(s(X),Y).
minus(-s(X),Y) :- minus(p(X),Y).

minus(p(s(X)),Y) :- minus(X,Y).
minus(s(p(X)),Y) :- minus(X,Y).
minus(s(X),p(Y)) :- minus(X,Y).
minus(p(X),s(Y)) :- minus(X,Y).

%subtract
subtract(X,Y,Z) :- minus(X,W),minus(Y,V),add2(W,V,Z).
subtract(-X,Y,Z) :- minus(Y,W),add2(X,W,Z).
subtract(X,-Y,Z) :- minus(X,W),add2(W,Y,Z).