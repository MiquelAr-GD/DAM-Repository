/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bloc7;

import java.util.Scanner;

public class AAAAAAAAAAA {

    public static void main(String[] args) {

        Scanner in = new Scanner(System.in);
        int mesos = 12;
        int ciutats = 3;
        int[][] pluges = new int[ciutats][mesos];
        int i, j, suma_pluges, mes = 1, ciutat, pluja_maxima, pluja_minima;
        float mitjana_minima, mitjana_mes;

        introDades(pluges);
        ImprimirDades(pluges);

        // Ciutat més plujosa
        int ciutatMesPluja = ciutatMesPlujosa(pluges);
        System.out.printf("\n\nLa ciutat més plujosa ha estat la %d", ciutatMesPluja);

        // Mes més plujós
        int mesMesPluja = mesMesPlujos(pluges);
        System.out.printf("\n\nEl mes més plujos ha estat el %d", mesMesPluja);

        // Mes més plujós d'una ciutat introduida per teclat
//        pluja_maxima = 0;
//        System.out.printf("\n\nQuina ciutat vols analitzar ?");
//        ciutat = in.nextInt();
//
//        mesMesPluja = mesMesPlujosCiutat(ciutat, pluges);
//        System.out.printf("El mes més plujos ha estat el %d a la ciutat %d", mesMesPluja, ciutat);
//
//        mostraDesviacions(pluges);
    }

    private static int[][] introDades(int[][] pluges) {
        for (int i = 0; i < pluges.length; i++) {
            for (int j = 0; j < pluges[0].length; j++) {
                pluges[i][j] = ((int) (Math.random() * 50));
            }
        }
        return pluges;
    }

    private static void ImprimirDades(int[][] pluges) {
        for (int i = 0; i < pluges.length; i++) {
            for (int j = 0; j < pluges[0].length; j++) {
                System.out.print(pluges[i][j]);
                System.out.print(" ");
            }
            System.out.println("");
        }
    }

    private static int ciutatMesPlujosa(int[][] pluges) {
        int CMP, C1 = 0, C2 = 0, C3 = 0;
        for (int i = 0; i < pluges.length; i++) {
            for (int j = 0; j < pluges[0].length; j++) {
                if (i == 0) {
                    C1 = C1 + pluges[i][j];
                } else if (i == 1) {
                    C2 = C2 + pluges[i][j];
                } else {
                    C3 = C3 + pluges[i][j];
                }
            }

        }
        if ((C1 > C2) && (C1 > C3)) {
            CMP = 1;
        } else if ((C2 > C1) && (C2 > C3)) {
            CMP = 2;
        } else {
            CMP = 3;
        }
        return CMP;
    }

    private static int mesMesPlujos(int[][] pluges) {
        int sumM = 0, mM = 0, MM = 0, MP = 0;
        for (int i = 0; i < pluges[0].length; i++) {
            for (int j = 0; j < pluges.length; j++) {
                sumM = sumM + pluges[j][i];
            }
            if (i == 0) {
                mM = sumM;
                MM = sumM;
            } else if (sumM > MM) {
                MM = sumM;
                MP = i+1;
            } else if (sumM < mM) {
                mM = sumM;
            }
            sumM = 0;
        }
        return MP;
    }

}
