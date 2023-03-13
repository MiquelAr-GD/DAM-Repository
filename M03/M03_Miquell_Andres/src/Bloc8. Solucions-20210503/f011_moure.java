package Bloc8;

import java.io.File;

public class f011_moure {

    public static void main(String[] args) {
        inici();
    }

    public static void inici() {
        String pathBase = "/home/vlino/Dropbox/java_15_16/Programacio UF3";
        String pathdir = pathBase.concat("/Fotos");
        String pathdirNew = pathBase.concat("/Fotos2");
        String pathfile = pathBase.concat("/Fotos2/foto.txt");
        String pathfileNew = pathBase.concat("/Fotos2/foto2.txt");
        
        File origenCarpeta = new File(pathdir);
        File destiCarpeta = new File(pathdirNew);
        File origenDocument = new File(pathfile);
        File destiDocument = new File(pathfileNew);
        
        boolean resultat = origenCarpeta.renameTo(destiCarpeta);
        System.out.println("S'ha mogut i reanomenat la carpeta? " + resultat);
        resultat = origenDocument.renameTo(destiDocument);
        System.out.println("S'ha mogut el document? " + resultat);
        
        
    }
}
