{
        open Parser;;
}

rule token = parse
        [' ' '\t' '\n'] { token lexbuf }
      | '-'?['0'-'9']+    as lxm { INT(int_of_string lxm) }
      | '+'             { PLUS }
      | '-'             { MINUS }
      | '*'             { TIMES }
      | "true"          { TRUE }
      | "false"         { FALSE }
      | "!"             { NOT }
      | "&"             { AND }
      | "|"             { OR }
      | "="             { EQ }
      | "<="            { LEQ }
      | "skip"          { SKIP }
      | ":="            { ASSIGN }
      | ";"             { SEQ }
      | "if"            { IF }
      | "fi"            { FI }
      | "then"          { THEN }
      | "else"          { ELSE }
      | "while"         { WHILE }
      | "do"            { DO }
      | "done"          { DONE }
      | '('             { LPAREN }
      | ')'             { RPAREN }
      | ['a'-'z']+      as lxm { VAR(lxm) }
      | eof             { EOF }
