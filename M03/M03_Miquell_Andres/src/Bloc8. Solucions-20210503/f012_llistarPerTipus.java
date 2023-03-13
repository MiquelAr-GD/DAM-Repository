package Bloc8;

import java.io.File;

public class f012_llistarPerTipus {

    public static void main(String[] args) {
        inici();
    }

    public static void inici() {
        String pathBase = "/home/vlino/Dropbox/java_15_16";
        File carpeta = new File(pathBase);
        File[] arrayElements = carpeta.listFiles();
        System.out.println("El contingut de " + carpeta.getAbsolutePath() + " és:");
        //Per recórrer un array, s'usa un bucle
        for (File f : arrayElements) {
            if (f.isDirectory()) {
                System.out.print("[DIR] ");
            } else {
                System.out.print("[FIT] ");
            }
            System.out.println(f.getName());
        }
    }
}
