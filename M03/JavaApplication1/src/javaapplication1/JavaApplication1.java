/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javaapplication1;

import java.util.Scanner;
import java.lang.Math;

/**
 *
 * @author MiquelA
 */
public class JavaApplication1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Scanner in = new Scanner (System.in);
        double n,n1 ;
        double arrel ;
        double resultat;
        double cuadrado;
        double elevat;
        
        System.out.println("Escriu un numero: ");
        n = in.nextDouble ();
        arrel = Math.sqrt(n);
        System.out.println("Escriu un altre numero per dividir: ");
        n1 = in.nextDouble ();
        resultat = arrel/n1;
        System.out.println("Escriu el numero pel qual vols elevar el resultat: ");
        elevat = in.nextDouble ();
        cuadrado = Math.pow(resultat, elevat);
        System.out.println("L'arrel es: " + arrel + "\n");
        System.out.println("El resultat de la divisio es: " + resultat + "\n");
        System.out.println("El resultat de la divisio al quadrat es : " + cuadrado+ "\n");
    }
    
}