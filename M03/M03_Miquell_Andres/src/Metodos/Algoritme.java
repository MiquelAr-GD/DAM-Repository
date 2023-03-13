/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Metodos;

/**
 *
 * @author MiquelA
 */
public class Algoritme {

    public static void main(String[] args) {
        int[] num = new int[5];
        int min = 0, p = 0, aux;
        for (int i = 0; i < num.length; i++) {
            num[i] = ((int) (Math.random() * 10));
            System.out.print(num[i] + " ");
        }
        System.out.println("");
        for (int i = 0; i < num.length; i++) {
            min = num[i];
            for (int j = i; j < num.length; j++) {
                if (num[j] < min) {
                    min = num[j];
                    p = j;
                }
            }
            if (num[i] > min) {
                aux = num[i];
                num[i] = num[p];
                num[p] = aux;
            }
        }
        for (int i = 0; i < num.length; i++) {
            System.out.print(num[i] + " ");
        }
    }
}