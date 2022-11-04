package Compilador;
import java.io.*;

public class GeraLexer {
    public static void main(String[] args) throws IOException{
        String arq = "C:/Compiladores/Unidade2/src/Compilador/especificacao.flex";
        gerarLexer(arq);
    }
    public static void gerarLexer(String arq){
        File file = new File(arq);
        jflex.Main.generate(file);
    }
}
