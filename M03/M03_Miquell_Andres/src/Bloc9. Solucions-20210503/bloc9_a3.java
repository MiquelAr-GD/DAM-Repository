package Bloc9;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.FileReader;
import java.io.FileWriter;

public class bloc9_a3 {

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
            // Llegim
            BufferedReader br = new BufferedReader(new FileReader(filename));
            //read the file content
            strLine = br.readLine();
            String[] noms = new String[6];
            int index = 0;
            while (strLine != null) {
                noms[index] = strLine;
                index++;
                strLine = br.readLine();
            }
            br.close(); // El podria obviar per poder-lo utilitzar després
            System.out.println("*************");
            
            BufferedWriter fw2 = new BufferedWriter(new FileWriter(filename, true));
            for ( int i = index-1 ; i >= 0  ; i-- ){
                fw2.write(noms[i] + "\n");
            }
            fw2.close();            
            
            // Llegim
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
