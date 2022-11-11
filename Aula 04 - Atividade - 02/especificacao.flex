package Compilador;
%%
%{
%}
%type Token
%class Lexer

quebra = [\r\n]+
vazio =  [\t \ ]+


%%

aa | ab    { System.out.println("[TOKEN] ==> "+yytext());}

[a-zA-Z]+    { System.out.println("Untokenized: "+yytext()); }
{vazio}      {}
{quebra}     {}

.           { System.out.println("Outros: "+yytext()); }