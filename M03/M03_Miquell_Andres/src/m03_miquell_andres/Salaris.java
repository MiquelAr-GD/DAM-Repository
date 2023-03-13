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
public class Salaris {

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        double num1;
        System.out.println("Introdueix el teu salari: ");
        num1 = in.nextDouble();
        if (num1 <= 9000) {
            num1 = num1 * 1.2;
            System.out.printf("%.0f Es el salari augmentat", num1);
        } else if (num1 <= 15000) {
            num1 = num1 * 1.1;
            System.out.printf("%.0f Es el salari augmentat", num1);
        } else if (num1 <= 20000) {
            num1 = num1 * 1.5;
            System.out.printf("%.0f Es el salari augmentat", num1);
        } else {
            System.out.println("El salari no augmenta");
        }

    }
}
