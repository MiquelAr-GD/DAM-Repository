package ClasseFile;

import java.io.File;

public class f004_checkDirectoriVsFile {

    public static void main(String[] args) {
        String path = "/home/vlino/Dropbox/java_15_16/Programacio UF3/src/ClasseFile/f001_fitxersDeDirectori.java";
   // Create a File object
        File my_file_dir = new File(path);
        if (my_file_dir.isDirectory()) {
            System.out.println(my_file_dir.getAbsolutePath() + " is a directory.\n");
        } else {
            System.out.println(my_file_dir.getAbsolutePath() + " is not a directory.\n");
        }
        // isFile donarà true si és un 'normal file'
        // what is a normal file? Any non-directory file created by a Java application is guaranteed to be a normal file or satisfies other system-dependent criteria.
        // so do not use this function. you could use File.exists and !File.isDirectory to achieve this function.        

        if (my_file_dir.isFile()) {
            System.out.println(my_file_dir.getAbsolutePath() + " is a file.\n");
        } else {
            System.out.println(my_file_dir.getAbsolutePath() + " is not a file.\n");
        }
    }
}
