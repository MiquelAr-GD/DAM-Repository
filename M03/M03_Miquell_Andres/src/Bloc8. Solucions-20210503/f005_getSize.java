package ClasseFile;

import java.io.File;

public class f005_getSize {

    public static void main(String[] args) {
        String path = "/home/vlino/Dropbox/java_15_16/Programacio UF3/src/ClasseFile/f001_fitxersDeDirectori.java";

        File file = new File(path);
        if (file.exists()) {
            System.out.println(filesize_in_Bytes(file));
            System.out.println(filesize_in_kiloBytes(file));
            System.out.println(filesize_in_megaBytes(file));
        } else {
            System.out.println("File doesn't exist");
        }

    }

    private static String filesize_in_megaBytes(File file) {
        return (double) file.length() / (1024 * 1024) + " mb";
    }

    private static String filesize_in_kiloBytes(File file) {
        return (double) file.length() / 1024 + "  kb";
    }

    private static String filesize_in_Bytes(File file) {
        return file.length() + " bytes";
    }
}
