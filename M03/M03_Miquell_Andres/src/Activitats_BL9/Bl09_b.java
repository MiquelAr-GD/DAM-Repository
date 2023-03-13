/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Activitats_BL9;

import java.io.*;
import java.util.*;

/**
 *
 * @author MiquelA
 */
public class Bl09_b {

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        System.out.println("Intro primer num: ");
        int num = in.nextInt();
        String ruta = "C:\\Users\\MiquelA\\Documents\\NetBeansProjects\\FilesTry";
        String nums = "";
        try {
            File arxiu = new File(ruta + "\\BL09_b.txt");
            if (!arxiu.exists()) {
                arxiu.createNewFile();
            }
            while (num != 0) {
                System.out.println("Intro nou num");
                nums = nums + num + "-";
                num = in.nextInt();
            }
            nums = nums.substring(0, nums.length() - 1);
            escriureFitxer(arxiu, nums);
            System.out.println("Aixi ha quedat el fitxer un cop tencat");
            llegirFitxer(arxiu);
            ferMijana(nums);
        } catch (IOException e) {
            System.out.println(e);
        }
    }

    private static void escriureFitxer(File arxiu, String nums) {
        try {
                BufferedWriter entrada = new BufferedWriter(new FileWriter(arxiu));
            entrada.write(nums);
            entrada.close();
        } catch (IOException e) {
            System.out.println(e);
        }
    }

    private static void llegirFitxer(File arxiu) {
        try {
            BufferedReader entrada = new BufferedReader(new FileReader(arxiu));
            String contingut = entrada.readLine();
            while (contingut != null) {
                System.out.println(contingut);
                contingut = entrada.readLine();
            }
            entrada.close();
        } catch (FileNotFoundException a) {
            System.out.println(a);
        } catch (IOException e) {
            System.out.println(e);
        }
    }

    private static void ferMijana(String contingut) {
        String[] mitjana = contingut.split("-");
        double sum = 0;
        for (int i = 0; i < mitjana.length; i++) {
            sum = sum + Double.parseDouble(mitjana[i]);
        }
        System.out.println("La mitja dels numeros es: ");
        System.out.println(sum / mitjana.length);
    }
}
