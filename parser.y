%{

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include "ast.h"
#include "toProlog.h"

int yylex (void);
int yyerror (char *);
Expr* theExpr;
Declaration* theDec;
Type* theType;
Types* theTypes;
Arg* theArg;
Args* theArgs;
Stat* theStat;
Cmds* theCmds;
Prog* theProg;

%}

%token<num>  NUM
%token<str>  IDENT
%token  PLUS MINUS TIMES  DIV
%token  LPAR RPAR
%token  NL
%token  TRUE FALSE
%token  NOT AND OR
%token  EQ LT
%token  INT BOOL
%token  VAR CONST
%token  SET IF WHILE
%token  PV
%token  LCR RCR
%token  TR SUP ST DP
%token ECHO

%left PLUS MINUS
%left TIMES DIV
%left NEG AND OR
%left VAR CONST
%left SET IF WHILE


%union {
  Type* typ;
  Types* typs;
  Arg* ar;
  Args* ars;
  int num;
  char* str;
  Expr* expr;
  Declaration* decl;
  Stat* sta;
  Cmds* cmd;
  Prog* pro;

}

%type<pro> prog
%type<cmd> cmds
%type<typ> type
%type<typs> types;
%type<ar> arg;
%type<ars> args;
%type<decl> dec
%type<sta> stat
%type<expr> exp

%start line
%%

line: prog    { theProg = $1; }
;

prog:
  LCR cmds RCR            { $$ = newASTProg($2); }
;

cmds:
  stat                    { $$ = newASTCmd_Stat($1); }
| dec PV cmds             { $$ = newASTCmd_DecAndCmds($1,$3); }
| stat PV cmds            { $$ = newASTCmd_StatAndCmds($1,$3); }
;

dec:
  CONST IDENT type exp                { $$ = newASTConstDeclaration($2,$3,$4); }
| FUN IDENT type LCR args RCR exp     { $$ = newASTFunDec($2,$3,$5,$7); }
| FUN REC IDENT type LCR args RCR exp { $$ = newASTRecFunDec($2,$3,$5,$7); }
;

stat:
  ECHO exp                 { $$ = newASTEcho($2); }
;

exp:
  NUM                       { $$ = newASTNum($1); }
| IDENT                     { $$ = newASTId($1); }
| TRUE                      { $$ = newASTBool(1); }
| FALSE                     { $$ = newASTBool(0); }
| LPAR NOT exp RPAR         { $$ = newASTLogNOT(AST_NOT,$3); }
| LPAR AND exp exp RPAR     { $$ = newASTLog(AST_AND,$3,$4); }
| LPAR OR exp exp RPAR      { $$ = newASTLog(AST_OR,$3,$4); }
| LPAR EQ exp exp RPAR      { $$ = newASTComp(AST_EQ,$3,$4); }
| LPAR LT exp exp RPAR      { $$ = newASTComp(AST_LT,$3,$4); }
| LPAR PLUS exp exp RPAR    { $$ = newASTPrim(AST_ADD,$3,$4); }
| LPAR MINUS exp exp RPAR   { $$ = newASTPrim(AST_SUB,$3,$4); }
| LPAR TIMES exp exp RPAR   { $$ = newASTPrim(AST_MUL,$3,$4); }
| LPAR DIV exp exp RPAR     { $$ = newASTPrim(AST_DIV,$3,$4); }
;

exps:
  exp                       { $$ = newASTexpr($1); }
| exp exps                  { $$ = newASTexprs($1,$2); }
;

type:
  INT                     { $$ = newASTtprim(AST_TYPEINT); }
| BOOL                    { $$ = newASTtprim(AST_TYPEBOOL); }
| LPAR types TR SUP type  { $$ = newASTFunType($2,$5); }
;

types:
  type                    { $$ = newASTType($1); }
| type ST types           { $$ = newASTTypes($1,$3); }
;

arg:
  IDENT DP type           { $$ = newASTArgDec($1,$3); }
;

args:
  arg                     { $$ = newASTArg($1); }
| arg VR args             { $$ = newASTArgs($1,$3); }
;


%%

int yyerror(char *s) {
  printf("error: %s\n",s);
  return 1;
}

int main(int argc, char **argv) {
  yyparse();
  printProg(theProg);
  printf("\n");
  return 0;
}
