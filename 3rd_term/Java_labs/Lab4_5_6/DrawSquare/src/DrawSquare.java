import java.util.Scanner;
public class DrawSquare {
    public static void draw(int size){
        for(int i=0; i<size; i++){
            if(i==0 || i == (size-1)) {
                for (int j = 0; j < size; j++) {
                    System.out.print("#");
                }
                System.out.println();
            }
            else{
                for(int j=0; j < size; j++){
                    if(j==0 || j == (size-1)){
                        System.out.print("#");
                    }
                    else{
                        System.out.print(" ");
                    }
                }
            System.out.println();
            }
        }
    }

    public static void main(String[] args){
        try{
            Scanner scanner = new Scanner(System.in);
            System.out.println("give the size of a square");
            int size = scanner.nextInt();
            if(size < 2){
                System.out.println("Given value does not make sense");
                System.exit(0);
            }
            else{
                draw(size);
            }
            scanner.close();
        }
        catch(Exception e){
            System.out.println("Error while entering the size of square");
        }

    }
}
