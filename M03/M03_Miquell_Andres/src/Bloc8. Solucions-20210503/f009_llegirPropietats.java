package ClasseFile;

import java.io.File;
import java.util.Date;

public class f009_llegirPropietats {

    public static void main(String[] args) {
        inici();
    }

    public static void inici() {
        String path = "/home/vlino/Dropbox/java_15_16/Programacio UF3/src/ClasseFile/f001_fitxersDeDirectori.java";
        File document = new File(path);
        System.out.println(document.getAbsoluteFile());
        //S'usa el tipus composta Date per transformar mil·lisegons a data real
        Date data = new Date(document.lastModified());
        System.out.println("Darrera modificació: " + data);
        System.out.println("Mida: " + document.length());
    }
}