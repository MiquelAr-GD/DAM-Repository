package ClasseFile;

import java.io.File;

public class f003_checkPermissions {

    public static void main(String[] args) {
        String path = "/home/vlino/Dropbox/java_15_16/Programacio UF3/src/ClasseFile/f001_fitxersDeDirectori.java";
        // Create a File object
        File my_file_dir = new File(path);
        if (my_file_dir.canWrite()) {
            System.out.println(my_file_dir.getAbsolutePath() + " can write.\n");
        } else {
            System.out.println(my_file_dir.getAbsolutePath() + " cannot write.\n");
        }
        if (my_file_dir.canRead()) {
            System.out.println(my_file_dir.getAbsolutePath() + " can read.\n");
        } else {
            System.out.println(my_file_dir.getAbsolutePath() + " cannot read.\n");
        }
    }
}
