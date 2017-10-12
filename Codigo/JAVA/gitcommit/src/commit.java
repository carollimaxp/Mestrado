import org.joda.time.*;

import java.io.*;
import java.math.BigDecimal;
import java.util.ArrayList;


public class commit {


    public static void main(String[] args) throws FileNotFoundException, IOException {
        /*Abrir arq com nome das classes a serem procuradas*/

        commit obj = new commit();
        long emDias = 0;
        String linhaArq = "";
        ArrayList variosDias = new ArrayList<Long>();

        BufferedReader tdsCommitTXT = null;

        tdsCommitTXT = new BufferedReader(new FileReader("/home/facom/Resultados/pop&NaoPOP.txt")); //nome na ordem de pop
        //tdsCommitTXT = new BufferedReader(new FileReader("/home/facom/Documents/Teste/GIT/TESTE/gitDiff/FirstImport.txt"));  //arquivo com todos os .txt de todos os primeiros imports de cada API

        File resultado2 = new File("/home/facom/Resultados/resultado-M.csv"); // media, api
        FileWriter fw = new FileWriter(resultado2,true);

        File resultado1 = new File("/home/facom/Resultados/resultadoTB.csv");
        PrintStream arqC = new PrintStream(resultado1);
        System.setOut(arqC);
        System.out.println("Projeto, 1º Commit, 1ª C. Data, Path, Hash 1º Uso API, Data 1º Uso API, Tempo até 1º Uso, API");

        while ((linhaArq = tdsCommitTXT.readLine()) != null)  //o nome do arquivo com git log de cada arquivo de cada projeto
        {
            String linhaArqCommit = "";
            BufferedReader arqCommitTXT = null;
            String trocado = linhaArq.replace(".","-" );
            arqCommitTXT = new BufferedReader(new FileReader("/home/facom/Documents/Teste/GIT/Projetos/gitDiff/FirstImport/" + trocado +".txt"));
            variosDias.clear();
            String nomeAPI = "";
            long soma=0;

            while ( (linhaArqCommit = arqCommitTXT.readLine()) != null) {

                //retrofit, 0404ce4a2ef46e4ed9c5f06da6ebf862cc52253d, 11/Oct/2010, retrofit/retrofit/src/main/java/retrofit/http/Platform.java,
                // 365a0cd97bd8ee597e937ebf88170b30685047f4, 27/Feb/2013, android.os.Build

                String[] nome = linhaArqCommit.split(", ");

                if (nome.length == 7) {
                    emDias = obj.passarDay(nome[2], nome[5]);
                    System.out.println(nome[0] + ", " + nome[1] + ", " + nome[2] + ", " + nome[3] + ", " + nome[4]
                            + ", " + nome[5] + ", " + emDias + ", " + nome[6]);
                    variosDias.add(emDias);
                    soma = soma + emDias;
                    nomeAPI = nome[6];
                }
            }

            if( variosDias.size() == 0)
                fw.write("0, " + nomeAPI +"\n");
            if( variosDias.size() == 1)
                fw.write(soma + ", " + nomeAPI +"\n");
            else
                fw.write(soma/(variosDias.size()-1) +", " + nomeAPI +"\n");
        }
    }
/*
    private void mediaDiaAux(String nomeAPI) throws IOException {
        File resultado2 = new File("/home/facom/Documents/Teste/GIT/Projetos/gitDiff/FirstImport/resultado-Media.csv");
        FileWriter fw = new FileWriter(resultado2);
        fw.write("0, " + nomeAPI );
    }

    private void mediaDia(ArrayList variosDias, String nomeAPI) throws IOException {
        File resultado2 = new File("/home/facom/Documents/Teste/GIT/Projetos/gitDiff/FirstImport/resultado-Media.csv");
        FileWriter fw = new FileWriter(resultado2);
        fw.write(String.valueOf(somaDias(variosDias)) +", " + nomeAPI );

    }

    private BigDecimal somaDias(ArrayList<Long> dias) throws FileNotFoundException {

        BigDecimal soma = null;
        BigDecimal aux = null;


        for(int i=0; i < dias.size() ; i++){
            aux = BigDecimal.valueOf(dias.get(i));
            soma = soma.add(aux);
        }

        BigDecimal media = soma.divide(BigDecimal.valueOf(dias.size()-1));

        return media;

    }*/

    private long passarDay(String firstDay, String useDay) {


        String[] datap1 = firstDay.split("/"); // 27/Feb/2013
        String[] datap2 = useDay.split("/"); //  27/Feb/2013
        DateTime dt1,dt2;

        int year_fistDay = Integer.parseInt(datap1[2]);
        int month_fistDay = retornaMes(datap1[1]);
        int day_fistDay = Integer.parseInt(datap1[0]);

        int year_useDay = Integer.parseInt(datap2[2]);
        int month_useDay = retornaMes(datap2[1]);
        int day_useDay = Integer.parseInt(datap2[0]);

        dt1 = formarDate(year_fistDay,month_fistDay, day_fistDay,0,0,0,"+0300");
        dt2 = formarDate(year_useDay,month_useDay, day_useDay,0,0,0,"+0300");




        return lifeTime(dt1,dt2);

    }

    private int retornaMes(String s) {

        switch (s)
        {
            case "Jan":
                return 1;

            case "Feb":
                return 2;

            case "Mar":
                return 3;

            case "Apr":
                return 4;

            case "May":
                return 5;

            case "Jun":
                return 6;

            case "Jul":
                return 7;

            case "Aug":
                return 8;

            case "Sep":
                return 9;

            case "Oct":
                return 10;

            case "Nov":
                return 11;

            case "Dec":
                return 12;

            default:
                break;
        }
        return 0;
    }

    public long lifeTime(DateTime first, DateTime use) {

        long count=0;
        DateTime aux;

        if (first.isAfter(use)) {
            aux = first;
            first = use;
            use = aux;
        }

        Interval interval = new Interval(first, use);
        Duration duration = interval.toDuration();
        count = duration.getStandardDays();
        return count;
    }

    public DateTime formarDate(int year, int monthOfYear, int dayOfYear, int hourOfDay, int minuteOfDay, int secondOfDay, String s) {

        DateTimeZone dtz = DateTimeZone.forID(s);
        LocalDateTime ldt = new LocalDateTime(dtz)
                .withYear(year)
                .withMonthOfYear(monthOfYear)
                .withDayOfMonth(dayOfYear)
                .withHourOfDay(hourOfDay)
                .withMinuteOfHour(minuteOfDay)
                .withSecondOfMinute(secondOfDay);

        // this is just here to illustrate I'm solving the problem;
        // don't need in operational code
        try {
            DateTime myDateBorken = ldt.toDateTime(dtz);
        } catch (IllegalArgumentException iae) {
            System.out.println("Sure enough, invalid instant due to time zone offset transition!");
        }

        if (dtz.isLocalDateTimeGap(ldt)) {
            ldt = ldt.withHourOfDay(1);
        }

        DateTime myDate = ldt.toDateTime(dtz);

        return myDate;
    }

}
