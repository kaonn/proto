structure Tokens = 
struct
  datatype num = DECNUM of int | HEXNUM of int 

  datatype binop = PLUS | MINUS | MULT | DIV | MOD
  datatype asnop = ASNEQ | ASNPLUS | ASNMINUS | ASNMULT | ASNDIV | ASNMOD

  datatype oper = UNOP | BINOP of binop | ASNOP of asnop

  datatype reserved = MM

  datatype keyword = STRUCT | TYPEDEF | IF | ELSE | WHILE | FOR | CONTINUE |
                     BREAK | RETURN | ASSERT | TRUE | FALSE | NULL | ALLOC | 
                     ALLOC_ARRAY | INT | BOOL | VOID | CHAR | STRING

  datatype token = IDENT of string | 
                   NUM of num | OP of oper | R of reserved | K of keyword | 
                   EOS | EOF | LPAREN | RPAREN | LBRACE | RBRACE
end

