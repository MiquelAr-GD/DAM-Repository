package Bloc9;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.FileReader;
import java.io.FileWriter;

public class bloc9_a4 {

    public static void main(String a[]) {
        String filename = "/home/vlino/Dropbox/java_15_16/Programacio UF3/src/InputOutput/perFerProves.txt";
        String filename2 = "/home/vlino/Dropbox/java_15_16/Programacio UF3/src/InputOutput/perFerProves2.txt";
        String strLine = "";
        String[] alumnes = {"Manuel","Maria","Juan","Lucia","Pedro"};
        try {
            BufferedWriter fw = new BufferedWriter(new FileWriter(filename));
            BufferedWriter fw2 = new BufferedWriter(new FileWriter(filename2));

            // Escrivim
            for (String alum:alumnes){
                fw.write(alum + "\n");
            }
            fw.close();
            
            // Llegim
            BufferedReader br = new BufferedReader(new FileReader(filename));
            //read the file content
            strLine = br.readLine();
            while (strLine != null) {
                fw2.write(inverteix(strLine) + "\n");                
                strLine = br.readLine();
            }
            fw2.close(); 
            br.close(); // El podria obviar per poder-lo utilitzar després
            
            System.out.println("*************");
            

            // Llegim
            br = new BufferedReader(new FileReader(filename2));
            
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
    
 public static String inverteix (String ordenat){
     String cadena = "";
     
     char[] cadenaChar = ordenat.toCharArray();
     int longitud = cadenaChar.length;
     
     
     
     return cadena;
 }
}
