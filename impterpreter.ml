open Lex;;
open Parser;;

let lexbuf = Lexing.from_channel stdin in
let result = Parser.main Lex.token lexbuf in
Printf.printf "%s\n" result
