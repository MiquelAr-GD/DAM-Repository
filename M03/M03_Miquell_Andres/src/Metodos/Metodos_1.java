/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Metodos;

import java.util.Scanner;

/**
 * 1. Write a program to rise up 1 unit to an integer number.
 *
 * 2. Write a program to calculate the power of a number without using pow
 * method.
 *
 * 3. Write a programa to calculate the factorial of a number read from
 * keyboard.
 */
public class Metodos_1 {

    public static void main(String[] args) {
        int num, pot;
        Scanner in = new Scanner(System.in);
        System.out.println("Intro num:");
        num = in.nextInt();
        System.out.println("Intro potencia");
        pot = in.nextInt();
        System.out.println(Pow(num, pot));

    }

    private static int Pow(int num, int pot) {
        int nu;
        nu = num;
        for (int i = 0; i < pot - 1; i++) {
            num = num * nu;
        }
        return num;
    }

}
