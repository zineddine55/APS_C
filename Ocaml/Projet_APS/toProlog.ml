open Ast

let rec print_prolog e =
    match e with 
        |   ASTProg e -> print_exprs e
(*         
    match e with
            ASTExpr e -> print_expr e;
        |   ASTExprs(expr,exprs) -> print_exprs e *)

and print_expr e = 
    match e with
            ASTNum n -> Printf.printf"%d" n
        | ASTId x -> Printf.printf"\"%s\"" x
        | ASTPrim(op, e1, e2) -> (
            Printf.printf"%s" (string_of_op op);
            Printf.printf"(";
            print_expr e1;
            Printf.printf",";
            print_expr e2;
            Printf.printf")")
        | ASTBool b -> Printf.printf "%b" b
        | ASTAlt(e1, e2, e3) -> (
            Printf.printf"if(";
            print_expr e1;
            Printf.printf", ";
            print_expr e2;
            Printf.printf", ";
            print_expr e3;
            Printf.printf")") 
        | ASTApp(expr, exprs) -> (
            Printf.printf"(";
            print_expr expr;
            Printf.printf",";
            print_exprs exprs;
            Printf.printf")")
        (* | ASTExprs *)

and print_exprs e = 
    match e with 
            ASTExpr e -> print_expr e;
        |   ASTExprs(expr, exprs) -> (
                Printf.printf"(";
                print_expr expr;
                Printf.printf",";
                print_exprs exprs;
                Printf.printf")");;

                

let _ =
    try
        let lexbuf = Lexing.from_channel stdin in
        let e = Parser.line Lexer.token lexbuf in
            print_prolog e;
            print_char '\n'

    with Lexer.Eof -> 
        exit 0