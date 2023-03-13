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
public class Notes {

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        double num1, sumsus, sumap;
        int s, a, b, n, e;
        s = 0;
        a = 0;
        b = 0;
        n = 0;
        e = 0;
        int sufi = 0;
        sumsus = 0;
        sumap = 0;
        for (int i = 0; i != 10; i++) {
            System.out.println("Introdueix la nota: ");
            num1 = in.nextDouble();
            if ((num1 < 0) || (num1 > 10)) {
                System.out.println("Valor incorrete, introdueixi un numero entre 0 i 10");
                i--;
            } else {
                if (num1 < 5) {
                    s++;
                    sumsus = sumsus + num1;
                } else {
                    a++;
                    sumap = sumap + num1;
                }
                if (num1 < 6) {
                    sufi++;
                } else if (num1 < 7) {
                    b++;
                } else if (num1 < 9) {
                    n++;
                } else {
                    e++;
                }

            }
        }
        System.out.println("Han suspes:" + s + " Han aprovat: " + a
                + " Dels quals " + sufi + "son suficients " + b + " Son be " + n + " Son notables " + e
                + " Son excelents");
        System.out.println("La mitja de suspesos es: " + (sumsus / s));
        System.out.println("La mitja d'aprovats es: " + (sumap / a));
        System.out.println("El percentatge de suspesos es: " + ((s * 100) / 10));
        System.out.println("El percentatge d'aprovats es: " + ((a * 100) / 10));
    }
}
