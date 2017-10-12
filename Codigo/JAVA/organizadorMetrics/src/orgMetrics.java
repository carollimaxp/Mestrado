import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintStream;
import java.text.DecimalFormat;

public class orgMetrics {

    /**
     * @param args the command line arguments
     */
    private String classe;
    private String linhaM;
    private int lifetime;


    public static void main(String[] args) throws IOException {
        orgMetrics obj = new orgMetrics();

        /*Abrir arq com nome das classes a serem procuradas*/
        BufferedReader nomeClasse = null;
        String linhaClasse = "";
        //String pop="/home/facom/Resultados/TOP.txt";
        //nomeClasse = new BufferedReader(new FileReader("/home/facom/Documents/classe.txt"));
        nomeClasse = new BufferedReader(new FileReader("/home/facom/Resultados/INTER.csv"));

        /*Abrir o CSV para procurar a classe a ser procurada*/

        String arquivoCSV = "/home/facom/Documents/Teste/csv.txt";

        String linhaNomeCSV = "";
        String linha = "";
        String linhaG= "";
        String linhaCk= "";
        String linhaU= "";
        String linhaCode = "";
        String linhaResultado="";
        int code = 0;
        int ck = 0;
        int under = 0;
        int git = 0;
        int indentificador = 0;


        /*Pegar tudo que será impresso no terminal*/
        PrintStream myPrintStream;
        myPrintStream = new PrintStream("/home/facom/Documents/Teste/Metricas/Code.csv");

        System.setOut(myPrintStream); //manda para o arquivo Resultado.csv

        obj.printFirstLine();

        while ((linhaClasse = nomeClasse.readLine()) != null)  //interação nos nomes das classes
        {
            String[] nomeAPI = linhaClasse.split(",");

            //System.out.println(nomeAPI[1]); //imprime a classe

            obj.setClasse(nomeAPI[1]);
            //System.out.println(obj.getClasse() + ", "); //imprime a classe
            indentificador++;

            BufferedReader nomeCSV = null;
            nomeCSV = new BufferedReader(new FileReader(arquivoCSV));

            while ((linhaNomeCSV = nomeCSV.readLine()) != null) //interação no nome dos csv
            {
                BufferedReader br = null;

                String[] nome1 = linhaNomeCSV.split("/");     // FILTRADO/*.csv

                String[] nome = nome1[1].split("-");

                //System.out.println("Nome: " + nome[0]);

                br = new BufferedReader(new FileReader("/home/facom/Documents/Teste/" + linhaNomeCSV)); //pega cada linha do csv
                ck = 0 ;
                under = 0 ;
                code = 0;
                git=0;

                while ((linha = br.readLine()) != null) //entra no CSV
                {
                    String[] parte_classe = linha.split(","); // cada linha do csv

                    //String[] nomeGit = nome[0].split("-"); // MetricasGIT - Commits

                    switch (nome[0]){
                        case "ck":

                            if (obj.comparacao( obj.getClasse(), parte_classe[0]) ) //verifica se é a classe desejada
                            {
                                //linhaCk = obj.ckMetricas(parte_classe);
                                //System.out.println("Class, CBO, WMC, DIT, NOC, RFC, LCOM, NOM, NOPM, NOSM, NOF, NOPF, NOSF, NOSI, LOC");
                                System.out.println(linha);
                                linhaResultado = obj.getClasse() + ", " + linhaCk;

                                break;
                            }
                            break;

                        case "under":
                            if (obj.comparacao(obj.getClasse(), parte_classe[1]) ) //verifica se é a classe desejada
                            {
                                linhaU = obj.undMetricas(parte_classe);
                                //System.out.println("AvgCyclomatic, AvgCyclomaticModified, AvgCyclomaticStrict, AvgEssential, AvgLine, AvgLineBlank, AvgLineCode, AvgLineComment, CountClassBase, CountClassCoupled, CountClassDerived, CountDeclClassMethod, CountDeclClassVariable , CountDeclInstanceMethod, CountDeclInstanceVariable, CountDeclMethod , CountDeclMethodAll , CountDeclMethodDefault, CountDeclMethodPrivate , CountDeclMethodProtected, CountDeclMethodPublic, CountInput, CountLine, CountLineBlank, CountLineCode, CountLineCodeDecl, CountLineCodeExe ,CountLineComment, CountSemicolon, CountStmt, CountStmtDecl, CountStmtExe, MaxCyclomatic, MaxCyclomaticModified, MaxCyclomaticStrict, MaxEssential, MaxInheritanceTree, MaxNesting , PercentLackCohesion , RatioCommentToCode ,SumCyclomatic, SumCyclomaticModified, SumCyclomaticStrict, SumEssential");
                                //System.out.println("Linha Under, " + linhaU);
                                //System.out.println(linhaU);
                                linhaResultado = linhaResultado + linhaU;

                                break;
                            }
                            break;

                        case "code":
                            if (obj.comparacao( obj.getClasse(), parte_classe[0]) )
                            {
                                //System.out.println(linha);
                                linhaCode = obj.codeMetricas(parte_classe);
                                //System.out.println("Lines, AVG Len, Code, Comments, White SP, Cd/Cm+WS, Cd/Cm, Cd/WS, % Code, Cd/File, Cm/File, WS/File");
                                //System.out.println("Linha Code, " + linhaCode);
                                System.out.println(obj.getClasse() +" ,"+linhaCode);


                                linhaResultado = linhaResultado + linhaCode;
                                break;
                            }
                            break;

                        case "git": // MetricasGIT - Commits
                            if (obj.comparacao( obj.getClasse(), parte_classe[0]) ) //verifica se é a classe desejada
                            {
                                //git =1;
                                linhaG = obj.gitMetricas(parte_classe);
                                //System.out.println("Lifetime, Number of Commits, Lifetime/NumCom , Number of Contributors, Lifetime/NumCont, Avg Between Days of Commits");
                                //System.out.println("Linha GIT, " + linhaG);
                                System.out.println(linha);
                                //linhaResultado = linhaResultado + linhaG;
                                break;
                            }
                            break;

                        default:
                            break;

                    }
                }

            }

            String last_classe = tamanhoClasse(obj.getClasse());
            /*
            if( linhaCk.isEmpty())
                linhaCk = ",,,,,,,,,,,,,,,";*/
            if( linhaCode.isEmpty())
                linhaCode = ",,,,,,,,,,,,";/*
            if( linhaG.isEmpty())
                linhaG = ",,,,,,";*/

            //System.out.println( "Top," + obj.getClasse() + ", " + last_classe.length() + ", " + linhaCk + linhaCode + linhaG + linhaU);

             linhaG= "";
             linhaCk= "";
             linhaU= "";
             linhaCode = "";
        }

    }

