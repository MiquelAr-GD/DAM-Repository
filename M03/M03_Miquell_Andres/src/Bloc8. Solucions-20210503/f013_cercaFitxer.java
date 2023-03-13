package Bloc8;

import java.io.File;
import java.util.Scanner;

public class f013_cercaFitxer {

    public static void main(String[] args) {
        inici();
    }

    public static void inici() {
        String nomFitxer = preguntaNomFitxer();
        File rutaCarpeta = llegirRutaCarpeta();
        System.out.println("----------");
        cerca(rutaCarpeta, nomFitxer);
    }

    /**
     * A partir d'una carpeta, cerca si hi ha un fitxer amb aquest nom dins la
     * pròpia carpeta i les seves subcarpetes.
     *
     * @param carpeta Carpeta on fer la cerca
     * @param nom Nom del fitxer a cercar
     */
    public static void cerca(File carpeta, String nom) {
        File[] elements = carpeta.listFiles();
        for (int i = 0; i < elements.length; i++) {
            if (elements[i].isDirectory()) {
                cerca(elements[i], nom);
            } else {
                String nomElement = elements[i].getName();
                if (nomElement.equalsIgnoreCase(nom)) {
                    System.out.println("S'ha trobat el fitxer a: " + elements[i].getAbsolutePath());
                }
            }
        }

    }

    /**
     * Pregunta a l'usuari el nom d'un fitxer (un simple text)
     *
     * @return Text del nom del fitxer
     */
    public static String preguntaNomFitxer() {
        System.out.println("Quin és el nom del fitxer a cercar?");
        Scanner lector = new Scanner(System.in);
        return lector.nextLine();
    }

    /**
     * Pregunta a l'usuari el nom de la carpeta, i d'aquest obté una ruta.
     *
     * @return La ruta associada al text que ha escrit l'usuari.
     */
    public static File llegirRutaCarpeta() {
        //Un tipus compost es pot deixar sense inicialitzar posant "null"
        File f = null;
        boolean preguntar = true;
        Scanner lector = new Scanner(System.in);
        while (preguntar) {
            System.out.println("Escriu el nom d'una ruta a una carpeta: ");
            String nomCarpeta = lector.nextLine();
            f = new File(nomCarpeta);
            if (f.isDirectory()) {
                preguntar = false;
            } else {
                System.out.println("Aquesta carpeta no existeix...");
            }
        }
        return f;
    }
}