
package Metodos;

import java.util.Scanner;

/**
 *
 * @author MiquelA
 */
public class a1 {

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int num = -1;
        while (num != 0) {      
            num = menu(in);
            System.out.println("");
            System.out.println("");
        }
    }

    private static int menu(Scanner in) {
        System.out.println("Escull una forma geometrica: ");
        System.out.println("1 Cercle");
        System.out.println("2 Triangle");
        System.out.println("3 Rectanble");
        System.out.println("0 Sortir");
        int num = in.nextInt();
        if(num != 0) System.out.println("Introdueix: ");
        switch (num) {
            case 1:
                System.out.println("Radi");
                int radi = in.nextInt();
                cercle(radi);
                break;
            case 2:
                System.out.println("Base i altura");
                int base = in.nextInt(),
                 altura = in.nextInt();
                triangle(base, altura);
                break;
            case 3:
                System.out.println("Base i altura");
                base = in.nextInt();
                altura = in.nextInt();
                rectangle(base, altura);
                break;
            default:
                break;
        }
        return num;
    }

    private static void cercle(int radi) {
        int area = (int) (Math.PI * Math.pow(radi, 2));
        System.out.println("L'area es: " + area);
    }

    private static void triangle(int base, int altura) {
        int area = (base * altura) / 2;
        System.out.println("L'area es: " + area);
    }

    private static void rectangle(int base, int altura) {
        int area = (base * altura) / 2;
        System.out.println("L'area es: " + area);
    }
}