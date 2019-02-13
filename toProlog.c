#include <stdio.h>
#include "ast.h"
#include "toProlog.h"
void printOp(Oprim op) {
  switch(op) {case AST_ADD : printf("add"); break;
  case AST_SUB : printf("sub"); break;
  case AST_MUL : printf("mul"); break;
  case AST_DIV : printf("div"); break;
  }
}

void printSymLog(SymLog s) {
  switch (s) {
    case AST_NOT : printf("not"); break;
    case AST_AND : printf("and"); break;
    case AST_OR : printf("or"); break;
  }
}

void printSymComp(SymComp s) {
  switch (s) {
    case AST_EQ : printf("eq"); break;
    case AST_LT : printf("lt"); break;
  }
}

void printSymStat(SymStat s) {
  switch (s) {
    case AST_SET: printf("set"); break;
    case AST_IF: printf("if"); break;
    case AST_WHILE: printf("while"); break;
  }
}

void printNum(int n) {
  printf("%d",n);
}

void printId(char* x) {
  printf("\"%s\"",x);
}

void printBool(int n) {
  if(n){
    printf("TRUE\n");
  }else{
    printf("FALSE\n");
  }
}

void printTprim(Tprim t) {
  switch(t) {
    case ASTTypeInt : printf("Type(Integer)"); break;
    case ASTTypeBool : printf("Type(Boolean)"); break;
  }
}


void printType(Type* t) {
  switch (tagOf(t)) {
    case ASTTprim: printTprim(t->content.t); break;
    case ASTFunType : {
      printf("FunType");
      printf("(");
      printTypes(t->content.FunType.in);
      printf(",");
      printType(t->content.FunType.out);
      printf(")");
      break;
    }
  }
}

void printTypes(Types* t) {
  switch (tagOf(t)) {
    case ASTType: printType(t->content.type); break;
    case ASTTypes: {
      printType(t->content.Types.type);
      printf(",");
      printTypes(t->content.Types.types);
      break;
    }
  }
}

void printArg(Arg* arg) {
  printf("Arg");
  printf("(");
  printId(arg->id.content.id);
  printf(",");
  printType(arg->type);
  printf(")");
}

void printArgs(Args* args) {
  switch (tagOf(args)) {
    case ASTArg: printArg(args->content.arg); break;
    case ASTargs: {
      printf("Args");
      printf("(");
      printType(args->content.args.arg);
      printf(",");
      printTypes(args->content.args.args);
      printf(")");
      break;
    }
  }
}


void printExpr(Expr *e) {
  switch(tagOf(e)) {
    case ASTNum : printNum(getNum(e)); break;
    case ASTId : printId(getId(e)); break;
    case ASTPrim : {
      printOp(getOp(e));
      printf("(");
      printExpr(getOpand1(e));
      printf(",");
      printExpr(getOpand2(e));
      printf(")");
      break;
    }
    case ASTLog : {
      printSymLog(e->content.logOp.s);
      printf("(");
      printExpr(e->content.logOp.e1);
      if ((e->content.logOp.e2)!=NULL) {
        printf(",");
        printExpr(e->content.logOp.e2);
      }
      printf(")");
      break;
    }
    case ASTComp : {
      printSymComp(e->content.comp.s);
      printf("(");
      printExpr(e->content.comp.e1);
      printf(",");
      printExpr(e->content.comp.e2);
      printf(")");
      break;
    }
    case ASTBool : printBool(e->content.num); break;
  }
}

void printExprs(Exprs* e) {
  switch (tagOf(e)) {
    case ASTExpr: {
      printExpr(e->content.Expr.e);
      break;
    }
    case ASTExprs: {
      printExprs(e->content.Exprs.es);
      break;
    }
  }
}



void printDeclaration(Declaration *d) {
  switch (tagOf(d)) {
    case ASTVarDec: {
      printf("VarDeclaration(");
      printId(getId(d->id));
      printf(",");
      printType(d->type);
      printf(")");
      break;
    }
    case ASTConstDec: {
      printId(getId(d->id));
      printf(",");
      printType(d->type);
      printf(",");
      printExpr(d->expr);
      printf(")");
      break;
    }
  }
}



void printStat(Stat* s) {
  switch (tagOf(s)) {
    case AST_SET: {
      printSymStat(s->content.Affactation.s);
      printf("(");
      printExpr(s->content.Affactation.id);
      printf(",");
      printExpr(s->content.Affactation.expr);
      printf(")");
      break;
    }
    case AST_IF: {
      printSymStat(s->content.Alternative.s);
      printf("(");
      printExpr(s->content.Alternative.test);
      printf(",");
      printProg(s->content.Alternative.body);
      printf(",");
      printProg(s->content.Alternative.alt);
      printf(")");
      break;
    }
    case AST_WHILE: {
      printSymStat(s->content.Loop.s);
      printf("(");
      printExpr(s->content.Loop.test);
      printf(",");
      printProg(s->content.Loop.body);
      printf(")");
      break;
    }
  }
}

void printCmds(Cmds* c) {
  switch (tagOf(c)) {
    case ASTCmd_Stat: {
      printf("(");
      printStat(c->content.Stat.s);
      printf(")");
      break;
    }

    case ASTCmd_StatAndCmds: {
      printf("(");
      printStat(c->content.StatAndCmds.s);
      printf(",");
      printCmds(c->content.StatAndCmds.c);
      printf(")");
      break;
    }

    case ASTCmd_DecAndCmds: {
      printf("(");
      printDeclaration(c->content.DecAndCmds.d);
      printf(",");
      printCmds(c->content.DecAndCmds.c);
      printf(")");
      break;
    }
  }
}


void printProg(Prog* p) {
  Cmds* cmds = p->c;
  printCmds(cmds);
}
