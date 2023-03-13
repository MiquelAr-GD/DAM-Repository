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
public class Array2 {

    public static void main(String[] args) {
        int media=0;
        String cadena = "12;45;78;65;98;14";
        String[] parts = cadena.split(";");
        int [] num = new int[parts.length];
        for (int i = 0; i < parts.length; i++) {
            System.out.println(parts[i]);
            num[i] = Integer.parseInt(parts[i]);
            media = media + num[i];
        }
        
        media = media / num.length;
        System.out.println(media);
    }
}
