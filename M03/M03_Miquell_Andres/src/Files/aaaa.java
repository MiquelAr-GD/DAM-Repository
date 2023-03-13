/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Files;

import java.io.File;
import java.io.IOException;

/**
 *
 * @author MiquelA
 */
public class aaaa {

    public static void main(String[] args) throws IOException {
        File ruta = new File("c:/files");
        File f = new File(ruta, "fitxer.txt");
        if (!f.exists()) {
            System.out.println("El fitxer " + f.getName() + " no existeix");
            if (!ruta.exists()) {
                System.out.println("La ruta " + ruta.getName() + " no existeix");
                if (ruta.mkdir()) {
                    System.out.println("S'ha creat la ruta " + ruta.getName() + " correctament");
                    if (f.createNewFile()) {
                        System.out.println("El fitxer " + f.getName() + " s'ha creat correctament");
                    } else {
                        System.out.println("El fitxer " + f.getName() + " no s'ha pogut crear");
                    }
                } else {
                    System.out.println("No s'ha pogut crear la ruta");
                }
            } else {
                System.out.println("La ruta " + ruta.getName() + " ja existeix");
            }

        } else {
            System.out.println("El fitxer " + f.getName() + "  ja existeix.");
        }
    }
}
