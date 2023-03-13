/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javaapplication1;

import java.util.Scanner;

/**
 *
 * @author MiquelA
 */
public class Segons {
    public static void main(String[] args) {
        Scanner in = new Scanner (System.in);
        byte edat ;
        int dies;
        int hores;
        int minuts;
        int segons1;

        
        System.out.println("Escriu la teva edat: ");
        edat = in.nextByte ();
        dies = edat * 365;
        hores = dies * 24;
        minuts = hores * 60;
        segons1 = minuts* 60;
        System.out.println("Has viscut: " + dies + " dies " + hores + " hores " + minuts + " minuts i " + segons1 + " segons ");
    }
    
}