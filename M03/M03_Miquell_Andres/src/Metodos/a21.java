/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Metodos;

/**
 *
 * @author MiquelA
 */
public class a21 {

    public static void main(String[] args) {
        Persona[] vector = new Persona[5];
        for (int i = 0; i < vector.length; i++) {
            vector[i] = new Persona(i, ((double) (Math.random() * 100)), ((int) (Math.random() * 100)));
        }
        for (int i = 0; i < vector.length; i++) {
            System.out.print(vector[i].getId() + " ");
            System.out.print(vector[i].getPes() + " ");
            System.out.print(vector[i].getEdat() + " ");
            System.out.println("");
        }
        idJove(vector);
        idAvi(vector);
        MitjaPes(vector);
        OrdenatsPerEdat(vector);
    }

    private static void idJove(Persona[] vector) {
        int min = 0;
        for (int i = 0; i < vector.length; i++) {
            if (i == 0) {
                min = vector[0].getEdat();
            }
            if (vector[i].getEdat() < min) {
                min = vector[i].getEdat();
            }
        }
        for (int i = 0; i < vector.length; i++) {
            if (min == vector[i].getEdat()) {
                System.out.println("La id de la persona mes jove es: " + vector[i].getId());
            }
        }
    }

    private static void idAvi(Persona[] vector) {
        int max = 0;
        for (int i = 0; i < vector.length; i++) {
            if (i == 0) {
                max = vector[0].getEdat();
            }
            if (vector[i].getEdat() > max) {
                max = vector[i].getEdat();
            }
        }
        for (int i = 0; i < vector.length; i++) {
            if (max == vector[i].getEdat()) {
                System.out.println("La id de la persona mes gran es: " + vector[i].getId());
            }
        }
    }

    private static void MitjaPes(Persona[] vector) {
        double suma = 0, mitja;
        for (int i = 0; i < vector.length; i++) {
            suma = suma + vector[i].getPes();
        }
        mitja = suma / vector.length;
        System.out.println("La mitja del pes de les persones es de: " + mitja);
    }

    private static void OrdenatsPerEdat(Persona[] vector) {
        int min, pos, j;
        for (int i = 0; i < vector.length; i++) {
            min = vector[0].getEdat();
            pos = 0;
            for (j = 0; j < vector.length; j++) {
                if (vector[j].getEdat() < min) {
                    min = vector[j].getEdat();
                    pos = j;
                }
            }
            System.out.println(vector[pos].getId());
            vector[pos].setEdat(vector[pos].getEdat() + 100);
        }
        for (int i = 0; i < vector.length; i++) {
            vector[i].setEdat(vector[i].getEdat() - 100);
        }
    }
}
