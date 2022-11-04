package Compilador;
import java.io.*;

public class TesteAnalisador {
    public static void main(String[] args) throws IOException {        
        String arq = "C:/Compiladores/Unidade2/MiniC.TXT";
        BufferedReader in = new BufferedReader(new FileReader(arq));        
        Lexer analise = new Lexer(in);
        while (true){
            Token token = analise.yylex();
            if (token==null) break; // EOF               
        }
    }
}