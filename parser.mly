%token <int> INT
%token <string> VAR
%token PLUS MINUS TIMES TRUE FALSE NOT AND OR EQ LEQ SKIP ASSIGN SEQ IF FI 
%token THEN ELSE WHILE DO DONE LPAREN RPAREN EOF
%left SEQ
%left NOT AND OR EQ LEQ SKIP
%left PLUS MINUS
%left TIMES

%start main
%type <string> main

%%

main:
        aexp EOF                { $1 }
      | bexp EOF                { $1 }
      | comm EOF                { $1 }
;

aexp:
        INT                     { Printf.sprintf "(IntConst %d)" $1 }
      | VAR                     { Printf.sprintf "(Var \"%s\")" $1 }
      | aexp PLUS aexp          { Printf.sprintf "(Plus (%s,%s))" $1 $3 }
      | aexp MINUS aexp         { Printf.sprintf "(Minus (%s,%s))" $1 $3 }
      | aexp TIMES aexp         { Printf.sprintf "(Times (%s,%s))" $1 $3 }
      | LPAREN aexp RPAREN      { $2; }
;

bexp:
        TRUE                    { "(True)" }
      | FALSE                   { "(False)" }
      | NOT bexp                { Printf.sprintf "(Not %s)" $2 }
      | bexp AND bexp           { Printf.sprintf "(And (%s,%s))" $1 $3 }
      | bexp OR bexp            { Printf.sprintf "(Or (%s,%s))" $1 $3 }
      | aexp EQ aexp            { Printf.sprintf "(EqTest (%s,%s))" $1 $3 }
      | aexp LEQ aexp           { Printf.sprintf "(LeqTest (%s,%s))" $1 $3 }
      | LPAREN bexp RPAREN      { $2; }
;

comm:
        SKIP                    { "(Skip)" }
      | VAR ASSIGN aexp         { Printf.sprintf "(Assign (\"%s\",%s))" $1 $3 }
      | comm SEQ comm           { Printf.sprintf "(Seq (%s,%s))" $1 $3 }
      | IF bexp THEN comm ELSE comm FI
        { Printf.sprintf "(IfThenElse (%s,%s,%s))" $2 $4 $6 }
      | WHILE bexp DO comm DONE
        { Printf.sprintf "(While (%s,%s))" $2 $4 }
;
