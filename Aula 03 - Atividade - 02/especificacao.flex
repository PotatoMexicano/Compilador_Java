package Compilador;
%%


%type Token
%class Lexer

quebra = [\r\n]+
vazio =  [\t \ ]+

simples = "//"[a-zA-Z0-9\ \t]*
complexo = "/*"[a-zA-Z0-9\ \t\r\n]*"*/"

%%
{vazio}     {}
{quebra}    {}

{simples}   { System.out.println(yytext()+": Comentário"); }

{complexo}  {System.out.println(yytext()+": Comentário");}

[a-zA-Z0-9\ \*/]* {System.out.println(yytext());}

.           { System.out.println("Outros: "+yytext()); }

<<EOF>>     {return null;}