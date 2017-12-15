/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package leiacvs;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintStream;
import java.text.DecimalFormat;

/**
 *
 * @author carollima
 */
public class LeiaCVS 
{
    /**
     * @param args the command line arguments
     */
    private String nome; //nome da classe 
    
    public static void main(String[] args) throws IOException 
    {
        String arquivo="/home/facom/Documents/Teste/PMD/Tools/tudo.txt";

        br = new BufferedReader(new FileReader(arquivo));
        while ((linha = br.readLine()) != null) {
            String[] pais = linha.split("."); //jdk7u-jdk.txt

            LeiaCVS obj = new LeiaCVS();
            obj.run(pais[0]); //jdk7u-jdk
        }
    }
    private float medClass;

    private void run(String pathDoCSV) throws IOException
    {
        String dir="/home/facom/Documents/Teste/PMD/";
        File arq = new File(dir + pathDoCSV + ".csv");
        arq.createNewFile();
        PrintStream myPrintStream; 
        myPrintStream = new PrintStream(arq);
        
        System.setOut(myPrintStream);
        
        String arquivoCSV = dir + "tudo.csv";
        BufferedReader br = null;
        String linha = "";
        //String csvDivisor = ",";
        
        
        float numero=0;
        int contV=0;
        int contM=0;
        float medV = 0;
        float medM = 0;
        
        
            br = new BufferedReader(new FileReader(arquivoCSV));
            while ((linha = br.readLine()) != null) 
            {
                String[] pais = linha.split(",");
                
               // String a = ;
                
                numero = Float.parseFloat(pais[3]);

                if (" class".equals(pais[1]))
                {
                       if(medM != 0 && medV != 0 )
                       {
                            System.out.printf(getPai() + ", " + getMedClass() + ", "+ doMedia(medM,contM) + ", "+ doMedia(medV,contV) + "\n" );
                            setPai(pais[0]);
                            setMedClass(0);
                            medV=0;
                            medM=0;
                            contV=0;
                            contM=0;
                       }
                    setPai(pais[0]);
                    setMedClass(numero);

                }
                if ("variable".equals(pais[1])) 
                {
                    medV= doSoma(medV, numero);
                    setPai(pais[0]);
                    contV=contV+1;
                }
                if ("method".equals(pais[1])) 
                {                 
                    medM= doSoma(medM, numero);                 
                    contM=contM+1;
                }
            }    
            
            System.out.printf(getPai() + ", " + getMedClass() + ", "+ doMedia(medM,contM) + ", "+ doMedia(medV,contV) + "\n" );
    } 
    
    private void setPai(String pai) {
        this.nome=pai;
    }
    private String getPai() {
        return this.nome;
    }
    
    private void setMedClass(float a)
    {        
        this.medClass = a;
    } 
    
    private float getMedClass()
    {
        return this.medClass;
    }
    
    private float doSoma(float valor, float num) {
         float soma=valor+num;
         return soma;
    } 
    
    private double doMedia(float valor, float num) {
        double a=valor;
        double b=num;
        double media = a/b;
        
        DecimalFormat df = new DecimalFormat("0.##");
        String dx = df.format(media);
        
        double result = Double.parseDouble(dx.replace(',', '.'));
        return result;
        /*
        if(num == 0)
            return a;
        else
        {
            String entrada = ""+media; 
            
        } */      
    } 
       
 
}
   
