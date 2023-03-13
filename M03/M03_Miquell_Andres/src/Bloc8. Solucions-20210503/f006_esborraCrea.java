package ClasseFile;

import java.io.File;

public class f006_esborraCrea {

    public static void main(String[] args) {
        inici();
    }

    public static void inici() {
        File f = new File("Temp");
        if (f.isDirectory()) {
            boolean ok = f.delete();
            if (ok) {
                System.out.println("S'ha esborrat la carpeta " + f.getAbsolutePath());
            } else {
                System.out.println("Error esborrant la carpeta " + f.getAbsolutePath());
            }
        } else {
            boolean ok = f.mkdir();
            if (ok) {
                System.out.println("S'ha creat la carpeta " + f.getAbsolutePath());
            } else {
                System.out.println("Error creant la carpeta " + f.getAbsolutePath());
            }
        }

    }
}
