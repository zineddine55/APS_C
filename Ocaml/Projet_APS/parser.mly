%{
open Ast
%}

%token <int> NUM
%token <string> IDENT
%token PLUS MINUS TIMES DIV
%token LPAR RPAR
%token LBRA RBRA
%token TRUE FALSE
%token IF
%token EOL
%start line             /* the entry point */

%type <Ast.prog> line

%%

    line:
    prog EOL                     { $1 }
    ;
    prog:
    | LBRA exprs RBRA            { ASTProg($2) }
    ;
    expr:
      NUM                        { ASTNum($1) }
    | IDENT                      { ASTId($1) }
    | LPAR PLUS expr expr RPAR   { ASTPrim(Ast.Add, $3, $4) }
    | LPAR MINUS expr expr RPAR  { ASTPrim(Ast.Sub, $3, $4) }
    | LPAR TIMES expr expr RPAR  { ASTPrim(Ast.Mul, $3, $4) }
    | LPAR DIV expr expr RPAR    { ASTPrim(Ast.Div, $3, $4) }
    | FALSE                      { ASTBool(false) }
    | TRUE                       { ASTBool(true) }
    | LPAR IF expr expr expr RPAR { ASTAlt($3, $4, $5) }
    | LPAR expr exprs RPAR       { ASTApp($2, $3) }  
    ;

    exprs:
      expr                       { ASTExpr($1) }
    | expr exprs                 { ASTExprs($1, $2) }
    ;