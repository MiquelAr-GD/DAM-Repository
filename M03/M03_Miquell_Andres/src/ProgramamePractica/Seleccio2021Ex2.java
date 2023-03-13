/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ProgramamePractica;

import java.util.Scanner;

/**
 *
 * @author MiquelA
 */
public class Seleccio2021Ex2 {

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int n = in.nextInt();
        Boolean c = true;
        while (n != 0) {
            Pilots[] Parrila = new Pilots[n];

            for (int i = 0; i < n; i++) {
                Parrila[i] = new Pilots(in.nextInt(), in.nextLine());
                Parrila[i].setPos(Parrila[i].getPos() + i + 1);
                if (Parrila[i].getPos() > 26) {
                    c = false;
                }
            }
            if (c) {
                burbuja(Parrila);
                for (int i = 0; i < n; i++) {
                    System.out.println(Parrila[i].getPos() + Parrila[i].getNom());
                }
                System.out.println("-----");
            }
        }
    }

    public static void burbuja(Pilots[] p) {
        int i, j;
        Pilots aux = new Pilots();
        for (i = 0; i < p.length - 1; i++) {
            for (j = 0; j < p.length - i - 1; j++) {
                if (p[j + 1].getPos() < p[j].getPos()) {
                    aux = p[j + 1];
                    p[j + 1] = p[j];
                    p[j] = aux;
                }
            }
        }
    }
}

class Pilots {

    private int Pos;
    private String Nom;

    public Pilots() {
        Pos = 0;
        Nom = "";
    }

    public Pilots(int pos, String nom) {
        Pos = pos;
        Nom = nom;
    }

    /**
     * @return the Pos
     */
    public int getPos() {
        return Pos;
    }

    /**
     * @param Pos the Pos to set
     */
    public void setPos(int Pos) {
        this.Pos = Pos;
    }

    /**
     * @return the Nom
     */
    public String getNom() {
        return Nom;
    }

    /**
     * @param Nom the Nom to set
     */
    public void setNom(String Nom) {
        this.Nom = Nom;
    }

}
