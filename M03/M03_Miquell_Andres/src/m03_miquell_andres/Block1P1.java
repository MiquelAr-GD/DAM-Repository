package m03_miquell_andres;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.util.Scanner;

/**
 *
 * @author MiquelA
 */
public class Block1P1 {

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int n, n2;
        double radi, cercle, hyp;
        float n3, n4;
        System.out.println("This subject is called: Programming Language");
        System.out.println(" Write 2 numbers: ");
        n = in.nextInt();
        n2 = in.nextInt();
        System.out.println("La suma es: " + (n + n2));
        //1----------------------------------------------------
        System.out.println("Introdueix 2 mes: ");
        n = in.nextInt();
        n2 = in.nextInt();
        System.out.println("La multiplicació es: " + (n * n2));
        //2----------------------------------------------------
        System.out.println("Introdueix 2 mes: ");
        n = in.nextInt();
        n2 = in.nextInt();
        System.out.println("La divisió es: " + (n / n2));
        System.out.println("El residu es: " + (n % n2));
        //3----------------------------------------------------
        System.out.println("Introdueix 2 num amb comes (o sense); ");
        n3 = in.nextFloat();
        n4 = in.nextFloat();
        System.out.printf("El resultat es: %.2f \n", (n3 / n4));
        //4----------------------------------------------------
        System.out.println("Introdueix un num amb comes (o sense); ");
        n3 = in.nextFloat();
        System.out.printf("L'arrel es: %.2f \n", (Math.sqrt(n3)));
        //5----------------------------------------------------
        System.out.println("Introdueix la longitut del radi i"
                + " et dire la longitut de la circumferencia: ");
        cercle = in.nextDouble();
        radi = 2 * Math.PI * cercle;
        System.out.printf("La longitut de la circumferencia es: %.2f \n ", radi);
        //6----------------------------------------------------
        System.out.println("Introdueix 2 catets:");
        radi = in.nextDouble();
        cercle = in.nextDouble();
        hyp = Math.sqrt((Math.pow(radi, 2)) + (Math.pow(cercle, 2)));
        System.out.printf("La hipotenusa es %.2f \n", hyp);
    }
}
