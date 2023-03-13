package Bloc8;

import java.io.File;
import java.util.Scanner;

public class f014_canviaExtensio {

    public static void main(String[] args) {
        inici();
    }

    public static void inici() {
        System.out.print("Escriu l'extensió origen i destí: ");
        Scanner lector = new Scanner(System.in);
        String origen = lector.next();
        String desti = lector.next();

        // System.getProperty() -> Obtiene una propiedad del sistema indicada mediante la clave.
        // user.dir -> It's the directory where java was run from

        String dirTreball = System.getProperty("user.dir");
        File rutaTreball = new File(dirTreball);

        File[] elements = rutaTreball.listFiles();

        for (int i = 0; i < elements.length; i++) {
            if (elements[i].isFile()) {
                canviaExtensio(elements[i], origen, desti);
            }
        }
    }

    public static void canviaExtensio(File ruta, String or, String des) {
        String nom = ruta.getName();
        int punt = nom.lastIndexOf(".");
        if (punt >= 0) {
            String extOrigen = nom.substring(punt + 1, nom.length());
            if (extOrigen.equals(or)) {
                String nouNom = nom.substring(0, punt + 1) + des;
                nouNom = ruta.getParent() + File.separator + nouNom;
                File novaRuta = new File(nouNom);
                ruta.renameTo(novaRuta);
            }
        }
    }

}

/* 
You use File.separator because someday your program might run on a platform 
developed in a far-off land, a land of strange things and stranger people, 
where horses cry and cows operate all the elevators. 
In this land, people have traditionally used the ":" character as a 
file separator, and so dutifully the JVM obeys their wishes
*/