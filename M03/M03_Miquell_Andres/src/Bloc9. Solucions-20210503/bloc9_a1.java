package Bloc9;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.FileReader;
import java.io.FileWriter;

public class bloc9_a1 {

    public static void main(String a[]) {
        String filename = "C:\\Users\\MiquelA\\Documents\\NetBeansProjects\\FilesTry\\perFerProves.txt";
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
            while (strLine != null) {
                
                System.out.println(strLine);
                strLine = br.readLine();
            }
            br.close(); // El podria obviar per poder-lo utilitzar després
            
            System.out.println("*************");
            
            BufferedWriter fw2 = new BufferedWriter(new FileWriter(filename, true));
            // Escrivim
            fw2.write("Alicia");
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
