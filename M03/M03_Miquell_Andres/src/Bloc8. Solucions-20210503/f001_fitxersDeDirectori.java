package ClasseFile;

import java.io.File;

public class f001_fitxersDeDirectori {
     public static void main(String a[])
     {
        File file = new File("/home/vlino/Dropbox/java_15_16/");
        String[] fileList = file.list();

//        for ( int i = 0 ; i < fileList.length ; i++){
//            System.out.println(fileList[i]);
//        }        
        
        for(String name:fileList){
            System.out.println(name);
        }
        
        
    }
}
