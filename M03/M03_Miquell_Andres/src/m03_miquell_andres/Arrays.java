/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package m03_miquell_andres;

/**
 *
 * @author MiquelA 
 */
public class Arrays {

    public static void main(String[] args) {
        int suma = 0, sp = 0, si = 0;
        int[] n = new int[50];
        for (int i = 0; i <= n.length - 1; i++) {
            n[i] = i;
            suma = suma + n[i];
            if (n[i] % 2 == 0) {
                sp = sp + n[i];
            } else {
                si = si + n[i];
            }
        }
        System.out.println(suma);
        System.out.println("Pars " + sp);
        System.out.println("Impars " + si);
        suma = 0;
        int[] cien = new int[100];
        for (int i = 0; i <= cien.length - 1; i++) {
            cien[i] = i;
            if (i % 3 == 0) {
                suma = suma + cien[i];
            }
        }
        System.out.println(suma);
    }
}
