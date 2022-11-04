package Compilador;
%%
%{
    int decimal = 0;
    int hexadecimal = 0;
    int real = 0;
    int octal = 0;

%}
%type Token
%class Lexer

quebra = [\r\n]+
branco = [\ \t]+

numero = [0-9]+
letra = [A-F]+
hexa = {numero}*{letra}+{numero}+ | {numero}+{letra}+{numero}*
eol = {branco} | {quebra}
octal = [0-7]+
virgula = [',']

%%

{branco}        {System.out.println(" ");}
{quebra}        {System.out.println("------");}

{numero}{virgula}{numero}{eol}       {real++;System.out.println("REAL "+yytext());}
{hexa}+{eol}     {hexadecimal++;System.out.println("HEXA => "+yytext());}
{octal}{eol}       {octal++;System.out.println("OCTAL => "+yytext());}
{numero}{eol}        {decimal++; System.out.println("DECIMAL => "+yytext());}



.       {System.out.println(yytext());}

<<EOF>> {System.out.println("FIM => fim inesperado [!EOF!]");return null;}