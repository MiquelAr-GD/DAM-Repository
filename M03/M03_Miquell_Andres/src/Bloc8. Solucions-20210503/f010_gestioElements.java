package Bloc8;

import java.io.File;
import java.io.IOException;

public class f010_gestioElements {

    public static void main(String[] args) throws IOException {
        inici();
    }

    public static void inici() throws IOException {
        String pathdir = "/home/vlino/Dropbox/java_15_16/Programacio UF3/Fotos";
        String pathfile = "/home/vlino/Dropbox/java_15_16/Programacio UF3/Fotos/foto.txt";

        File carpeta = new File(pathdir);
        File document = new File(pathfile);

        boolean resultat = carpeta.mkdir();
        if (resultat) {
            System.out.println("Creada carpeta " + carpeta.getName() + "? " + resultat);
            document.createNewFile();
            if (document.exists()) {
                System.out.println("Creat fitxer " + document.getName());
            }

        } else {
            boolean delCarpeta = carpeta.delete();
            if (delCarpeta) {
                System.out.println("Esborrada carpeta " + carpeta.getName() + "? " + delCarpeta);
            } else {
                System.out.println("No s'ha pogut esborrar. Està buida ?");
            }

            if (document.exists()) {
                System.out.println("Existeix fitxer " + document.getName() + ". L'esborrem");
                boolean delFitxer = document.delete();
                System.out.println("Esborrat fitxer " + document.getName() + "? " + delFitxer);
                System.out.println("I ara esborrem la carpeta");
                delCarpeta = carpeta.delete();
                if (delCarpeta) {
                    System.out.println("Esborrada carpeta " + carpeta.getName() + "? " + delCarpeta);
                } else {
                    System.out.println("No s'ha pogut esborrar. Està buida ?");
                }
            }
            ;
        }
    }
}
