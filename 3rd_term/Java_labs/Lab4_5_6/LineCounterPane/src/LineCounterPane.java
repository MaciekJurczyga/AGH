import javax.swing.*;
import java.io.*;
public class LineCounterPane {
    private static int counter = 0;
    public static void count(String fileName){
        try(BufferedReader file = new BufferedReader(new FileReader(fileName))){
            while(file.readLine() != null){
                counter++;
            }
            System.out.println("Liczba wierszy w pliku " + fileName + " wynosi: " + counter);

        }
        catch(FileNotFoundException e){
            System.out.println("Plik nie znaleziony");
            System.exit(0);
        }
        catch(IOException e){
            System.out.println("błąd odczytu pliku" + e.getMessage());
            System.exit(0);
        }
    }

    public static void main(String[] args) {
        String fileName;
        try {
            fileName = JOptionPane.showInputDialog(null, "podaj nazwe pliku:");
            count(fileName);
        }
        catch(Exception e){
            System.out.println("wystąpił nieoczekiwany błąd");
            System.exit(0);
        }




    }
}