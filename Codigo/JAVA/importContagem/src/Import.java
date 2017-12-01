
import org.joda.time.*;

import java.io.*;
import java.text.NumberFormat;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class Import {

    double porcentagemdeUso;
    double mediadeDias;
    double mediadeDiasparaImportar;
    double medianavalue;
    double porcentagemvalue;
    int contador = 0;
    String NomeAPI;
    private double soma,somaP = 0;

    ArrayList dias;



    DateTime primeiroCommit,primeiroUso, ultimoCommit;
    private double diasImport;

    public Import() {

    }


    public void setPrimeiroUso(String primeiro) {
        this.primeiroUso = convertDay(primeiro);
    }

    public void setPrimeiroCommit(String primeiro) {
        this.primeiroCommit = convertDay(primeiro);
    }

    public void setUltimoCommit(String ultimo) {
        this.ultimoCommit = convertDay(ultimo);
    }

    public DateTime getUltimoCommit() {
        return this.ultimoCommit;
    }

    public DateTime getPrimeiroUso() {
        return this.primeiroUso;
    }

    public DateTime getPrimeiroCommit() {
        return this.primeiroCommit;
    }

    public void setNomeAPI(String API) {
        this.NomeAPI = API;
    }

    public void setPorcentagemvalue(double value){ this.porcentagemvalue = value;}

    public double getPorcentagemvalue() { return this.porcentagemvalue; }

    public String getNomeAPI() {
        return this.NomeAPI;
    }

    public void setSomaDiasImport(DateTime dt1, DateTime dt2) {
        double a = 0;

        setDias(conversaoParaDias(dt1,dt2));
        setSoma(getSoma() + getDias());
    }

    public double getDias() {
        return this.diasImport;
    }

    public void setDias(double v) {
        this.diasImport = v;
    }


    public double getSoma() {
        return soma;
    }

    public void setSoma(double soma) {
        this.soma = soma;
    }


    public int getContador() {
        return this.contador;
    }

    public void setContador(int i) {
        if ( i == 0)
            this.contador = 0;
        else
            this.contador++;
    }

    public void setSomaP(double somaP) {
        this.somaP = somaP;
    }

    public double getSomaP() {
        return somaP;
    }

    public double getMediana() {
        return this.medianavalue;
    }

    public double getMedianavalue() {
        return this.medianavalue;
    }

    public void setMedianavalue(double value) {
        this.medianavalue = value;
    }

    public void setSomaPorcentagem(DateTime primeiroCommit, DateTime ultimoCommit) throws ParseException {
        double aux = conversaoParaDias(primeiroCommit,ultimoCommit); //lifetime

        setPorcentagemvalue(getDias()/aux);

        setSomaP(getSomaP() + getPorcentagemvalue());
    }

    public double getMediadeDiasparaImportar() throws ParseException {
        NumberFormat formato = NumberFormat.getInstance();
        formato.setMaximumFractionDigits(2);

        String a = formato.format( getSoma()/getContador()); //media em dias do primeiro uso da API
        Double b = formato.parse(a).doubleValue();

        return b;
    }

    public double getMediaPorcentagem() throws ParseException {

        NumberFormat formato = NumberFormat.getInstance();
        formato.setMaximumFractionDigits(2);

        String a = formato.format( (double) getSomaP()/getContador()); //media das porcentagens
        Double b = formato.parse(a).doubleValue();

        return b;
    }

    public double conversaoParaDias(DateTime dt1, DateTime dt2) {

        long count=0;
        DateTime aux;

        if (dt1.isAfter(dt2)) {
            aux = dt1;
            dt1 = dt2;
            dt2 = aux;
        }

        Interval interval = new Interval(dt1, dt2);
        Duration duration = interval.toDuration();
        count = duration.getStandardDays();
        return (double) count;
    }

    private DateTime convertDay(String data) {

        String[] datap1 = data.split("/"); // 27/Feb/2013
        int year_fistDay = Integer.parseInt(datap1[2]);
        int month_fistDay = retornaMes(datap1[1]);
        int day_fistDay = Integer.parseInt(datap1[0]);

        DateTime dt1 = formarDate(year_fistDay,month_fistDay, day_fistDay,0,0,0,"+0300");

        return dt1;
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

    public void ultimoCommit(String s) throws IOException {

        BufferedReader projectName = null;
        projectName = new BufferedReader(new FileReader("/home/facom/Documents/Teste/GIT/ultimoCommit.txt"));
        String ultimoCommit;

        //500px-android-blur/app/src/main/java/com/fivehundredpx/blurdemo/MainActivity.java,
        // 9533327b44dae5baa0e133a9844b8eea204e41b9,
        // 17, Mar, 2015,
        // android.animation.Animator

        String linhaArq = "";

        while ((linhaArq = projectName.readLine()) != null)  //o nome do arquivo com git log de cada arquivo de cada projeto
        {
            String[] nome = linhaArq.split(",");
            String[] projeto = nome[0].split("/");

            if( s == projeto[0]) {
                ultimoCommit = nome[2] + "/" + nome[3] + "/" + nome[4];
                //System.out.println(ultimoCommit);
                setUltimoCommit(ultimoCommit);
            }
        }
    }

    public void setMediana(ArrayList diasImport) throws ParseException {

        ArrayList auxList = diasImport;
        Collections.sort(auxList);

        int length = auxList.size();
        int middle = length/2;

        //System.out.println(auxList);

        if ( length % 2 == 0)
        {
            double left = (Double) auxList.get(middle - 1);
            double right = (Double) auxList.get(middle - 1);
            setMedianavalue((left + right) / 2);
        }
        else
        {
            setMedianavalue((Double) auxList.get(middle));
        }


        NumberFormat formato = NumberFormat.getInstance();
        formato.setMaximumFractionDigits(3);

        String a1 = formato.format( getMedianavalue() );  //media das porcentagens
        Double b = formato.parse(a1).doubleValue();

        setMedianavalue(b);
    }

    public void print() throws IOException {

        File resultado1 = new File("/home/facom/Resultados/TOP_imports.csv");
        //File resultado1 = new File("/home/facom/Resultados/INTER_imports.csv");
        //File resultado1 = new File("/home/facom/Resultados/BOTTOM_imports.csv");
        //File resultado1 = new File("/home/facom/Resultados/TOP_parcial.txt");
        PrintStream arqC = new PrintStream(resultado1);
        System.setOut(arqC);

        System.out.println("api,avg,median,per,median_per,group");
    }

    public String getCaminhoApiName(){
        return "/home/facom/Documents/Teste/GIT/Projetos/gitDiff/FirstImport/TOP/";
        //return "/home/facom/Documents/Teste/GIT/Projetos/gitDiff/FirstImport/INTER/";
        //return "/home/facom/Documents/Teste/GIT/Projetos/gitDiff/FirstImport/BOTTOM/";
    }

    public void printResultado(double medianaI, double mediaanaP) throws ParseException {
        System.out.println( getNomeAPI() + /*", " + name.getSoma() +*/ "," +  getMediadeDiasparaImportar() + ","
                + medianaI + "," + getMediaPorcentagem() + "," + mediaanaP + ",TOP" /*TOP,INTER, BOTTOM*/ );
    }

    public File getProject() throws FileNotFoundException {
        File arq = new File("/home/facom/Documents/Teste/GIT/Projetos/gitDiff/FirstImport/top_filtrado.txt");
        //File arq = new File("/home/facom/Documents/Teste/GIT/Projetos/gitDiff/FirstImport/inter_filtrado.txt");
        //File arq = new File("/home/facom/Documents/Teste/GIT/Projetos/gitDiff/FirstImport/bottom_filtrado.txt");
        return arq;
    }
}
