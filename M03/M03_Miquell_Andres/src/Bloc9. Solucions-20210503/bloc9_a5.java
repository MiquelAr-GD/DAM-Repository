package Bloc9;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.FileReader;
import java.io.FileWriter;

public class bloc9_a5 {

    public static void main(String a[]) {
        String filename = "/home/vlino/Dropbox/java_15_16/Programacio UF3/src/InputOutput/perFerProves.txt";
        String strLine = "";
        String[] alumnes = {"Manuel", "Maria", "Juan", "Lucia", "Pedro"};
        try {
            BufferedWriter fw = new BufferedWriter(new FileWriter(filename));

            // Escrivim
            for (String alum : alumnes) {
                fw.write(alum + "\n");
            }
            fw.close();

            // Llegim
            BufferedReader br = new BufferedReader(new FileReader(filename));
            //read the file content
            int compta = 0;
            strLine = br.readLine();
            while (strLine != null) {
                compta += strLine.length();
                strLine = br.readLine();
            }
            br.close(); // El podria obviar per poder-lo utilitzar després

            System.out.println("Aquest fitxer conté " + compta + " lletres.");

        } catch (IOException ioe) {
            System.err.println("IOException: " + ioe.getMessage());
        }
    }

}
