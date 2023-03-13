/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BL2;

import java.util.Scanner;

/**
 *
 * @author MiquelA
 */
public class ExamenUF1MiquelAndresEx2 {

    public static void main(String[] args) {
        //Declaracio de variables
        Scanner in = new Scanner(System.in);
        int al, nota, a = 0, max, min;
        long m = 0, mx = 0;
        //Recollida de numero d'alumnes
        System.out.println("Introdueix el numero d'alumnes que ha fet l'examen:");
        al = in.nextInt();
        //Creacio d'arrays per traballar
        int[][] notes = new int[al][3];
        int[] ex = new int[al];
        //Bucle per introduir i comprobar notes
        for (int i = 0; i < notes.length; i++) {
            System.out.println("");
            System.out.println("Introdueix es notes dels 3 exercicis");
            for (int j = 0; j < notes[0].length; j++) {
                notes[i][j] = in.nextInt();
                if (j == 0 && notes[i][j] > 2) {
                    System.out.println("Nota incorrecte, torna a intentar-ho");
                    j--;
                } else if (j == 1 && notes[i][j] > 3) {
                    System.out.println("Nota incorrecte, torna a intentar-ho");
                    j--;
                } else if (j == 2 && notes[i][j] > 5) {
                    System.out.println("Nota incorrecte, torna a intentar-ho");
                    j--;
                }
            }
        }
        //Calculador d'aprovat i guardar examens en un array
        for (int i = 0; i < notes.length; i++) {
            nota = 0;
            for (int j = 0; j < notes[0].length; j++) {
                nota = nota + notes[i][j];
                ex[i] = nota;
            }
            if (nota > 5) {
                System.out.println("La nota del alumne " + (i + 1) + " es " + nota + " ha aprovat");
                a++;
            } else {
                System.out.println("La nota del alumne " + (i + 1) + " es " + nota + " ha suspes");
            }
        }
        //Calcul de mitjantes d'exercicis
        for (int i = 0; i < notes[0].length; i++) {
            for (int j = 0; j < notes.length; j++) {
                m = m + notes[j][i];
            }
            System.out.println("La mitjana del exercici " + (i + 1) + " es " + (m / al));
            m = 0;
        }
        //Calcul de nota mes alta i mex baixa
        max = ex[1];
        min = ex[1];
        for (int i = 0; i < al; i++) {
            mx = mx + ex[i];
            if (ex[i] > max) {
                max = ex[i];
            } else if (ex[i] < min) {
                min = ex[i];
            }
        }
        //mostrada en pantalla dels calculs anteriors i el % d'aprovats
        mx = mx / al;
        System.out.println("La mitja dels examens es " + mx);
        System.out.println("La nota maxima ha sigut: " + max + " i la mes baixa es: " + min);
        System.out.println("Ha aprovat el " + (a*100/al) + "% dels estudiants");
        
    }
}
