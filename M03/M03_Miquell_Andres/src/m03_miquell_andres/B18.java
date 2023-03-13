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
public class B18 {

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        String nom, dia = "", mes = "", any = "";
        int dia1, mes1, any1;
        System.out.println("Introdueix una data (dd-mm-aaaa:");
        nom = in.nextLine();
        char lletra;
        for (int i = 0; i < nom.length(); i++) {
            if (i < 2) {
                lletra = nom.charAt(i);
                dia = dia + lletra;
            } else if (i >= 3 && i <= 4) {
                lletra = nom.charAt(i);
                mes = mes + lletra;
            } else if (i >= 6 && i <= 9) {
                lletra = nom.charAt(i);
                any = any + lletra;
            }
        }
        dia1 = Integer.parseInt(dia);
        mes1 = Integer.parseInt(mes);
        any1 = Integer.parseInt(any);

        if (dia1 < 0) {
            System.out.println("Data incorrecte");
        } else {
            if (mes1 == 2 && (dia1 < 29)) {
                System.out.println("Data correcte");
            } else {
                System.out.println("Data incorrecte");

                if ((mes1 == 1) || (mes1 == 3) || (mes1 == 5) || (mes1 == 7) || (mes1 == 8) || (mes1 == 10) || (mes1 == 12) && (dia1 <= 31)) {
                    System.out.println("Data correcte");
                } else {
                    System.out.println("Data incorrecte");
                }
                if ((mes1 == 4) || (mes1 == 6) || (mes1 == 9) || (mes1 == 11) && (dia1 <= 30)) {
                    System.out.println("Data correcte");
                } else {
                    System.out.println("Data incorrecte");
                }

            }

        }
    }
}
