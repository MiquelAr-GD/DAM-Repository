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
public class Block2 {

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int n1, n2, n6, n4, n5;
        double n3, a, b, c, d;

        System.out.println("Introdueix un num: ");
        n1 = in.nextInt();
        if (n1 == 0) {
            System.out.println("El numero es 0");
        }
//1---------------------------------------------------

        System.out.println("Introdueix 2 numeros: ");
        n1 = in.nextInt();
        n2 = in.nextInt();
        if (n1 > n2) {
            System.out.println("El primer es major");
        } else if (n2 > n1) {
            System.out.println("El segon es major");
        } else {
            System.out.println("Son iguals");
        }

//2----------------------------------------------------
        System.out.println("Introdueix un numero: ");
        n1 = in.nextInt();
        if (n1 == 0) {
            System.out.println("El numero es 0");
        } else if (n1 < 0) {
            System.out.println("El numero es negatiu");
        } else {
            System.out.println("El numero es positiu");
        }
//3---------------------------------------------------
        System.out.println("Introdueix un numero: ");
        n1 = in.nextInt();
        if ((n1 % 2) == 0) {
            System.out.println("Es un numero par");
        } else {
            System.out.println("Es un numero impar");
        }
//4---------------------------------------------------
        System.out.println("Introdueix el preu final:");
        n1 = in.nextInt();

        n3 = (n1 / 0.95);
        System.out.println("El preu inicial es:" + n3);
        n3 = (n3 - n1);
        System.out.println("El 5% es:" + n3);

//5-----------------------------------------------------
        System.out.println("Introdueix la teva data de neixament en numeros:");
        System.out.println("Any:");
        n3 = in.nextDouble();
        System.out.println("Mes:");
        n2 = in.nextInt();
        System.out.println("Dia:");
        n1 = in.nextInt();
        System.out.println("Introdueix la data actual:");
        System.out.println("Any:");
        n4 = in.nextInt();
        System.out.println("Mes:");
        n5 = in.nextInt();
        System.out.println("Dia:");
        n6 = in.nextInt();

        n3 = n4 - n3;

        if (n2 >= n5) {
            if (n1 >= n6) {
                n3 = n3 + 1;
            }
        }
        System.out.println("La teva edat es:" + n3);
//6-----------------------------------------------------
        System.out.println("Introdueix un numero:");
        n1 = in.nextInt();
        if (((n1 % 2) == 0) && ((n1 % 3) == 0)) {
            System.out.println("Es multiple de 2 i 3");
        } else if ((n1 % 3) == 0) {
            System.out.println("Es multiple de 3");
        } else if ((n1 % 2) == 0) {
            System.out.println("Es multiple de 2");
        } else {
            System.out.println("No es multiple de cap");
        }
//7-----------------------------------------------------
        System.out.println("Introdueix 3 valors:");
        System.out.println("a");
        a = in.nextDouble();
        System.out.println("b");
        b = in.nextDouble();
        System.out.println("c");
        c = in.nextDouble();
        d = Math.sqrt(b * b - 4 * a * c);
        a = (((-1) * b - d) / 2 * a);
        b = (((-1) * b + d) / 2 * a);
        System.out.println("El resultat es:" + a + " i " + b);
//8-----------------------------------------------------
        System.out.println("Escriu 2 numeros:");
        
//9-----------------------------------------------------
        System.out.println("Introdueix una quantitat:");
        n1 = in.nextInt();
        if (n1 >= 10000) {
            n1 = n1 - (n1 * 10 / 100);
        } else {
            n1 = n1 - (n1 * 5 / 100);
        }
        System.out.println("El preu final es:" + n1);
//11---------------------------------------------------
    }
}
