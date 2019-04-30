type token =
  | NUM of (int)
  | IDENT of (string)
  | PLUS
  | MINUS
  | TIMES
  | DIV
  | LPAR
  | RPAR
  | EOL

open Parsing;;
let _ = parse_error;;
# 2 "parser.mly"
open Ast
# 17 "parser.ml"
let yytransl_const = [|
  259 (* PLUS *);
  260 (* MINUS *);
  261 (* TIMES *);
  262 (* DIV *);
  263 (* LPAR *);
  264 (* RPAR *);
  265 (* EOL *);
    0|]

let yytransl_block = [|
  257 (* NUM *);
  258 (* IDENT *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\002\000\002\000\002\000\002\000\000\000"

let yylen = "\002\000\
\002\000\001\000\001\000\005\000\005\000\005\000\005\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\002\000\003\000\000\000\008\000\000\000\000\000\
\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\004\000\005\000\006\000\007\000"

let yydgoto = "\002\000\
\006\000\007\000"

let yysindex = "\003\000\
\008\255\000\000\000\000\000\000\013\255\000\000\002\255\008\255\
\008\255\008\255\008\255\000\000\008\255\008\255\008\255\008\255\
\004\255\005\255\006\255\012\255\000\000\000\000\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\248\255"

let yytablesize = 20
let yytable = "\013\000\
\014\000\015\000\016\000\001\000\017\000\018\000\019\000\020\000\
\003\000\004\000\012\000\021\000\022\000\023\000\005\000\008\000\
\009\000\010\000\011\000\024\000"

let yycheck = "\008\000\
\009\000\010\000\011\000\001\000\013\000\014\000\015\000\016\000\
\001\001\002\001\009\001\008\001\008\001\008\001\007\001\003\001\
\004\001\005\001\006\001\008\001"

let yynames_const = "\
  PLUS\000\
  MINUS\000\
  TIMES\000\
  DIV\000\
  LPAR\000\
  RPAR\000\
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
# 17 "parser.mly"
                                 ( _1 )
# 93 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 20 "parser.mly"
                                 ( ASTNum(_1) )
# 100 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 21 "parser.mly"
                                 ( ASTId(_1) )
# 107 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 22 "parser.mly"
                                 ( ASTPrim(Ast.Add, _3, _4) )
# 115 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 23 "parser.mly"
                                 ( ASTPrim(Ast.Sub, _3, _4) )
# 123 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 24 "parser.mly"
                                 ( ASTPrim(Ast.Mul, _3, _4) )
# 131 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 25 "parser.mly"
                                 ( ASTPrim(Ast.Div, _3, _4) )
# 139 "parser.ml"
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
