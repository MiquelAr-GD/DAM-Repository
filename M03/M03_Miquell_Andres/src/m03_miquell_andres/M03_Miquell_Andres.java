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
public class M03_Miquell_Andres {

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int segons1, segons, minuts, minuts1, hores;
        
        System.out.println("Introdueix els segons: ");
        segons = in.nextInt();
        
        //Operacions
        
        minuts = segons/60;
        hores = minuts/60;
        
        //Residus
        
        minuts1 = minuts%60;       
        segons1 = segons%60;     
         
        //Resultats
        
        System.out.println("Son: " + hores + "H " + minuts1 + "m " + segons1 + "s ");
    }
    
}
