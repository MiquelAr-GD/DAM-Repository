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
public class DPT {

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int d, Vm, Vmax, t;

        System.out.println("Introdueix la distancia entre les cameres, la velocitat maxima i el temps que ha tardat:");
        d = in.nextInt();
        Vmax = in.nextInt();
        t = in.nextInt();

        Vm = (int) ((d / t) * 3.6);
        if (Vm < Vmax) {
            System.out.println("Ok");
        } else if (Vm > (Vmax * 1.2)) {
            System.out.println("Puntos");
        } else {
            System.out.println("Multa");
        }
    }
}
