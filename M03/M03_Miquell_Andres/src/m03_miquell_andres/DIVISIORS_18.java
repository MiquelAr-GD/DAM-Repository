/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package m03_miquell_andres;


/**
 *
 * @author MiquelA
 */
public class DIVISIORS_18 {

    public static void main(String[] args) {
        String x = "109876543210";
        for (int i = 0; i < 5; i++) {
            if (i == 1) {
                x = x.substring(2);
            } else if (i == 0) {
            } else {
                x = x.substring(1);
            }
            System.out.println(x);
        }
    }
}
