/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package m03_miquell_andres;

import java.util.Scanner;

/**
 *
 * @author MiquelA
 */
public class Block3Strings {

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        String nom;
        System.out.println("Una frase: ");
        nom = in.nextLine();
        int i, medidor;
        i = 0;
        medidor = 0;
        while (nom.indexOf("a") != -1) {
            if ((nom.indexOf("a") > (medidor))) {
                i++;
                medidor = nom.indexOf("a") + medidor;
                nom = nom.replaceFirst("a", "b");
                System.out.println(nom);
            }
        }
        System.out.println("Hi ha" + i + "vocals a");

    }
}
