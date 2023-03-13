/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package m03_miquell_andres;

import java.util.Scanner;

public class Frasese {

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        String f1, f2, f3 = "";
        System.out.println("Intro frase");
        f1 = in.nextLine();
        for (int i = 0; i < f1.length(); i++) {
            if (i == 0) {
                f3 = f1.charAt(i) + f3;
                f1 = f3.toUpperCase() + f1.substring(1, f1.length());
            } else if (f1.charAt(i) == ' ') {
                i++;
                f2 = "" + f1.charAt(i);
                f2 = f2.toUpperCase();
                i++;
                f2 = f2 + f1.substring(i);
                i--;
                f1 = f1 + f2;

            }
        }

        System.out.println(f1);
    }
}
