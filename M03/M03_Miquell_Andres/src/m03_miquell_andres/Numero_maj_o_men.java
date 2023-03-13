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
public class Numero_maj_o_men {

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        double maj = 0, men = 0, num;
        System.out.println("Introdueix 10 num");
        for (int i = 0; i < 10; i++) {
            num = in.nextDouble();
            if (i == 0) {
                maj = num;
                men = num;
            }
            if (num >= maj) {
                maj = num;
            } else if (num <= men) {
                men = num;
            }
        }
        System.out.println("El mes gran es " + maj + " el mes petit es " + men);
        
        
    }
}
