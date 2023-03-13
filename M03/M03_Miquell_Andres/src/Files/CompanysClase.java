/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Files;

import java.io.*;
import java.util.Scanner;

/**
 *
 * @author MiquelA
 */
public class CompanysClase {

    public static void main(String[] args) {
        try {
            String ruta = "C:\\Users\\MiquelA\\Documents\\NetBeansProjects\\M03_Miquell_Andres\\Files";
            String noms = "Lucas, Miquel, Raimon, Pau, Xavi, Anna, Mairen, Angel, Victor, Hector, Brian, Diego";
            File arxiu = new File(ruta + "\\arxiu.txt");
            arxiu.createNewFile();
            escriureFitxer(arxiu, noms);
            llegirFitxer(arxiu);
            afegirAlumne(arxiu, noms);
        } catch (IOException e) {
            System.out.println(e);
        }
    }

    private static void escriureFitxer(File arxiu, String noms) {
        try {
            BufferedWriter entrada = new BufferedWriter(new FileWriter(arxiu));
            entrada.write(noms);
            entrada.close();
        } catch (IOException e) {
            System.out.println(e);
        }
    }

    private static void llegirFitxer(File arxiu) {
        try {
            BufferedReader entrada = new BufferedReader(new FileReader(arxiu));
            String contingut = entrada.readLine();
            while (contingut != null) {
                System.out.println(contingut);
                contingut = entrada.readLine();
            }
            entrada.close();
        } catch (FileNotFoundException a) {
            System.out.println(a);
        } catch (IOException e) {
            System.out.println(e);
        }
    }

    private static void afegirAlumne(File arxiu, String noms) {
        try {
            BufferedWriter entrada = new BufferedWriter(new FileWriter(arxiu));
            Scanner in = new Scanner(System.in);
            System.out.println("Intro nom nou:");
            String nom = ", " + in.nextLine();
            noms = noms + nom;
            entrada.write(noms);
            entrada.close();
        } catch (IOException e) {
            System.out.println(e);
        }
    }

}
