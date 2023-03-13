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
public class Block3_25 {

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int num, i;
        String nums, numll = "";
        System.out.println("Intro num:");
        num = in.nextInt();
        nums = Integer.toString(num);
        for (i = 0; i < nums.length(); i++) {
            numll = numll + nums.charAt(i) + "a";
        }
        System.out.println(numll);
    }
}
