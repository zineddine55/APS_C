#include <stdlib.h>
#include <stdio.h>
#include "ast.h"

/* Expressions */
Expr* newASTNum(int v) {
	Expr* r = malloc(sizeof(*r));
	r->tag = ASTNum;
	r->content.num = v;
	return r;
}

Expr* newASTId(char* v) {
	Expr* r = malloc(sizeof(*r));
	r->tag = ASTId;
	r->content.id = v;
	return r;
}

Expr* newASTPrim(Oprim op, Expr* e1, Expr* e2) {
	Expr* r = malloc(sizeof(*r));r->tag = ASTPrim;
	r->content.binOp.op = op;
	r->content.binOp.opand1 = e1;
	r->content.binOp.opand2 = e2;
	return r;
}

Expr* newASTBool(int v) {
	Expr* r = malloc(sizeof(*r));
	r->tag = ASTBool;
	r->content.num = v;
	return r;
}

Exprs* newASTexpr(Expr* e) {
	Exprs* es = malloc(sizeof(*es));
	es->tag = ASTExpr;
	es->content.Exp.e = e;
}

Exprs* newASTexprs(Expr* e, Exprs* es) {
	Exprs* es = malloc(sizeof(*es));
	es->tag = ASTExprs;
	es->content.Exp.e = e;
	es->content.Exp.es = es;
}

/* Symboles logiques */

Expr* newASTLogNOT(SymLog s, Expr* e1){
	Expr* r = malloc(sizeof(*r));
	r->tag = ASTLog;
	r->content.logOp.s = s;
	r->content.logOp.e1 = e1;
	r->content.logOp.e2 = NULL;
	return r;
}

Expr* newASTLog(SymLog s, Expr* e1, Expr* e2){
	Expr* r = malloc(sizeof(*r));
	r->tag = ASTLog;
	r->content.logOp.s = s;
	r->content.logOp.e1 = e1;
	r->content.logOp.e2 = e2;
	return r;
}

/* Comparaisons */
Expr* newASTComp(SymComp s, Expr* e1, Expr* e2 ) {
	Expr* r = malloc(sizeof(*r));
	r->tag = ASTComp;
	r->content.comp.s = s;
	r->content.comp.e1 = e1;
	r->content.comp.e2 = e2;
}


/* Types */
Type* newASTtprim(Tprim* tprim) {
	Type* t = malloc(sizeof(*t));
	t->tag = ASTTprim;
	t->content.t = tprim;
	return t;
}

Type* newASTFunType(Types* in, Type* out) {
	Type* t = malloc(sizeof(*t));
	t->tag = ASTFunType;
	t->content.FunType.in = in;
	t->content.FunType.out = out;
	return t;
}

Types* newASTType(Type* type) {
	Types* t = malloc(sizeof(*t));
	t->tag = ASTType;
	t->type = type;
	return t;
}

Types* newASTTypes(Type* type, Types* types) {
	Types* t = malloc(sizeof(*t));
	t->tag = ASTTypes;
	t->Types.type = type;
	t->Types.types = types;
	return t;
}

/* Declarations */

Declaration* newASTConstDeclaration(char* v, Type* type, Expr* expr) {
	Declaration* dec = malloc(sizeof(*dec));
	dec->tag = ASTConstDec;
	dec->content.constDec.type = type;
	dec->content.constDec.id = newASTId(v);
	dec->content.constDec.val = expr;
	return dec;
}

Declaration* newASTFunDec(char* v, Type* type,Args* args, Expr* expr){
	Declaration* dec = malloc(sizeof(*dec));
	dec->tag = ASTFunDec;
	dec->content.funDec.id = newASTId(v);
	dec->content.funDec.type = type;
	dec->content.funDec.args = args;
	dec->content.funDec.body = expr;
	return dec
}

Declaration* newASTRecFunDec(char* v, Type* type,Args* args, Expr* expr){
	Declaration* dec = malloc(sizeof(*dec));
	dec->tag = ASTRecFunDec;
	dec->content.funDec.id = newASTId(v);
	dec->content.funDec.type = type;
	dec->content.funDec.args = args;
	dec->content.funDec.body = expr;
	return dec
}

/* Statements */
//
// Stat* newASTAffectation(SymStat s, char* v, Expr* expr){
// 	Stat* stat = malloc(sizeof(*stat));
// 	stat->tag = ASTAffect;
// 	stat->content.Affactation.s = s;
// 	stat->content.Affactation.id = newASTId(v);
// 	stat->content.Affactation.expr = expr;
// 	return stat;
// }
//
//
// Stat* newASTAlternative(SymStat s, Expr* test, Prog* body, Prog* alt){
// 	Stat* stat = malloc(sizeof(*stat));
// 	stat->tag = ASTAlt;
// 	stat->content.Alternative.s = s;
// 	stat->content.Alternative.test = test;
// 	stat->content.Alternative.body = body;
// 	stat->content.Alternative.alt = alt;
// 	return stat;
// }
//
//
// Stat* newASTLoop(SymStat s, Expr* test, Prog* body){
// 	Stat* stat = malloc(sizeof(*stat));
// 	stat->tag = ASTLoop;
// 	stat->content.Loop.s = s;
// 	stat->content.Loop.test = test;
// 	stat->content.Loop.body = body;
// 	return stat;
// }

Stat* newASTEcho(Expr* e) {
	Stat* s = malloc(sizeof(*s));

	return s;
}

/* Commandes */

Cmds* newASTCmd_Stat(Stat* s){
	Cmds* cmds = malloc(sizeof(*cmds));
	cmds->tag = ASTCmd_Stat;
	cmds->content.Stat.s = s;
	return cmds;
}


Cmds* newASTCmd_StatAndCmds(Stat* s, Cmds* c){
	Cmds* cmds = malloc(sizeof(*cmds));
	cmds->tag = ASTCmd_StatAndCmds;
	cmds->content.StatAndCmds.s = s;
	cmds->content.StatAndCmds.c = c;
	return cmds;
}

Cmds* newASTCmd_DecAndCmds(Declaration* d, Cmds* c){
	Cmds* cmds = malloc(sizeof(*cmds));
	cmds->tag = ASTCmd_DecAndCmds;
	cmds->content.DecAndCmds.d = d;
	cmds->content.DecAndCmds.c = c;
	return cmds;
}


/* Program */

Prog* newASTProg(Cmds* cmds){
	Prog* p = malloc(sizeof(*p));
	p->c = cmds;
	return p;
}


/* Arguments */

Arg* newASTArgDec(char* id, Type* type) {
	Arg* a = malloc(sizeof(*a));
	a->id = newASTId(id);
	a->type = type;
	return 	a;
}


Args* newASTArg(Arg* arg) {
	Args* a = malloc(sizeof(*a));
	a->tag = ASTArg;
	a->content.arg = arg;
	return a;
}


Args* newASTArgs(Arg* arg, Args* args) {
	Args* a = malloc(sizeof(*a));
	a->tag = ASTArgs;
	a->content.arg = arg;
	a->content.args = args;
	return a;
}
