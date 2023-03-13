/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Files;

import java.io.File;

/**
 *
 * @author MiquelA
 */
public class a14 {
     public static void main(String[] args) {
         String ruta = "C:\\Users\\MiquelA\\Documents";
         File carpeta = new File(ruta);
         llistar(carpeta, ruta);
     }
     public static void llistar(File carpeta, String ruta){
         File [] carpetes = carpeta.listFiles();
         System.out.println("El contingut de: " + carpeta.getAbsolutePath() + "es: ");
         for (int i = 0; i < carpetes.length; i++) {
             File carpInt = carpetes[i];
             if(carpInt.isFile()){
                 String nom = carpInt.getName();  
                 System.out.println(nom);
                 String nomNou = ruta + "\\" + nom.substring(0,nom.lastIndexOf(".")) + ".doc";
                 File noma = new File(nomNou);
                 carpInt.renameTo(noma);
                 System.out.println(carpInt.getName());
             }             
         }
         
     }

}