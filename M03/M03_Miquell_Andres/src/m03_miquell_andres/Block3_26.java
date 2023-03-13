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
public class Block3_26 {

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        String par1, par2, par3;
        System.out.println("Introdueix la una frase");
        par1 = in.nextLine();
        System.out.println("Introdueix la part que vols buscar");
        par2 = in.nextLine();
        System.out.println("Introdueix per que ho vols substituir");
        par3 = in.nextLine();
        
        int i = par2.length();
        int j = par1.indexOf(par2);
        par1 = par1.substring(0, j) + par3 + par1.substring(j + i) ;
        System.out.println(par1);
    }
}
