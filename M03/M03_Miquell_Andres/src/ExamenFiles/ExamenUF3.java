/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ExamenFiles;

import java.io.*;
import java.util.Scanner;

/**
 *
 * @author MiquelA
 */
public class ExamenUF3 {

    public static void main(String[] args) {
        /*DECLARACIO DE VARIABLES*/
        Scanner in = new Scanner(System.in);
        Scanner ints = new Scanner(System.in);
        System.out.println("Introdueix nom de la carpeta a buscar: ");
        String rutaS = in.nextLine();
        File ruta = new File("C:\\Users\\MiquelA\\Documents\\NetBeansProjects\\FilesTry", rutaS);
        File f = new File(ruta, "20210503_fitxer.txt");
        File f1 = new File(ruta, "resum.txt");
        int codi = 1, quantitat, preu, i = 0, j = 0;
        /*Exercici 1*/
 /*------------------------------------------------*/
        System.out.println("Mirem que la carpeta existeixi i fem un TRY-CATCH per posibles excepcionsIOE");
        try {
            if (ruta.exists()) {
                System.out.println("La carpeta existeix");
            } else {
                System.out.println("La carpeta no exiteix, la crearem");
                if (ruta.mkdir()) {
                    System.out.println("Creada correctament");
                } else {
                    System.out.println("No s'ha pogut crear la carpeta");
                }
            }
            System.out.println("Mirem si l'arxiu existeix");
            if (f.exists()) {
                System.out.println("L'arxiu existeix");
            } else {
                System.out.println("L'arxiu no exiteix");
                System.out.println("Anem a crear-lo");
                if (f.createNewFile()) {
                    System.out.println("L'arxiu s'ha creat correctament");
                } else {
                    System.out.println("No s'ha pogut crear l'arxiu");
                }
            }
            /*Exercici 2 i 3*/
 /*------------------------------------------------*/
            BufferedWriter entrada = new BufferedWriter(new FileWriter(f, true));
            while (codi != 0) {
                System.out.println("Introdueix codi: ");
                codi = ints.nextInt();
                if (codi != 0) {
                    entrada.write("Codi " + codi + " ");
                    System.out.println("Intro quantitat: ");
                    quantitat = ints.nextInt();
                    entrada.write("Quantitat " + quantitat + " ");
                    System.out.println("Intro preu: ");
                    preu = ints.nextInt();
                    entrada.write("Preu " + preu + " € \n");
                    j++;
                }
            }
            System.out.println("");
            System.out.println("S'ha llegit la informacio i s'ha introduit al arxiu");
            System.out.println("");
            entrada.close();
            /*Exercici 4 (Continua al metode)*/
 /*------------------------------------------------*/
            String[][] dades = new String[j][];
            BufferedReader sortida = new BufferedReader(new FileReader(f));
            System.out.println("");
            System.out.println("A continuacio es llegira el text, es separara amb el metode split per espais, i es guardara a un array 2D");
            System.out.println("");
            String contingut = sortida.readLine();
            while (contingut != null) {
                System.out.println(contingut);
                dades[i] = contingut.split(" ");
                i++;
                contingut = sortida.readLine();

            }
            sortida.close();
            calculBeneficis(dades);
            /*Exercici 5*/
 /*------------------------------------------------*/
            System.out.println("");
            System.out.println("Generem el manejador d'arxius pel arxiu resum.txt, igualem el atic arxiu al nou i eliminem l'altre");
            System.out.println("");
            if(f1.exists()){
                System.out.println("Tambe mirem si el arxiu resum.txt existeix i l'eliminem, aixo pot pasar quan s'executa varis cops el codi");
                f1.delete();
            }
            f1.createNewFile();
            f1 = f;
            f.delete();
        } catch (FileNotFoundException a) {
            System.out.println(a);
        } catch (IOException e) {
            System.out.println(e);
        }

    }

    /*Exercici 4*/
 /*------------------------------------------------*/
 /* En l'array que acaben de crear, la infromacio de les caselles va aixi:
       Codi t 0
       Codi n 1
       Quantitat t 2
       Quantitat n 3
       Preu t 4
       Preu num 5                                       */
    private static void calculBeneficis(String[][] dades) {
        System.out.println("");
        System.out.println("En aquest metode es calcula el benefici del dia ");
        System.out.println("");
        double sum = 0;
        for (int i = 0; i < dades.length; i++) {
            if (Integer.parseInt(dades[i][5]) >= 20) {
                sum = sum + Integer.parseInt(dades[i][3]) * (Integer.parseInt(dades[i][5]) * 0.1);
            } else {
                sum = sum + Integer.parseInt(dades[i][3]) * (Integer.parseInt(dades[i][5]) * 0.05);
            }
        }
        System.out.println("El benefici total del dia es de: " + sum);
    }
}
