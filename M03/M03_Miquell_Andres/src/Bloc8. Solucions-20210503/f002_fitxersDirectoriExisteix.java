package ClasseFile;

import java.io.File;

public class f002_fitxersDirectoriExisteix {

    public static void main(String[] args) {
        // Create a File object
        String path = "/home/vlino/Dropbox/java_15_16/Programacio UF3/src/ClasseFile/f001_fitxersDeDirectori.java";
        File my_file_dir = new File(path);
        if (my_file_dir.exists()) {
            System.out.println("The directory or file exists.\n");
        } else {
            System.out.println("The directory or file does not exist.\n");
        }
    }
}
