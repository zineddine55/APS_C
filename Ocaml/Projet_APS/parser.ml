type token =
  | NUM of (int)
  | IDENT of (string)
  | PLUS
  | MINUS
  | TIMES
  | DIV
  | LPAR
  | RPAR
  | TRUE
  | FALSE
  | IF
  | EOL

open Parsing;;
let _ = parse_error;;
# 2 "parser.mly"
open Ast
# 20 "parser.ml"
let yytransl_const = [|
  259 (* PLUS *);
  260 (* MINUS *);
  261 (* TIMES *);
  262 (* DIV *);
  263 (* LPAR *);
  264 (* RPAR *);
  265 (* TRUE *);
  266 (* FALSE *);
  267 (* IF *);
  268 (* EOL *);
    0|]

let yytransl_block = [|
  257 (* NUM *);
  258 (* IDENT *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\002\000\002\000\002\000\002\000\002\000\
\002\000\002\000\000\000"

let yylen = "\002\000\
\002\000\001\000\001\000\005\000\005\000\005\000\005\000\001\000\
\001\000\006\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\002\000\003\000\000\000\009\000\008\000\011\000\
\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\004\000\005\000\006\000\007\000\000\000\010\000"

let yydgoto = "\002\000\
\008\000\009\000"

let yysindex = "\004\000\
\010\255\000\000\000\000\000\000\018\255\000\000\000\000\000\000\
\001\255\010\255\010\255\010\255\010\255\010\255\000\000\010\255\
\010\255\010\255\010\255\010\255\006\255\008\255\017\255\019\255\
\010\255\000\000\000\000\000\000\000\000\020\255\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\246\255"

let yytablesize = 29
let yytable = "\016\000\
\017\000\018\000\019\000\020\000\001\000\021\000\022\000\023\000\
\024\000\025\000\003\000\004\000\015\000\026\000\030\000\027\000\
\005\000\000\000\006\000\007\000\010\000\011\000\012\000\013\000\
\028\000\000\000\029\000\031\000\014\000"

let yycheck = "\010\000\
\011\000\012\000\013\000\014\000\001\000\016\000\017\000\018\000\
\019\000\020\000\001\001\002\001\012\001\008\001\025\000\008\001\
\007\001\255\255\009\001\010\001\003\001\004\001\005\001\006\001\
\008\001\255\255\008\001\008\001\011\001"

let yynames_const = "\
  PLUS\000\
  MINUS\000\
  TIMES\000\
  DIV\000\
  LPAR\000\
  RPAR\000\
  TRUE\000\
  FALSE\000\
  IF\000\
  EOL\000\
  "

let yynames_block = "\
  NUM\000\
  IDENT\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 19 "parser.mly"
                                 ( _1 )
# 109 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 22 "parser.mly"
                                 ( ASTNum(_1) )
# 116 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 23 "parser.mly"
                                 ( ASTId(_1) )
# 123 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 24 "parser.mly"
                                 ( ASTPrim(Ast.Add, _3, _4) )
# 131 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 25 "parser.mly"
                                 ( ASTPrim(Ast.Sub, _3, _4) )
# 139 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 26 "parser.mly"
                                 ( ASTPrim(Ast.Mul, _3, _4) )
# 147 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 27 "parser.mly"
                                 ( ASTPrim(Ast.Div, _3, _4) )
# 155 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 28 "parser.mly"
                                 ( ASTBool(false) )
# 161 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 29 "parser.mly"
                                 ( ASTBool(true) )
# 167 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 3 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 30 "parser.mly"
                                  ( ASTAlt(_3, _4, _5) )
# 176 "parser.ml"
               : 'expr))
(* Entry line *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let line (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Ast.expr)
