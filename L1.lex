structure T = Tokens
type lexresult = T.token
val eof = fn () => T.EOF

%%
%structure L1lex
%s COMMENT_SINGLE COMMENT_MULTI;

ident=[A-Za-z_][A-Za-z0-9_]*;
decnum=0 | [1-9][0-9]*;
hexnum=0[xX][0-9a-fA-F]+;
ws=[\v \t \r \n \f \];
comment_single="//"| "//@";
comment_multi_begin="/*" | "/*@";
comment_multi_end="*/" | "@*/";

%%

<INITIAL>{comment_single} => (YYBEGIN COMMENT_SINGLE; lex());
<INITIAL>{comment_multi_begin} => (YYBEGIN COMMENT_MULTI; lex());

<INITIAL>{ws}+ => (lex());
<INITIAL>{decnum} => (T.NUM(T.DECNUM(Option.valOf(Int.fromString(yytext)))));
<INITIAL>{hexnum} => (T.NUM(T.DECNUM(Option.valOf(StringCvt.scanString 
                        (Int.scan StringCvt.HEX) yytext))));

<INITIAL>struct => (T.K(T.STRUCT));
<INITIAL>typedef => (T.K(T.TYPEDEF));
<INITIAL>if => (T.K(T.IF)); 
<INITIAL>else => (T.K(T.ELSE)); 
<INITIAL>while => (T.K(T.WHILE)); 
<INITIAL>for => (T.K(T.FOR)); 
<INITIAL>continue => (T.K(T.CONTINUE)); 
<INITIAL>break=> (T.K(T.BREAK));
<INITIAL>return => (T.K(T.RETURN)); 
<INITIAL>assert => (T.K(T.ASSERT)); 
<INITIAL>true => (T.K(T.TRUE)); 
<INITIAL>false => (T.K(T.FALSE)); 
<INITIAL>null => (T.K(T.NULL)); 
<INITIAL>alloc => (T.K(T.ALLOC)); 
<INITIAL>alloc_array=> (T.K(T.ALLOC_ARRAY));
<INITIAL>int=> (T.K(T.INT));
<INITIAL>bool => (T.K(T.BOOL)); 
<INITIAL>void => (T.K(T.VOID)); 
<INITIAL>char => (T.K(T.CHAR)); 
<INITIAL>string=> (T.K(T.STRING));

<INITIAL>"--" => (T.R(T.MM));

<INITIAL>"-" => (T.OP(T.UNOP));
<INITIAL>"+" => (T.OP(T.BINOP(T.PLUS)));
<INITIAL>"*" => (T.OP(T.BINOP(T.MULT)));
<INITIAL>"/" => (T.OP(T.BINOP(T.DIV)));
<INITIAL>"%" => (T.OP(T.BINOP(T.MOD)));

<INITIAL>"=" => (T.OP(T.ASNOP(T.ASNEQ)));
<INITIAL>"+=" => (T.OP(T.ASNOP(T.ASNPLUS)));
<INITIAL>"-=" => (T.OP(T.ASNOP(T.ASNMINUS)));
<INITIAL>"*=" => (T.OP(T.ASNOP(T.ASNMULT)));
<INITIAL>"/=" => (T.OP(T.ASNOP(T.ASNDIV)));
<INITIAL>"%=" => (T.OP(T.ASNOP(T.ASNMOD)));

<INITIAL>{ident} => (T.IDENT(yytext));

<COMMENT_SINGLE>\n => (YYBEGIN INITIAL; lex());
<COMMENT_SINGLE>. => (lex());

<COMMENT_MULTI>{comment_multi_end} => (YYBEGIN INITIAL; lex());
<COMMENT_MULTI>. | \n => (lex());



