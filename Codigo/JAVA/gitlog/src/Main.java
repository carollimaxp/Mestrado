import org.joda.time.DateTime;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;




public class Main {

    public static void main(String[] args) throws IOException {
        /*Abrir arq com nome das classes a serem procuradas*/

        GitLog obj = new GitLog();
        DateTime dt;
        String linhaArq = "";
        int year=0;

        BufferedReader tdsCommitTXT = null;
        tdsCommitTXT = new BufferedReader(new FileReader("/home/facom/Documents/Teste/GIT/Bibliotecas/commits.txt"));  //arquivo com todos os .txt de todos os logs de todos projetos e classes
        //tdsCommitTXT = new BufferedReader(new FileReader("/home/facom/Documents/Teste/GIT/Bibliotecas/todosLogCommits.txt"));



        /*android-card-slide-panel, 027a88130119319e883de7d850c5ad617aa8334a, 30/Nov/2015, 
          android-card-slide-panel/CardSlidePanel/app/src/main/java/com/stone/card/CardItemView.java, 
          510501fa65c295283e9d136fd7168e98b88e53fe, 2/Jul/2016, android.os.Build*/

        //BufferedReader tdsFirstImport = null;
        //tdsFirstImport = new BufferedReader(new FileReader("/home/facom/Documents/Teste/GIT/Projetos/gitDiff/FirstImport/tdsFirstImport.txt"));

        Set<String> autores = new HashSet<String>();

        ArrayList<DateTime> days= new ArrayList();

        while ((linhaArq = tdsCommitTXT.readLine()) != null)  //o nome do arquivo com git log de cada arquivo de cada projeto
        {
            String arqRegistro = "";
            BufferedReader arqCommitTXT = null;
            //arqCommitTXT = new BufferedReader(new FileReader("/home/facom/Documents/Teste/GIT/Projetos/"+linhaArq)); // Exemplo: RxJava/10000.txt
            arqCommitTXT = new BufferedReader(new FileReader("/home/facom/Documents/Teste/GIT/Bibliotecas/"+linhaArq)); // Exemplo: RxJava/10000.txt


            //System.out.println(linhaArq);

            String[] nome = linhaArq.split("/"); // [0] projeto [1] arq com os log dos commits
            //obj.setProjeto(nome[0]);

            if( !("".equals(obj.getClasse())) ){


                obj.print(nome[0]);
                obj.setlifeTime(obj.lifeTime(days));

                //obj.firstImport(obj.getlifeTime,);
                //obj.setAvgData(obj.avgData(days));
                //System.out.println( linhaArq+","+obj.getClasse() +", " + obj.getlifeTime() + ", " + days.size());
                System.out.println( obj.getClasse() + ", " + obj.getlifeTime() + ", "  + days.size() +", "+ ( obj.getlifeTime() / days.size() ) +", "+ autores.size() +", " + ( obj.getlifeTime() / autores.size() ) + ", " + obj.avgData(days) ); // todas as informações

            }

            obj.setClasse("");
            days.clear();
            autores.clear();
            obj.setlifeTime(0);
            // obj.setAvgData(0);

            while ((arqRegistro = arqCommitTXT.readLine()) != null)  //cada commit de cada arquivo  ../RxJava/AbstractDirectTaskTest.txt
            {
                if( "".equals(obj.getClasse()) ) //mudou de arq
                {
                    obj.setClasse(arqRegistro); // ex: /home/facom/Documents/GIT/Bibliotecas/jdk7u-jdk/test/com/sun/jdi/RefTypes, pois com ponto dava problema
                }
                else
                {
                    String[] commit= arqRegistro.split(","); // 2d6a39c9b4880005f77f0771ec3a0013c1bd24be,akarnokd,2017-03-24 11:08:32 +0100
                    //System.out.println(arqRegistro);
                    //year=0;
                    if( !commit[1].isEmpty() ) {


                        int monthOfYear, dayOfYear, hourOfDay, minuteOfDay, secondOfDay = 0;
                        String autor="";
                        String[] data_iso, datap1, datap2;

                        if( commit.length <= 3 )
                        {
                            autor = commit[1]; //akarnokd
                            autores.add(autor);

                            data_iso = commit[2].split(" "); //2017-03-24 11:08:32 +0100
                        }
                        else //ff7d8b7a98c7e97a5f155e67557ed31a64708822,Mingyoo, Jung,2015-04-30 11:53:45 +0900
                        {
                            autor = commit[1]+" "+commit[2]; //akarnokd, odjasd --> akarnokd odjasd
                            autores.add(autor);

                            data_iso = commit[3].split(" "); //2017-03-24 11:08:32 +0100
                        }

                        datap1 = data_iso[0].split("-"); // 2017-03-24  datap1[0]=2017 datap1[1]=03 datap1[2]=24

                        datap2 = data_iso[1].split(":"); // 11:08:32   datap2[0]=11 datap2[1]=08 datap2[2]=32

                        year = Integer.parseInt(datap1[0]);
                        monthOfYear = Integer.parseInt(datap1[1]);
                        dayOfYear = Integer.parseInt(datap1[2]);
                        hourOfDay = Integer.parseInt(datap2[0]);
                        minuteOfDay = Integer.parseInt(datap2[1]);
                        secondOfDay = Integer.parseInt(datap2[2]);

                        if( year > 2017)
                            year = 2017;

                        if (monthOfYear > 12) {
                            monthOfYear = 12;
                        }

                        if (dayOfYear > 31) {
                            dayOfYear = 31;
                        }

                        if (hourOfDay > 23) {
                            hourOfDay = 23;
                        }

                        if (minuteOfDay > 59) {
                            minuteOfDay = 59;
                        }

                        if (secondOfDay > 59) {
                            secondOfDay = 59;
                        }

                        dt = obj.formarDate(data_iso, year, monthOfYear, dayOfYear, hourOfDay, minuteOfDay, secondOfDay, data_iso[2]);

                        days.add(dt);

                    }
                }


            }



        }

    }




}
