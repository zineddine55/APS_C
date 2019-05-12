type op = Add | Mul | Sub | Div

let string_of_op op =
    match op with
        Add -> "add"
      | Mul -> "mul"
      | Sub -> "sub"
      | Div -> "div"
      
let op_of_string op =
    match op with
        "add" -> Add
        | "mul" -> Mul
        | "sub" -> Sub
        | "div" -> Div
type prog = 
  | ASTProg of exprs

and exprs = 
    ASTExpr of expr 
  | ASTExprs of expr * exprs 

and expr =
    ASTNum of int
  | ASTId of string
  | ASTBool of bool
  | ASTPrim of op * expr * expr
  | ASTAlt of expr * expr * expr
  | ASTApp of expr * exprs
