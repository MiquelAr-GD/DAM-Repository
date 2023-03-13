/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BL2;

/**
 *
 * @author MiquelA
 */
public class Examen_practica {

    public static void main(String[] args) {
        String Paraula, lln = "", lletra = "";
        Paraula = "La fL0r is73nl kdeuTg ns2u5k s3cz7a mmdEo";
        int n = 0, e = 0;

        for (int i = 0; i < Paraula.length() - 1; i++) {
            if ((Paraula.charAt(i) == '0') || (Paraula.charAt(i) == '1') || (Paraula.charAt(i) == '2') || (Paraula.charAt(i) == '3') || (Paraula.charAt(i) == '4') || (Paraula.charAt(i) == '5') || (Paraula.charAt(i) == '6') || (Paraula.charAt(i) == '7') || (Paraula.charAt(i) == '8') || (Paraula.charAt(i) == '9')) {
                lln = Paraula.charAt(i) + "";
                n = n + Integer.parseInt(lln);
            } else if (Paraula.charAt(i) == ' ') {
                e++;
                Paraula = Paraula.substring(0, i) + Paraula.substring(i, Paraula.length() - 1);
            } else {
                lln = Paraula.charAt(i) + "";
                if (i == 0) {
                    lln = lln.toUpperCase();
                } else {
                    lln = lln.toLowerCase();
                }

                lletra = lletra + lln;
            }
        }
        System.out.println(n);
        System.out.println(Paraula);
        System.out.println(lletra);
        //----------------------------------------------------------------------------------------------------------------
        int[][] matriu = new int[10][5];
        int l, c;
        float m;
        for (int i = 0; i < matriu.length; i++) {
            c = 0;
            l = 0;
            for (int j = 0; j < matriu[0].length; j++) {
                matriu[i][j] = (int) (Math.random() * 10);
                if (matriu[i][j] != 0) {

                    l = l + matriu[i][j];
                    c++;
                }
                System.out.print(matriu[i][j] + "      ");
            }
            m = (float) l / c;
            System.out.printf("       %.2f", m);
            System.out.println("");

        }

    }
}