    private static String tamanhoClasse(String classe) {

        String[] parte_classe = classe.split("[.]");

        return parte_classe[parte_classe.length-1];
    }

    public void printFirstLine() {
        //CK, Code Analyzer,PMD,Understand
        //sem a primeira coluna de todas
        System.out.println("Class,Lines, AVG Len, Code, Comments, White SP, Cd/Cm+WS, Cd/Cm, Cd/WS, Cd/Lines, % Code, Cm/Lines, WS/lines");
        //CK, CodeAnalyzer, GIT, PMD, Understand
        //CK, CodeAnalyzer, GIT, Understand
        //System.out.println("Popularity, Class, Avg Class Name Size, type, CBO, WMC, DIT, NOC, RFC, LCOM, NOM, NOPM, NOSM, NOF, NOPF, NOSF, NOSI, LOC, Lines, AVG Len, Code, Comments, White SP, Cd/Cm+WS, Cd/Cm, Cd/WS, % Code, Cd/File, Cm/File, WS/File, Lifetime, Number of Commits, Lifetime/NumCom, Number of Contributors, Lifetime/NumCont, Avg Between Days of Commits, AvgCyclomatic, AvgCyclomaticModified, AvgCyclomaticStrict, AvgEssential, AvgLine, AvgLineBlank,AvgLineCode,AvgLineComment,CountClassBase,CountClassCoupled,CountClassDerived,CountDeclClass,CountDeclClassMethod,CountDeclClassVariable,CountDeclFile,CountDeclFunction,CountDeclInstanceMethod,CountDeclInstanceVariable,CountDeclMethod,CountDeclMethodAll,CountDeclMethodDefault,CountDeclMethodPrivate,CountDeclMethodProtected,CountDeclMethodPublic,CountInput,CountLine,CountLineBlank,CountLineCode,CountLineCodeDecl,CountLineCodeExe,CountLineComment,CountOutput,CountPath,CountPathLog,CountSemicolon,CountStmt,CountStmtDecl,CountStmtExe,Cyclomatic,CyclomaticModified,CyclomaticStrict,Essential,Knots,MaxCyclomatic,MaxCyclomaticModified,MaxCyclomaticStrict,MaxEssential,MaxEssentialKnots,MaxInheritanceTree,MaxNesting,MinEssentialKnots,PercentLackOfCohesion,RatioCommentToCode,SumCyclomatic,SumCyclomaticModified,SumCyclomaticStrict,SumEssential");
        //System.out.println("Class, CBO, WMC, DIT, NOC, RFC, LCOM, NOM, NOPM, NOSM, NOF, NOPF, NOSF, NOSI, LOC, Lines, AVG Len, Code, Comments, White SP, Cd/Cm+WS, Cd/Cm, Cd/WS, % Code, Cd/File, Cm/File, WS/File, Lifetime, Number of Commits, Lifetime/NumCom , Number of Contributors, Lifetime/NumCont, Avg Between Days of Commits, Med de Class, Med de Met, Med de Variavel, AvgCyclomatic, AvgCyclomaticModified, AvgCyclomaticStrict, AvgEssential, AvgLine, AvgLineBlank, AvgLineCode, AvgLineComment, CountClassBase, CountClassCoupled, CountClassDerived, CountDeclClassMethod, CountDeclClassVariable , CountDeclInstanceMethod, CountDeclInstanceVariable, CountDeclMethod , CountDeclMethodAll , CountDeclMethodDefault, CountDeclMethodPrivate , CountDeclMethodProtected, CountDeclMethodPublic, CountInput, CountLine, CountLineBlank, CountLineCode, CountLineCodeDecl, CountLineCodeExe ,CountLineComment, CountSemicolon, CountStmt, CountStmtDecl, CountStmtExe, MaxCyclomatic, MaxCyclomaticModified, MaxCyclomaticStrict, MaxEssential, MaxInheritanceTree, MaxNesting , PercentLackCohesion , RatioCommentToCode ,SumCyclomatic, SumCyclomaticModified, SumCyclomaticStrict, SumEssential");
    }

