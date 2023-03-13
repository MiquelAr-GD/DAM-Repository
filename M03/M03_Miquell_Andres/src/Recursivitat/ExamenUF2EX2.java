/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Recursivitat;

/**
 *
 * @author MiquelA
 */
public class ExamenUF2EX2 {

    public static void main(String[] args) {
        int[] array = new int[100];
        int pos = 0;
        for (int i = 0; i < array.length; i++) {
            array[i] = ((int) (Math.random() * 10));
            System.out.print(array[i] + " ");
        }
        System.out.println("");
        System.out.println("La suma es " + Sum(pos, array));
    }

    public static int Sum(int pos, int[] array) {
        int suma;
        if (array[pos] == 0) {
            return array[pos];
        } else {
            suma = array[pos] + Sum(pos + 1, array);
        }
        return suma;
    }
}
