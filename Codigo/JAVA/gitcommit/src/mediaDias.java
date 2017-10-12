import java.io.*;
import java.math.BigDecimal;
import java.util.ArrayList;


public class mediaDias {


    private final String nome;

    public mediaDias(String nomeAPI) throws IOException {
        //somaDias(variosDias);
        this.nome = nomeAPI;
        printaux(this.nome);
    }

    public mediaDias(ArrayList<Long> variosDias, String nomeAPI) throws IOException {
        //somaDias(variosDias);
        this.nome = nomeAPI;
        print(variosDias);
    }

    public String getNome() {
        return this.nome;
    }

    private void print(ArrayList<Long> variosDias) throws IOException {
        File resultado2 = new File("/home/facom/Documents/Teste/GIT/Projetos/gitDiff/FirstImport/resultado-Media.csv");
        FileWriter fw = new FileWriter(resultado2);
       // fw.write(String.valueOf(somaDias1(variosDias)) +", " + getNome() );
    }

    private void printaux(String nome) throws IOException {
        File resultado2 = new File("/home/facom/Documents/Teste/GIT/Projetos/gitDiff/FirstImport/resultado-Media.csv");
        FileWriter fw = new FileWriter(resultado2);
        fw.write(String.valueOf("0 , " + nome));
    }

    private void somaDias1(ArrayList<Long> dias) throws FileNotFoundException {
/*
        BigDecimal soma = null;
        BigDecimal aux = null;


        for(int i=0; i < dias.size() ; i++){
            aux = BigDecimal.valueOf(dias.get(i));
            soma = soma.add(aux);
        }

        BigDecimal media = soma.divide(BigDecimal.valueOf(dias.size()-1));

        return media;
*/
    }


}
