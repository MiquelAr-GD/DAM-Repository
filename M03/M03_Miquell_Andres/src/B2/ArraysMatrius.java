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
public class ArraysMatrius {

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        boolean id;
        int num = 1;

        while (num != 0) {
            id = true;
            num = in.nextInt();
            if (num != 0) {
                int[][] matriu = new int[num][num];
                for (int i = 0; i < num; i++) {
                    for (int j = 0; j < num; j++) {
                        matriu[i][j] = in.nextInt();
                        if (i == j) {
                            if (matriu[i][j] != 1) {
                                id = false;
                            }
                        } else if (matriu[i][j] != 0) {
                            id = false;
                        }
                    }
                }
                if (id) {
                    System.out.println("SI");
                } else {
                    System.out.println("NO");
                }
            }
        }
        
    }
}
