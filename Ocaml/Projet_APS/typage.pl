extract(X,[X|_]).
extract(X, [_|XS]) :- extract(X,XS).

/* Expressions */
typeExpr(C,true,bool).
typeExpr(C,false,bool).

typeExpr(C,not(X),bool) :- typeExpr(C,X,bool).
typeExpr(C,and(X,Y),bool) :- typeExpr(C,X,bool), typeExpr(C,Y,bool).
typeExpr(C,or(X,Y),bool) :- typeExpr(C,X,bool), typeExpr(C,Y,bool).

typeExpr(C,num(X),int).
typeExpr(C,ident(X),T) :- extract((ident(X),T),C).

typeExpr(C,eq(X,Y),bool) :- typeExpr(C,X,int), typeExpr(C,Y,int).
typeExpr(C,lt(X,Y),bool) :- typeExpr(C,X,int), typeExpr(C,Y,int).
typeExpr(C,add(X,Y),int) :- typeExpr(C,X,int), typeExpr(C,Y,int).
typeExpr(C,sub(X,Y),int) :- typeExpr(C,X,int), typeExpr(C,Y,int).
typeExpr(C,mul(X,Y),int) :- typeExpr(C,X,int), typeExpr(C,Y,int).
typeExpr(C,div(X,Y),int) :- typeExpr(C,X,int), typeExpr(C,Y,int).

/* Args and types */
type(X,int).
type(X,bool).
type(X,funType(A,R)).
funType(A,R) :- types(A,Ta), type(R,Tr).

types((ARG,TYPE),T) :- type(TYPE,T).
types([(ARG,TYPE)|L],[H|T]) :- type(TYPE,H), types(L,T).

filtre([],L).
filtre([(ARG,TYPE)|T],L,R) :- append([TYPE],L,R), filtre(T,[TYPE|L]).

/* Statements */
typeStat(C,echo(X)) :- typeExpr(C,X,int).

/* Declaration */
typeDec(C,const(I,T,E),[(I,T)|C]) :- typeExpr(C,E,T).
typeDec(C,fun(I,T,A,E),[(I,funType(L,T))|C]) :- filtre(A,[],L), typeExpr(C,I,id), append(A,C,R), typeExpr(R,E,T).
typeDec(C,funRec(I,T,A,E),[(I,T)|C]) :- typeExpr(C,I,id), append(A,C,R), typeExpr([(I,T)|R],E,T).

/* Commands */
typeCmds(C,X) :- typeStat(C,X).

typeCmds(C,X,Y) :- typeDec(C,X,D), typeCmds(C,X).
typeCmds(C,X,Y) :- typeDec(C,X,D), typeCmds(C,X).

typeCmds(C,X,Y) :- typeStat(C,X), typeCmds(C,Y).
typeCmds(C,X,Y) :- typeStat(C,X), typeCmds(C,X,Y).
