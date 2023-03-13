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
public class Bucles {

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        int d, i, b;
        i = 0;
        for (d = 0; d < 30; d++) {
            System.out.println(i);
            i = i + 2;

        }
// mutiplicar0
        while (d != 0) {
            System.out.println("Introdueix un numero i et mostrare la taula o introdueix 0 per sortir:");
            d = in.nextInt();
            if (d != 0) {
                for (b = 0; b <= 10; b++) {
                    System.out.println(d + "x" + b + " = " + (d * b));
                }
            }
        }
//sum naturales 100
        i = 0;
        for (d = 0; d != 100; d++) {
            i = i + d;
        }
        System.out.println("El resultat es: " + i);
//X positius X negatius
        b = 0;
        d = 0;
        i = 1;
        while (i != 0) {
            System.out.println("Introdueix un num o 0 per sortir: ");
            i = in.nextInt();
            if (i < 0) {
                d++;
            } else if (i > 0) {
                b++;
            }
        }
        System.out.println("Has introduit " + b + " positius i " + d + " negatius ");

    }
}
