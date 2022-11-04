package Compilador;
%%
%type Token
%class Lexer
%%

total        { System.out.println("Var: "+yytext()+" ==> reconhecido "+yylength()+" caracteres."); }

total[0-9]*  { System.out.println("Var: "+yytext()+" ==> reconhecido "+yylength()+" caracteres."); }

[a-z_]*total { System.out.println("Var: "+yytext()+" ==> reconhecido "+yylength()+" caracteres."); }

[\r\n]+      { System.out.println("ENTER => reconhecido [ENTER]\n"); }
[\ \t]+      { System.out.println("VAZIO => reconhecido [VAZIO|TAB]"); }

.            { System.out.println("Outro: "+yytext()+" ==> Não reconhecido"); }