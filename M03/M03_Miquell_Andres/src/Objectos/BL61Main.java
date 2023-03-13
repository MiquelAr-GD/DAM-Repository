/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Objectos;

import java.util.Scanner;

public class BL61Main {
     public static void main(String[] args) {
         Scanner in = new Scanner(System.in);
         BL61[] Films = new BL61[5];
         String dir, ty, ti;
         for (int i = 0; i < Films.length; i++) {
             System.out.println("Intro nom del director:");
         dir = in.nextLine();
         System.out.println("Intro tipus de pelicula:");
         ty = in.nextLine();
         System.out.println("Intro titol de pelicula:");
         ti = in.nextLine();        
         Films[i] = new BL61(dir, ty ,ti);       
         }

         for (int i = 0; i < Films.length; i++) {
             System.out.println(Films[i].getDirector() + "  " + Films[i].getType() + "  " + Films[i].getTitle());
         }
     }
}
