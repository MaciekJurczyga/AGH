import java.util.Scanner;


public class DrawTriangle {
    public static void draw(int height){
        for(int i =0; i<height; i++){
            for(int j =0; j<= height-i-1; j++){
                System.out.print(" " );
            }
            for( int k=0; k< (2*i+1); k++){
                System.out.print("#");
            }
                System.out.println();
        }

    }

    public static void main(String[] args){
        try{
            Scanner scanner = new Scanner(System.in);
            System.out.println("enter the height of the triangle: ");
            int height = scanner.nextInt();
            if(height < 2){
                System.out.println("This value does not make sense!");
            }
            else{
                draw(height);
            }
            scanner.close();
        }
        catch(Exception e){
            System.out.println("Error while entering the height");
        }

    }
}
