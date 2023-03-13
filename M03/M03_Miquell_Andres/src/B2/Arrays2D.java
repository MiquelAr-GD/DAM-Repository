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
public class Arrays2D {

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int num;
        num = in.nextInt();
        int[][] vector = new int[num][num];
        for (int i = 0; i < num; i++) {
            for (int j = 0; j < num; j++) {
                if ((j == i) || (i + j == num - 1)) {
                    vector[i][j] = 1;

                } else {
                    vector[i][j] = 0;
                }
                System.out.print("  " + vector[i][j]);
            }

            System.out.println("");
        }
    }
}
