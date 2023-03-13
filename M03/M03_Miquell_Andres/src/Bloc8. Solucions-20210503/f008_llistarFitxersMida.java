package ClasseFile;

import java.io.File;
import java.util.Scanner;

public class f008_llistarFitxersMida {

    public static final int KB = 1024;

    public static void main(String[] args) {
        inici();
    }

    public static void inici() {
        File rutaCarpeta = llegirNomCarpeta();
        mostraFitxers(rutaCarpeta, 500);
    }

    public static File llegirNomCarpeta() {
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

    public static void mostraFitxers(File f, int mida) {
        File[] elements = f.listFiles();
        System.out.println("Els fitxers de més de 500 Kb són:");
        for (int i = 0; i < elements.length; i++) {
            //es pot accedir directament a la ruta usant la posició de l'array.
            if (elements[i].isFile()) {
                if (elements[i].length() > 500 * KB) {
                    System.out.println(elements[i].getName());
                }
            }
        }
    }

}