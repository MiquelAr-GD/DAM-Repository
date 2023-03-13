package Bloc9;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.Arrays;
import java.util.Scanner;

public class bloc9_b {

    public static void main(String a[]) {
        Scanner in = new Scanner(System.in);
        String filename = "/home/vlino/Dropbox/java_15_16/Programacio UF3/src/InputOutput/perFerProves.txt";
        String strLine = "";
        int valor;

        try {
            BufferedWriter fw = new BufferedWriter(new FileWriter(filename));
            System.out.println("Indica un valor. 0 per finalitzar..");
            valor = in.nextInt();
            while (valor != 0) {
                fw.write(valor + "\n");
                System.out.println("Indica un valor. 0 per finalitzar..");
                valor = in.nextInt();
            }
            fw.close();

            // Llegim
            BufferedReader br = new BufferedReader(new FileReader(filename));
            //read the file content
            strLine = br.readLine();
            float suma = 0, comptador = 0;
            while (strLine != null) {
                System.out.println("\n  >>> " + strLine);
                suma = suma + Float.parseFloat(strLine);
                comptador++;
                strLine = br.readLine();
                
            }
            br.close(); 
            System.out.println("La mitjana és " + (suma/comptador));

        } catch (IOException ioe) {
            System.err.println("IOException: " + ioe.getMessage());
        }
    }

}
