%{
#include <stdlib.h>
#include "ast.h"
#include "y.tab.h"

%}

nls "\n"|"\r"|"\r\n"
nums "-"?[0-9]+
idents [a-zA-Z][a-zA-Z0-9]*
%%

[ \t]  { /* On ignore */ }

"add"   return(PLUS);
"sub"   return(MINUS);

"mul"   return(TIMES);
"div"   return(DIV);

"not"   return(NOT);
"and"   return(AND);
"or"   return(OR);

"("   return(LPAR);
")"   return(RPAR);

"true"  return(TRUE);
"false" return(FALSE);

"eq"    return(EQ);
"lt"    return(LT);

"bool"  return(BOOL);
"int"   return(INT);

"const" return(CONST);
"fun"   return(FUN);
"rec"   return(REC);

"set"   return(SET);
"if"    return(IF);
"while" return(WHILE);

":"     return(DP);
","     return(VR);
";"     return(PV);

"["     return(LCR);
"]"     return(RCR);

"-"     return(TR);
">"     return(SUP);

"*"     return(ST);

{nls}  { return(0); }

{nums}    {
    yylval.num=atoi(yytext);
    return(NUM);
  }

{idents}    {
    yylval.str=strdup(yytext);
    return(IDENT);
}
