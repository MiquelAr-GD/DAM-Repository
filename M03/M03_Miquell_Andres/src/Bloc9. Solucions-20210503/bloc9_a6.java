package Bloc9;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.Arrays;

public class bloc9_a6 {

    public static void main(String a[]) {
        String filename = "/home/vlino/Dropbox/java_15_16/Programacio UF3/src/InputOutput/perFerProves.txt";
        String strLine = "";
        String[] alumnes = {"Manuel","Maria","Juan","Lucia","Pedro"};
        try {
            BufferedWriter fw = new BufferedWriter(new FileWriter(filename));
            // Escrivim
            for (String alum:alumnes){
                fw.write(alum + "\n");
            }
            fw.close();
            
            // Llegim i desem en un array
            String[] vector = new String[5];
            BufferedReader br = new BufferedReader(new FileReader(filename));
            //read the file content
            strLine = br.readLine();
            int i = 0;
            while (strLine != null) {
                vector[i] = strLine;                
                i++;
                strLine = br.readLine();
            }
            br.close(); // El podria obviar per poder-lo utilitzar després
            
            System.out.println("*************");
            
            // Ordenem l'array
            Arrays.sort(vector);
            
            // Ho tornem a escriure
            fw = new BufferedWriter(new FileWriter(filename));
            // Escrivim
            for (String alum:vector){
                fw.write(alum + "\n");
            }
            fw.close();            
            
            //Ho tornem a llegir per mostrar
            br = new BufferedReader(new FileReader(filename));
            strLine = br.readLine();
            while (strLine != null) {
                
                System.out.println(strLine);
                strLine = br.readLine();
            }
            br.close();            
            
        } catch (IOException ioe) {
            System.err.println("IOException: " + ioe.getMessage());
        } 
    }
    

}
