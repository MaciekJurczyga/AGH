import java.io.*;
import java.nio.file.AccessDeniedException;

public class FIleCopy {
    public static void copy(String file1, String file2 ){
    File sourceFile;
    File targetFile;
    try {
        sourceFile = new File(file1);
        if (sourceFile.isDirectory()) {
            System.out.println("Plik" + file1 + "jest katalogiem");
            System.exit(0);
        }
        targetFile = new File(file2);
        if (!targetFile.exists()) {
            if (!targetFile.createNewFile()) {
                System.out.println("nie udało się utowrzyć pliku");
                System.exit(0);
            }
        }
        else if (targetFile.isDirectory()) {
            targetFile = new File(targetFile, file2);

            if (!targetFile.createNewFile()) {
                System.out.println("nie udało się utowrzyć pliku");
                System.exit(0);
            }
        }
            try(InputStream inStream = new FileInputStream(file1);
                OutputStream outStream = new FileOutputStream(file2)){
                    byte [] buffer = new byte[4096];
                    int length;
                    while((length = inStream.read(buffer)) != -1){
                        outStream.write(buffer, 0, length);
                    }
        }
        catch(FileNotFoundException e){
            System.out.println("plik nieznaleziony");
            System.exit(0);
        }
        catch(AccessDeniedException e){
            System.out.println("Brak uprawnien do zapisu pliku");
            System.exit(0);
        }
        catch(IOException e){
            System.out.println("Wystąpił nieoczekiwany błąd przy zapisie pliku");
            System.exit(0);
        }


    }
    catch(IOException e){
        System.out.println("wystąpił nieoczewkiany błąd");
        System.exit(0);
    }
    }

    public static void main(String[] args){
        if(args.length != 2) {
        System.out.println("niepoprawna ilość argumentów");
        }
        else{
        copy("abc.txt","dce.txt");
        }
    }

}

