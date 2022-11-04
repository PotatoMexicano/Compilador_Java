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
{numero}{virgula}{numero}{eol}       {real++;}
{hexa}+{eol}     {hexadecimal++;}
{octal}{eol}       {octal++;}
{numero}{eol}        {decimal++;}

.       {}

fim             { System.out.println(decimal+" decimais. \n"+octal+" octais. \n"+hexadecimal+" hexadecimais. \n"+real+" reais." ); return null; }
<<EOF>> {System.out.println("FIM => fim inesperado [!EOF!]");return null;}