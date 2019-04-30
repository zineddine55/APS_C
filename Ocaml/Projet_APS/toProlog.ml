open Ast

let rec print_prolog e =
    match e with
            ASTNum n -> Printf.printf"%d" n
        | ASTId x -> Printf.printf"\"%s\"" x
        | ASTPrim(op, e1, e2) -> (
            Printf.printf"%s" (string_of_op op);
            Printf.printf"(";
            print_prolog e1;
            Printf.printf",";
            print_prolog e2;
            Printf.printf")")
        | ASTBool b -> Printf.printf "%b" b
        | ASTAlt(e1, e2, e3) -> (
            Printf.printf"if(":
            print_prolog e1;
            Printf.printf", ";
            print_prolog e2;
            Printf.printf", ";
            print_prolog e3;
            print_prolog")") 
        | ASTApp(expr, exprs) -> (
            Printf.printf"(";
            print_prolog expr;
            Printf.printf",";
            print_prolog exprs;
            Printf.printf")")
        (* | ASTExprs *)
            

let _ =
    try
        let lexbuf = Lexing.from_channel stdin in
        let e = Parser.line Lexer.token lexbuf in
            print_prolog e;
            print_char '\n'
            
    with Lexer.Eof -> exit 0