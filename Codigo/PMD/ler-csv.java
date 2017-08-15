/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package leiacvs;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

/**
 *
 * @author carollima
 */
public class LeiaCVS {

    /**
     * @param args the command line arguments
     */
    public static final void main(String[] args) {

    LeiaCVS obj = new LeiaCVS();
    obj.run();

  }

    private void run() {
        String arquivoCSV = "/home/carollima/Documentos/GIT/Teste/PMD/Projeto1/tudo.csv";
        BufferedReader br = null;
        String linha = " ";
        String csvDivisor = ",";
        int numero;
        int medV = 0;
        int medM = 0;

        try{
                br = new BufferedReader(new FileReader(arquivoCSV));

                while ((linha = br.readLine()) != null) {

                    String[] pais = linha.split(csvDivisor);
                    
                    if ("class".equals(pais[1]))
                    {
                        if(medV != 0 || medM != 0){
                            System.out.println("Class " + pais[0] + ", Media " + medV );
                            System.out.println("Class " + pais[0] + ", Media " + medM );
                            medV=0;
                            medM=0;
                        }

                        
                        System.out.println("Class " + pais[0] + ", Media " + pais[3] );
                    }
                    if ("variable".equals(pais[1])) 
                    {
                        numero = Integer.parseInt(pais[3]);
                        medV=medV+numero;
                    }
                    if ("method".equals(pais[1])) 
                    {
                        numero = Integer.parseInt(pais[3]);
                        medM=medM+numero;
                    }
                }
        }       

        catch (FileNotFoundException e) {
        } 
        catch (IOException e) {
        } 
        finally {
            if (br != null) {
                try {
                    br.close();
                } 
                catch (IOException e) {
                }
            }
        }
    }
        
        
        
}
   
