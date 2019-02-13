typedef struct _expr Expr;
typedef enum _tag Tag;
typedef enum _oprim Oprim;
typedef struct _type Type;
typedef enum _typeTag TypeTag;
typedef struct _declaration Declaration;
typedef enum _symLog SymLog;
typedef enum _symComp SymComp;
typedef enum _declarationTag DeclarationTag;
typedef enum _statTag StatTag;
typedef struct _stat Stat;
typedef enum _symStat SymStat;
typedef struct _cmds Cmds;
typedef enum _cmdsTag CmdsTag;
typedef struct _prog Prog;
typedef struct _exprs Exprs;
typedef enum _tprim Tprim;
typedef struct _types Types;
typedef struct _arg Arg;
typedef struct _args Args;


enum _tag {ASTNum, ASTId, ASTPrim, ASTBool, ASTLog, ASTComp, ASTExpr, ASTExprs
          ASTTprim, ASTFunType, ASTType, ASTTypes, ASTArg, ASTArgs,
          ASTConstDec};
enum _oprim { AST_ADD, AST_SUB, AST_DIV, AST_MUL };
enum _tprim { AST_TYPEINT, AST_TYPEBOOL };
enum _typeTag { ASTTypeBool, ASTTypeInt  };
enum _symLog { AST_NOT, AST_AND, AST_OR};
enum _symComp { AST_EQ, AST_LT };
enum _statTag { ASTAffect, ASTAlt, ASTLoop };
enum _symStat { AST_SET, AST_IF, AST_WHILE };
enum _cmdsTag { ASTCmd_Stat, ASTCmd_DecAndCmds, ASTCmd_StatAndCmds };


struct _type {
  Tag tag;
  union{
    Tprim t;
    struct { Types* in, Type* out} FunType;
  } content;
};

struct _types {
  Tag tag;
  union{
    Type* type;
    struct {Type* type, Types* types} Types;
  } content;
};

struct _arg {
  Expr* id;
  Type* type;
};

struct _args {
  Tag tag;
  union{
    Arg* arg;
    struct {Arg* arg, Args* args} args;
  } content;
};


struct _declaration {
    Tag tag;
    union{
      struct {Expr* id, Type* type, Expr* val;} constDec;
      struct {} funDec;
      struct {} recFunDec;
    }
};

struct _stat {
  StatTag tag;
  union{
    struct { SymStat s; Expr* id; Expr* expr; } Affactation;
    struct { SymStat s; Expr* test; Prog* body; Prog* alt; } Alternative;
    struct { SymStat s; Expr* test; Prog* body; } Loop;
  } content;
};

struct _expr {	Tag tag;
              	union {int num;
			                 char* id;
			                 struct {Oprim op;Expr *opand1;Expr *opand2;} binOp;
                       struct {SymLog s; Expr* e1; Expr* e2;} logOp;
                       struct {SymComp s; Expr* e1; Expr* e2;} comp;
		                   } content;
	           };

struct _exprs {
  Tag tag;
  union{
    struct {Expr* e;} Exp;
    struct {Expr* e; Exprs* es;} Exps;
  } content;
}

struct _cmds {
  CmdsTag tag;
  union {
    struct {Stat* s;} Stat;
    struct {Declaration* d; Cmds* c;} DecAndCmds;
    struct {Stat* s; Cmds* c;} StatAndCmds;
  } content;
};


struct _prog {
  Cmds* c;
};

Expr* newASTNum(int n);
Expr* newASTId(char* x);
Expr* newASTPrim(Oprim op, Expr* e1, Expr* e2);
Expr* newASTBool(int v);
Type* newASTTypeInt();
Type* newASTTypeBool();
Declaration* newASTVarDeclaration(DeclarationTag t, char* v, Type* type);
Declaration* newASTConstDeclaration(DeclarationTag t, char* v, Type* type, Expr* expr);
Expr* newASTLogNOT(SymLog s, Expr* e);
Expr* newASTLog(SymLog s, Expr* e1, Expr* e2);
Expr* newASTComp(SymComp s, Expr* e1, Expr* e2 );
Stat* newASTAffectation(SymStat s, char* v, Expr* expr);
Stat* newASTAlternative(SymStat s, Expr* test, Prog* body, Prog* alt);
Stat* newASTLoop(SymStat s, Expr* test, Prog* body);
Cmds* newASTCmd_Stat(Stat* s);
Cmds* newASTCmd_StatAndCmds(Stat* s, Cmds* c);
Cmds* newASTCmd_DecAndCmds(Declaration* d, Cmds* c);
Prog* newASTProg(Cmds* c);
Exprs* newASTexpr(Expr* e);
Exprs* newASTexprs(Expr* e, Exprs* es);
Type* newASTtprim(Tprim* tprim);
Type* newASTFunType(Types* in, Type* out);
Types* newASTType(Type* type);
Types* newASTTypes(Type* type, Types* types);
Arg* newASTArgDec(char* id, Type* type);
Args* newASTArg(Arg* arg);
Args* newASTArgs(Arg* arg, Args* args);

#define tagOf(r) r->tag
#define getNum(r) r->content.num
#define getId(r) r->content.id
#define getOp(r) r->content.binOp.op
#define getOpand1(r) r->content.binOp.opand1
#define getOpand2(r) r->content.binOp.opand2
