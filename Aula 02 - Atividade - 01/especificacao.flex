package Compilador;
%%
%type Token
%class Lexer
%%

{vazio}     {}
{quebra}    {}

[_a-zA-Z][a-zA-Z0-9]*    { System.out.println("Palavra reconhecida: "+yytext());}

.            { System.out.println("Outro: "+yytext()+" ==> Não reconhecido"); }