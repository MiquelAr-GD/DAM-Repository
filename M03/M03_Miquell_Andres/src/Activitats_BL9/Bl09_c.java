/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Activitats_BL9;

import java.io.*;

/**
 *
 * @author MiquelA
 */
public class Bl09_c {

    public static void main(String[] args) {
        String ruta = "C:\\Users\\MiquelA\\Documents\\NetBeansProjects\\FilesTry";
        String[][] dades = new String[7][];
        File arxiu = new File(ruta + "\\Bl09_c.txt");
        llegirFitxer(arxiu, dades);
        ferMijana(dades);
    }

    private static void llegirFitxer(File arxiu, String[][] dades) {
        try {
            int i = 0;
            BufferedReader entrada = new BufferedReader(new FileReader(arxiu));
            String contingut = entrada.readLine();
            while (contingut != null) {
                System.out.println(contingut);
                dades[i] = contingut.split(":");
                i++;
                if (i == 7) {
                    System.out.println(contingut);
                    break;
                }
            contingut = entrada.readLine();

            }
            entrada.close();
        } catch (FileNotFoundException a) {
            System.out.println(a);
        } catch (IOException e) {
            System.out.println(e);
        }
    }

    private static void ferMijana(String[][] dades) {
        int sum = 0;
        for (int i = 0; i < dades.length; i++) {
            dades[i][3] = dades[i][3].substring(1, dades[i][3].length());
            sum = sum + Integer.parseInt(dades[i][3]);
        }
        System.out.println("La mitjana de sous es: " + sum / dades.length);
    }
}
