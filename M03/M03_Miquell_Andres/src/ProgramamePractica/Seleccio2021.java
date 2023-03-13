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
public class Seleccio2021 {

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int num;
        while (in.hasNextInt()) {
            num = in.nextInt();
            System.out.println(Sum(num));
        }
    }

    public static int Sum(int num) {
        if (num == 1) {
            return 4;
        }
        return (4 * num) + (4 * Sum(num / 2));
    }
}
