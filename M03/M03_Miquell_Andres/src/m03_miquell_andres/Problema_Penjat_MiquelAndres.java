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
public class Problema_Penjat_MiquelAndres {

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int intents, i, err = 0;
        String frase, f1 = "", f2;
        char lletra, m = 'a';
        //"Menu d'inici o fi del joc"
        while (m != '0') {
            System.out.println("Prem :");
            System.out.println("1. Per començar");
            System.out.println("0. Per acabar.");
            m = in.nextLine().charAt(0);
            if (m != '0') {
                System.out.println("Introdueix una paraula: ");
                frase = in.nextLine();
                for (i = 0; i < 3; i++) {
                    System.out.println("");
                }
                System.out.println("Comença el joc!");
                //Mostra tants guions com lletres tingui la paraula introduida
                for (i = 0; i < frase.length(); i++) {
                    f1 = f1 + '-';
                }
                System.out.println(f1);
                f2 = f1;
                for (i = 0; i < 3; i++) {
                    System.out.println("");
                }
                for (intents = 7; intents > 0; i--) {
                    System.out.println("");
                    //Comprobant de si s'ha acabat el joc o no
                    if (f1.equals(frase)) {
                        System.out.println("Has guanyat!");
                        intents = 0;
                    } else {
                        System.out.println("Iintrodueix una lletra:");
                        lletra = in.nextLine().charAt(0);
                        //Bucle per comporbar si la lletra hi es, i posar-la
                        if (lletra == ' ') {
                        } else {
                            for (i = 0; i < frase.length(); i++) {
                                if (lletra == frase.charAt(i)) {
                                    f2 = f2.substring(0, i) + lletra + f2.substring(i + 1);
                                }
                            }
                        }
                        // Mostrar missatge si la lletra es bona o si no
                        if (!f2.equals(f1)) {
                            System.out.println("");
                            System.out.println("Es bona!");
                            System.out.println("");
                            System.out.println(f2);
                            f1 = f2;
                        } else {
                            System.out.println("");
                            System.out.println("No hi es.");
                            System.out.println("");
                            intents--;
                            err++;
                            
                            //Mostrar en pantalla penjat
                            switch (err) {
                                case 1:
                                    System.out.println("");
                                    System.out.println("                                ");
                                    System.out.println("                                ");
                                    System.out.println("                                ");
                                    System.out.println("                                ");
                                    System.out.println("                                ");
                                    System.out.println("                                ");
                                    System.out.println("   ____||_____                  ");
                                    break;
                                case 2:
                                    System.out.println("");
                                    System.out.println("                                ");
                                    System.out.println("       ||                       ");
                                    System.out.println("       ||                       ");
                                    System.out.println("       ||                       ");
                                    System.out.println("       ||                       ");
                                    System.out.println("       ||                       ");
                                    System.out.println("   ____||_____                  ");
                                    break;
                                case 3:
                                    System.out.println("");
                                    System.out.println("       //_________\\            ");
                                    System.out.println("       ||                       ");
                                    System.out.println("       ||                       ");
                                    System.out.println("       ||                       ");
                                    System.out.println("       ||                       ");
                                    System.out.println("       ||                       ");
                                    System.out.println("   ____||_____                  ");
                                    break;
                                case 4:
                                    System.out.println("");
                                    System.out.println("       //_________\\            ");
                                    System.out.println("       ||          |            ");
                                    System.out.println("       ||         (O)           ");
                                    System.out.println("       ||                       ");
                                    System.out.println("       ||                       ");
                                    System.out.println("       ||                       ");
                                    System.out.println("   ____||_____                  ");
                                    break;
                                case 5:
                                    System.out.println("");
                                    System.out.println("       //_________\\            ");
                                    System.out.println("       ||          |            ");
                                    System.out.println("       ||         (O)           ");
                                    System.out.println("       ||          |            ");
                                    System.out.println("       ||          |            ");
                                    System.out.println("       ||                       ");
                                    System.out.println("   ____||_____                  ");
                                    break;
                                case 6:
                                    System.out.println("");
                                    System.out.println("       //_________\\            ");
                                    System.out.println("       ||          |            ");
                                    System.out.println("       ||         (O)           ");
                                    System.out.println("       ||          |            ");
                                    System.out.println("       ||          |            ");
                                    System.out.println("       ||         //            ");
                                    System.out.println("   ____||_____                  ");
                                    break;
                                case 7:
                                    System.out.println("");
                                    System.out.println("       //_________\\            ");
                                    System.out.println("       ||          |            ");
                                    System.out.println("       ||         (O)           ");
                                    System.out.println("       ||       .--|--.         ");
                                    System.out.println("       ||          |            ");
                                    System.out.println("       ||         //            ");
                                    System.out.println("   ____||_____                  ");
                                    break;
                                default:
                                    break;
                            }
                            if (err == 7 || intents == 0) {
                                System.out.println("HAS PERDUT!");
                            } else {
                                System.out.println("Torna a intentar-ho, portes " + err + " errors i et queden " + intents + " intents");
                            }
                        }
                    }
                }
            }
        }
    }
}
