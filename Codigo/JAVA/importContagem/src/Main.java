import java.io.*;
import java.text.ParseException;
import java.util.ArrayList;

public class Main {

    public static void main(String[] args) throws IOException, ParseException {


        String linhaArq, api = "";
        Import name = new Import();

        ArrayList diasImport = null;
        ArrayList diasImportPorcentagem = null;

        BufferedReader projectName = null;
        //projectName = new BufferedReader(new FileReader("/home/facom/Documents/Teste/GIT/Projetos/gitDiff/FirstImport/top_filtrado.txt"));
        //projectName = new BufferedReader(new FileReader("/home/facom/Documents/Teste/GIT/Projetos/gitDiff/FirstImport/inter_filtrado.txt"));
        projectName = new BufferedReader(new FileReader(name.getProject()));

        name.print();

        while ((api = projectName.readLine()) != null)  //o nome do arquivo com git log de cada arquivo de cada projeto
        {

            BufferedReader apiName = null;
            apiName = new BufferedReader(new FileReader( name.getCaminhoApiName() + api));

            diasImport = new ArrayList();
            diasImportPorcentagem = new ArrayList();

            while ((linhaArq = apiName.readLine()) != null)  //o nome do arquivo com git log de cada arquivo de cada projeto
            {
                // 0 - 500px-android-blur -- projeto
                // 1 - 0b7f072eb60a687e43220608533d245c92fbbcd9 -- hash
                // 2 - 13/Mar/2015 -- primeiro commit
                // 3 - 500px-android-blur.txt/app/src/main/java/com/fivehundredpx/blurdemo/MainActivity.java -- path
                // 4 - 9533327b44dae5baa0e133a9844b8eea204e41b9 -- hash primeiro uso
                // 5 - 17/Mar/2015 -- data do primeiro uso da API
                // 6 - android.animation.Animator -- API

                String[] importInfo = linhaArq.split(", ");


                name.setPrimeiroCommit(importInfo[2]);
                name.setPrimeiroUso(importInfo[5]);
                name.setNomeAPI(importInfo[6]);
                name.ultimoCommit(importInfo[0]);


                name.setSomaDiasImport(name.getPrimeiroUso(), name.getPrimeiroCommit());

                diasImport.add(name.getDias());

                name.setSomaPorcentagem(name.getPrimeiroCommit(), name.getUltimoCommit());

                diasImportPorcentagem.add(name.getPorcentagemvalue());

                name.setContador(1);
            }

            //System.out.println(name.getNomeAPI());

            //System.out.println("Import:" + name.getContador() );
            name.setMediana(diasImport);

            double medianaI = name.getMedianavalue();

            //System.out.println("Porcentagem:" + name.getContador() );
            name.setMediana(diasImportPorcentagem);

            double mediaanaP = name.getMedianavalue();

            //System.out.println();

            name.printResultado(medianaI,mediaanaP);

            name.setContador(0);
            name.setSoma(0);
            name.setSomaP(0);
        }
    }



}
