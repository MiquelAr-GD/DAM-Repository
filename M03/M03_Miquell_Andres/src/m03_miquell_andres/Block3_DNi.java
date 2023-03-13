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
public class Block3_DNi {

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int num, i, DNI;
        char nume;
        String numll = "", numt, codi = "TRWAGMYFPDXBNJZSQVHLCKE";
        System.out.println("Intro DNI;");
        numt = in.nextLine();
        for (i = 0; i < numt.length(); i++) {
            nume = numt.charAt(i);
            if (nume == '0' || nume == '1' || nume == '2' || nume == '3' || nume == '4' || nume == '5' || nume == '6' || nume == '7' || nume == '8' || nume == '9') {
                numll = numll + nume;
            }
        }
        num = Integer.parseInt(numll);
        DNI = num % 23;
        nume = codi.charAt(DNI);
        numt = numll + nume;
        System.out.println(numt);

    }
}
