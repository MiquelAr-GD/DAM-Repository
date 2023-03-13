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
public class HMS {

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        int h, m, s;

        System.out.println("Introdueix les hores: ");
        h = in.nextInt();
        System.out.println("Introdueix els minuts: ");
        m = in.nextInt();
        while ((m > 59) || (m < 0)) {
            System.out.println("El valor es incorrecte, torna a introduir els minuts: ");
            m = in.nextInt();
        }
        System.out.println("Introdueix els segons: ");
        s = in.nextInt();
        while ((s > 59) || (s < 0)) {
            System.out.println("El valor es incorrecte, torna a introduir els segons: ");
            s = in.nextInt();
        }
        s = s + 1;
        if (s >= 60) {
            s = 0;
            m++;
            if (m >= 60) {
                m = 0;
                h++;
            }
        }
        System.out.println("Son les: " + h + ":" + m + ":" + s);
    }
}
