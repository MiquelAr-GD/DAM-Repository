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
public class Piedras {

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int Pedres, Usades = 0, C, Usa;
        System.out.println("Intro num pedres:   ");
        Pedres = in.nextInt();
        for (C = 1; Usades < Pedres; C++) {
            Usades = Usades + C;
        }

    }
}