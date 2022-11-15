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
vazio =  [\t \ ]+

DECIMAL = [0-9]+
HEXA = [a-zA-Z]+

%%

{vazio}     {}
{quebra}    {}

{DECIMAL},{DECIMAL}  { System.out.println("REAL: "+yytext()); }

{DECIMAL}*{HEXA}+{DECIMAL}*   { System.out.println("HEXA: "+yytext()); }

[0-7]* { System.out.println("DECIMAL: "+yytext());}

[0-9]* { System.out.println("OCTAL: "+yytext()); }

.       {}

fim             { System.out.println(decimal+" decimais. \n"+octal+" octais. \n"+hexadecimal+" hexadecimais. \n"+real+" reais." ); return null; }
<<EOF>> {System.out.println("FIM => fim inesperado [!EOF!]");return null;}