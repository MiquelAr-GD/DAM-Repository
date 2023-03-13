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
public class Factorials {

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        long d, i;

        System.out.println("Introdueix un num: ");
        i = in.nextLong();
        d = i;
        while (i != 1) {
            i--;
            d = d * i;
        }
        System.out.println(d + " i la ultima xifra es " + (d%10));
    }
}
