/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Recursivitat;

import java.util.Scanner;

/**
 *
 * Disseny un programa recursiu que calculi la suma dels nombres que formen un
 * número
 */
public class Exercici9 {

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        Double n = in.nextDouble();
        System.out.println(Sum(n));

    }

    public static Double Sum(Double n) {
        System.out.println("Entra " + n);

        if ((n % 10) < 1) {
            return n;
        } else {
            return (n % 10) + Sum(n / 10);
        }
    }
}
