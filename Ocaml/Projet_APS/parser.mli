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

val line :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Ast.expr
