/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Recursivitat;

import java.util.Scanner;

/**
 *
 * @author MiquelA
 */
public class Laberinto {
     public static void main(String[] args) {
         Scanner in = new Scanner(System.in);
        int n = in.nextInt();
        System.out.println(SumM(n));

    }
     public static int SumM(int n) {
        System.out.println("Entra " + n);

        if(n%2==0){
            if(n==2){
                System.out.println("1/2");
                return 1/2;
            } else {
                System.out.println("1/" + n);
                return (1/n)+SumM(n-2);
            }
        } else{
            if(n==1){
                System.out.println("1");
                return 1;
            } else {
                System.out.println("1/" + n);
                return (1/n)+SumM(n-2);
            }
        }
     }
}