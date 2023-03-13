/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Objectos;

import java.util.Scanner;

/**
 *
 * @author MiquelA
 */
public class ExamenFinalUF1_MiquelAndresExercici2 {

    public static void main(String[] args) {
        
        //Creacio d'Scanner
        
        Scanner in = new Scanner(System.in);
        
        // Declaracio de variables 
        
        String frase, lletra;
        String lletres = "a;b;c;d;e;f;g;h;i;j;k;l;m;n;o;p;q;r;s;t;u;v;w;x;y;z";
        String[] Alletres = lletres.split(";");
        int[] Contador = new int[Alletres.length];
        System.out.println("Intro frase; ");
        frase = in.nextLine();
        
        //Omplidor d'array numeric
        
        for (int i = 0; i < Contador.length; i++) {
            Contador[i] = 0;
        }
        //Guardo la lletra en una variable tipus String
        for (int i = 0; i < frase.length(); i++) {
            lletra = frase.charAt(i) + "";
            //Comprovo si esta guardada en l'array de lletres i augmento en 1 el contador en la mateixa posicio que la lletra
            for (int j = 0; j < Alletres.length; j++) {
                if (lletra.equalsIgnoreCase(Alletres[j])) {
                    Contador[j] = Contador[j] + 1;
                }
            }
        }
        //Mostro per pantalla Contador + LLetra
        for (int i = 0; i < Alletres.length; i++) {
            if (Contador[i] != 0) {
                System.out.println(Alletres[i] + " - " + Contador[i]);
            }
        }
    }
}
