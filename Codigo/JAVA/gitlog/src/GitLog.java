/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintStream;
import java.util.ArrayList;

import org.joda.time.*;

/**
 *
 * @author facom
 */
public class GitLog {


    private String projeto;
    private String classe;
    private int numCommits;
    private long dayslifeTime;
    private double avgInDayBetween;


    public GitLog() {
        this.numCommits = 0;
        this.projeto = "";
        this.classe = "";
    }


    private String getProjeto() {
        return this.projeto;
    }

    public void printFirstLine()
    {
        //CK, Code Analyzer,PMD,Understand
        //sem a primeira coluna de todas
        //System.out.println( obj.getClasse() + ", " + obj.getlifeTime()/*Tempo do Projeto*/ + ", "  + days.size()/*numero de commits*/ +", "+ ( obj.getlifeTime() / days.size() ) +", "+ autores.size() +", " + ( obj.getlifeTime() / autores.size() ) + ", " + obj.avgData(days) ); // todas as informações
        System.out.println("Class, Lifetime, Number of Commits, Lifetime/NumCom , Number of Contributors, Lifetime/NumCont, Avg Between Days of Commits");
    }

    public void setClasse(String classe)
    {
        this.classe= classe;
    }

    public String getClasse()
    {
        return this.classe;
    }

    void print(String projeto) throws FileNotFoundException {

        PrintStream myPrintStream;

        /* Para Bibliotecas*/
        //File file  = new File("/home/facom/Documents/Teste/MetricasGIT - Commits/Tools/"+ projeto +".csv");
        File file  = new File("/home/facom/Documents/Teste/MetricasGIT-Commits/Bibliotecas/"+ "teste" +".csv");

        if(!file.exists()){
            //myPrintStream = new PrintStream("/home/facom/Documents/Teste/MetricasGIT - Commits/Tools/"+ projeto +".csv");
            myPrintStream = new PrintStream("/home/facom/Documents/Teste/MetricasGIT-Commits/Bibliotecas/"+ "teste" +".csv");
            ///home/facom/Documents/Teste/MetricasGIT - Commits/TESTE
            System.setOut(myPrintStream);
            printFirstLine();
        }

        /* Para Projetos

        File file  = new File("/home/facom/Documents/Teste/MetricasGIT - Commits/TESTE/"+ projeto +".csv");

        if(!file.exists()){
            myPrintStream = new PrintStream("/home/facom/Documents/Teste/MetricasGIT - Commits/TESTE/"+ projeto +".csv");
            System.setOut(myPrintStream);
            printFirstLine();
        }
        */
    }

    private void setNumCommits(int a) {
        this.numCommits= this.numCommits + 1;
    }

    public int getNumCommits() {
        return numCommits;
    }

    public int numDay(){
        return 1;
    }

    private void setProjeto(String string) {
        this.projeto = string;
    }

    long lifeTime(ArrayList<DateTime> days) {


        DateTime last = DateTime.now();
        DateTime aux;
        DateTime first;
        //DateTime last = DateTime.get(0); //qnt mais próximo do início do arq mais recente é o commit

        if( days.size() >= 1)
            first = days.get(days.size()-1); // qnt mais no final do arquivo mais antigo o commit
        else
            return 0;

        long count = 0;

        if (first.isAfter(last)) {
            aux = first;
            first = last;
            last = aux;
        }

        Interval interval = new Interval(first, last);

        Duration duration = interval.toDuration();

        count = duration.getStandardDays();

        return count;
    }

    double avgData(ArrayList<DateTime> days) {

        double media = 0;
        long  soma=0;
        int i = 0;
        DateTime last,first,aux;

        //Iterator<DateTime> daysAsIterador = days.iterator();

        if(days.size() == 1)
        {
            //setAvgData(0);
            media = 0;
        }
        if(days.size() == 2)
        {
            first = days.get(1);
            last = days.get(0);

            if(first.isAfter(last))
            {
                aux=first;
                first=last;
                last=aux;
            }

            Interval interval = new Interval(first,last);
            Duration duration = interval.toDuration();

            media = (double )duration.getStandardDays();
        }
        if(days.size() > 2)
        {
            while ( i+1 <=  days.size()-1 )
            {
                last = days.get(i);
                first = days.get(i+1);

                if(first.isAfter(last))
                {
                    aux=first;
                    first=last;
                    last=aux;
                }

                Interval interval = new Interval(first,last);
                Duration duration = interval.toDuration();
                //System.out.println("Duração :" + duration.getStandardDays());
                soma = soma + duration.getStandardDays();
                i++;
            }
            media = soma/days.size()-1 ;
            //System.out.println("i : " + i + ", Soma:" + soma + ", Days: " + days.size() + ", Media: " + media);
        }

        return media;
    }

    void setlifeTime(long time) {
        this.dayslifeTime = time;
    }

    long getlifeTime() {
        return this.dayslifeTime;
    }

    public DateTime formarDate(String[] data_iso, int year, int monthOfYear, int dayOfYear, int hourOfDay, int minuteOfDay, int secondOfDay, String s) {

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