    public void setClasse(String classe) {
        this.classe = classe;
    }

    public String getClasse() {
        return this.classe;
    }

    private String ckMetricas(String[] pais) {
        //POSIÇÃO 2
        String linha = "";
        for (int i = 3; i < 17 ; i++)
            linha = linha + pais[i] + ", ";

        return linha;
    }

    private String codeMetricas(String[] pais) {

        String linha = "";

        for (int i = 2; i < 7 ; i++)
                linha = linha + pais[i] + ", ";

        String continua = continuacao(pais);
        linha = linha + continua;

        return linha;
    }

    private String continuacao(String[] pais) {

        String linha;
        int i;
        float[] value = new float[pais.length];

        for ( i=2; i < 7 ; i++ ) {
            value[i] = Integer.parseInt(pais[i]);
            if (value[i] == 0)
                value[i]=1;
        }
        /*
        * 2 - Lines of the File
        * 3 - Avg Len
        * 4 - Lines of Code
        * 5 - Comments
        * 6 - White SP
        * */

        float aux = value[4]/(value[5]+value[6]); // cd/cm+ws
        float aux1 = value[4]/(value[5] ); // cd/cm
        float aux2 = value[4]/(value[6] ); // cd/ws

        float aux4 = value[4]/(value[2]); // cd/lines
        float aux3 = aux4/100 ; // %cd
        aux4 = aux3 * 100;

        float aux5 = value[5]/(value[2]); // cm/lines
        float aux6 = value[6]/(value[2]) ;// ws/lines

        DecimalFormat dt = new DecimalFormat("0.00");



        linha =  troca(dt.format(aux)) + ", " + troca(dt.format(aux1)) + ", " + troca(dt.format(aux2)) + ", " +
                troca(dt.format(aux3)) + ", " + troca(dt.format(aux4)) + ", " + troca(dt.format(aux5)) + ", " + troca(dt.format(aux6))  ;

        //System.out.println("Linha:" + linha);

        return linha;
    }

    private String troca(String format) {
        String[] a;
        String b;

        a = format.split(",");
        b = a[0]+"."+a[1];

        return b;
    }


    private String pmdMetricas(String[] linha) {

        String umalinha = "";
        for (int i = 1; i < 4; i++) {
            umalinha = umalinha + linha[i] + ", ";
        }

        return umalinha;
    }

    private String undMetricas(String[] linha) {
        String umalinha = "";

        for (int k = 2; k < linha.length ; k++)
                umalinha = umalinha + linha[k] + ", ";

        return umalinha;
    }

    private boolean comparacao(String a, String b) {

        String[] classe_pnt = a.split("[.]");
        String[] classe_barra = b.split("/");

        if (classe_barra.length == 1) {
            String[] classe_barra_aux = b.split("[.]");
            classe_barra = classe_barra_aux;
        }

        int i = classe_pnt.length - 1; // classe procurada
        int j = classe_barra.length - 1; // tam da classe à ser comparada

        String[] ultimo = classe_barra[j].split("[.]");

        if( j < i)
            return false;

        Boolean vdd = true;
        /*
        if(! (classe_barra[j].equals(classe_pnt[i]) || (classe_barra[j]+".java").equals(classe_pnt[i])))
            return false;*/

        if ( ultimo.length == 2) {
            classe_barra[j] = ultimo[0];
        }

        while ( i >= 0 ){
            if ( classe_barra[j].equals(classe_pnt[i]))
                vdd = true;
            else
                return false;
            i--;
            j--;
        }

        //System.out.println("****" + a + ", " + b );
        return vdd;
    }

    private String gitMetricas(String[] linha) {
        String umalinha = "";

        for (int k = 1; k < 7; k++)
            umalinha = umalinha + linha[k] + ", ";

        //setLifetime(linha[1]);

        //umalinha = umalinha + ", " +  linha[6];

        return umalinha;
    }

    private void setLifetime(String life) {
        lifetime =  Integer.parseInt(life);
    }
}
