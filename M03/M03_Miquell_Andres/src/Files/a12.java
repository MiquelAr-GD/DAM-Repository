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
public class a12 {
     public static void main(String[] args) {
         String ruta = "C:\\Users";
         File carpeta = new File(ruta);
         llistar(carpeta);
     }
     public static void llistar(File carpeta){
         File [] carpetes = carpeta.listFiles();
         System.out.println("El contingut de: " + carpeta.getAbsolutePath() + "es: ");
         for (int i = 0; i < carpetes.length; i++) {
             File carpInt = carpetes[i];
             if(carpInt.isFile()){
                 System.out.println("F" + carpInt.getAbsolutePath());
             } else if (carpInt.isDirectory()) {
                 System.out.println("D" + carpInt.getAbsolutePath());
             }
             
         }
     }

}
