/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javaapplication2;


/**
 *
 * @author MiquelA
 */
public class ExamenUF1MiquelAndres {

    public static void main(String[] args) {
        //Declaracio de variables i arrays
        String[] client = new String[2];
        client[0] = "Home;Joan;García Dembes;23.453.221J;3500,56";
        client[1] = "Dona;Mariona;López Deus;23.124.110H;-234";
        float num = 0, saldo = 0;
        for (int i = 0; i < client.length; i++) {
            //Pasar la cel·la del array a string per poder separar-ho
            String ci = "" + client[i];
            String[] dades = ci.split(";");
            //Control si es home o dona per saber com dirigir-se
            if (dades[0].equalsIgnoreCase("Home")) {
                System.out.println("Estimat " + dades[1]);
            } else if (dades[0].equalsIgnoreCase("Dona")) {
                System.out.println("Estimda " + dades[1]);
            }
            //Mostrada de dades de la persona i tracta de saldo
            System.out.print("Les teves dades són: " + dades[1] + " " + dades[2] + "el teu DNI és: " + dades[3]);
           //Bucle per poder operar amb comes
            if (dades[4].contains(",")) {
                dades[4] = dades[4].replace(",", ".");
            }
            //Bucle en cas de saldo negatiu i calcul del saldo de la empresa
            if (dades[4].contains("-")) {
                dades[4] = dades[4].substring(1, dades[4].length());
                System.out.println(" i tens un saldo en conta de " + dades[4] + "€");
                num = Float.parseFloat(dades[4]);
                saldo = saldo - num;
            } else {
                System.out.println(" i tens un saldo a favor de " + dades[4] + "€");
                num = Float.parseFloat(dades[4]);
                saldo = saldo + num;
            }
            System.out.println("Salutacions");
            System.out.println("");
            System.out.println("");
        }
        //Mostra per pantalla del saldo de la empresa
        if (saldo > 0) {
            System.out.println("El saldo de la empresa es positiu, i es " + saldo);
        } else {
            System.out.println("El saldo de la empresa es negatiu, i es " + saldo);
        }
    }
}
