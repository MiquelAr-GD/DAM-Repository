/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package B2;

import java.util.Scanner;

/**
 *
 * @author MiquelA
 */
public class Bloque5 {

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int[] matriu = new int[10];
        int[] vector = new int[50];
        int[] vectorA = new int[50];
        int s;
        boolean c;
        for (int i = 0; i < 10; i++) {
            matriu[i] = (int) (Math.random() * 10);
            System.out.print(matriu[i]);
        }
        System.out.println("");
        for (int i = 0; i < 5; i++) {

            s = matriu[i];
            matriu[i] = matriu[(matriu.length - 1) - i];
            matriu[(matriu.length - 1) - i] = s;

        }
        for (int i = 0; i < 10; i++) {
            System.out.print(matriu[i]);
        }
        System.out.println("");
        //----------------------------------------------------
        for (int i = 0; i < 50; i++) {
            vector[i] = (int) (Math.random() * 10);
            vectorA[i] = 0;
            System.out.print(vector[i]);

        }
        System.out.println("");
        for (int i = 0; i < 10; i++) {
            s = 0;
            for (int j = 0; j < 10; j++) {
                if (vector[i] == vectorA[j]) {
                    c = false;
                    s++;
                } else {
                    c = true;
                }
                if (c) {
                    System.out.print(vector[i]);
                }
            }
        }
    }
}
