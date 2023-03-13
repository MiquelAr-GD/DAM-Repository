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
public class AceptoElReto {

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        String horaCompleta = "Hola";

        while (!horaCompleta.equals("00:00")) {

            horaCompleta = in.nextLine();
            if (!horaCompleta.equals("00:00")) {

                int hora = Integer.parseInt(horaCompleta.substring(0, 2));

                int minuts = Integer.parseInt(horaCompleta.substring(3, 5));

                System.out.print((23 - hora) * 60 + (60 - minuts) + "\n");
            }
        }
//------------------------------------------------------------------------------

        String pg, pa;
        int a;
        a = in.nextInt();
        for (int i = 0; i < a; i++) {
            pg = in.next();
            pa = in.next();
            if (pg.equals("Luke") && (pa.equals("padre"))) {
                System.out.println("TOP SECRET");
            } else {
                System.out.println(pg + ", yo soy tu " + pa);
            }
        }
//------------------------------------------------------------------------------
        a = in.nextInt();
        int c;
        for (int i = 0; i < a; i++) {
            c = in.nextInt();
            if (c <= 1000000 && c >= 2) {
                c = (c * c * c) - ((c - 2) * (c - 2) * (c - 2));
                System.out.println((float) c);
            }
        }
//------------------------------------------------------------------------------

        System.out.println("Intro num soldats");
        int soldats = 1, r1, x, i;

        while (soldats != 0) {
            x = 0;
            soldats = in.nextInt();
            r1 = soldats;
            while (r1 != 0) {
                i = (int) Math.sqrt(r1);
                x = x + ((int) Math.pow(i, 2) + 4 * i);
                r1 = r1 - (int) Math.pow(i, 2);
            }
            System.out.println(x);
        }
    }
// escudos ( n'2+4n)\\
}
