/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Recursivitat;

import java.util.Scanner;

/**
 *
 * @author MiquelA
 */
public class ExamenUF2 {

    public static void main(String[] args) {
        int[][] tablero = new int[8][8];
        Scanner in = new Scanner(System.in);
        Joc(tablero, in);
    }
//------------------------------------------------------------------------------------------------------------------------------------------------------------

    private static void rellenar(int[][] tablero) {
        int X, Y;
        for (int i = 0; i < 5; i++) {
            X = ((int) (Math.random() * tablero.length - 1));
            Y = ((int) (Math.random() * tablero.length - 1));
            if ((X != 0) && (Y != 0) && (X != tablero.length) && (Y != tablero.length)) {
                if ((tablero[X - 1][Y] == 0) && (tablero[X + 1][Y] == 0) && (tablero[X][Y + 1] == 0) && (tablero[X][Y - 1] == 0)) {
                    tablero[X][Y] = 1;
                } else {
                    i--;
                }
            } else {
                i--;
            }
        }
    }
//------------------------------------------------------------------------------------------------------------------------------------------------------------

    public static Boolean Vora(int X, int Y, int[][] tablero) {
        if ((X != 0) && (Y != 0) && (X != tablero.length) && (Y != tablero.length)) {
            return true;
        } else {
            return false;
        }
    }
//------------------------------------------------------------------------------------------------------------------------------------------------------------

    public static Boolean Contacte(int X, int Y, int[][] tablero) {
        if ((tablero[X - 1][Y] == 0) && (tablero[X + 1][Y] == 0) && (tablero[X][Y + 1] == 0) && (tablero[X][Y - 1] == 0)) {
            return true;
        } else {
            return false;
        }
    }
//------------------------------------------------------------------------------------------------------------------------------------------------------------

    public static void Joc(int[][] tablero, Scanner in) {
        int X, Y, intentos = 10, aciertos = 0;
        Boolean fi = false;
        rellenar(tablero);
        System.out.println("");
        System.out.println("Este es el tablero: ");
        mostrarTablero(tablero);

        while (!fi) {
            System.out.println("");
            System.out.println("Intro X: ");
            X = in.nextInt();
            System.out.println("");
            System.out.println("Intro Y: ");
            Y = in.nextInt();
            if (Vora(X, Y, tablero) && (Contacte(X, Y, tablero))) {
                System.out.println("");
                System.out.println("Correcte");
                tablero[X][Y] = 1;
                aciertos++;
                System.out.println("");
                System.out.println("Llevas " + aciertos + " aciertos");
            } else {
                System.out.println("Error, introduce nuevas posiciones");
                intentos--;
                System.out.println("");
                System.out.println("Te quedan " + intentos + " intentos");
            }
            mostrarTablero(tablero);
            if (aciertos == 4) {
                System.out.println("");
                System.out.println("Has guanyat");
                fi = true;
            } else if (intentos == 0) {
                System.out.println("");
                System.out.println("Has perdut");
                fi = true;
            }
        }
    }
//------------------------------------------------------------------------------------------------------------------------------------------------------------

    public static void mostrarTablero(int[][] tablero) {
        for (int i = 0; i < tablero.length; i++) {
            for (int j = 0; j < tablero[0].length; j++) {
                System.out.print(tablero[i][j] + " ");
            }
            System.out.println("");
        }
    }
}
