import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Properties;
import java.util.Scanner;
import java.util.Random;
public class MultiplicationTable {
    public static void parseAndRun(String[] arguments) {
        int[] intValues = new int[5];
        try {
            for (int i = 0; i < arguments.length; i++) {
                intValues[i] = Integer.parseInt(arguments[i]);
            }
            mulitiply(intValues);
        }
        catch(Exception e){
            System.out.println("Error while parsing, check the correctness of values in properites file");
        }
    }


    public static void mulitiply(int[] Values){
        int userAsnwer = 0;
        float count = 0;
        float countGoodAns = 0;
        int randOne;
        int randTwo;
        int minValue = Values[0];
        int maxValue = Values[1];
        float percent = (float)Values[2]/100;
        int minRep = Values[3];
        int maxRep = Values[4];
        while(count < maxRep){
            count++;
            Random random = new Random();
            randOne = random.nextInt(maxValue - minValue +1) + minValue;
            randTwo = random.nextInt(maxValue - minValue +1) + minValue;
            try{
                Scanner scanner = new Scanner(System.in);
                System.out.println((int)count + ". "+ randOne + " * " + randTwo + " = ?");
                userAsnwer = scanner.nextInt();
            }
            catch(Exception e){
                System.out.println("Error while entering a number");
                System.exit(0);
            }
            if(userAsnwer == randOne*randTwo){
                countGoodAns++;
            }
            if(count >= minRep && (countGoodAns/count)> percent){
                System.out.println("Positive result, your score is: " + (int)((countGoodAns/count)*100)  + "%");
                System.exit(0);
            }
        }
        System.out.println("you failed, your score is: "+ (countGoodAns/count)*100 +"%");
        



    }

    public static void main(String[] args){
        String filePath = "config.properites";
        File file = new File(filePath);
        Properties properties = new Properties();
        String[] arguments = new String[5];
        if(file.exists()){
            try(FileInputStream inputStream = new FileInputStream(filePath)){
                properties.load(inputStream);
                arguments[0] = (String)properties.get("minValue");
                arguments[1] = (String)properties.get("maxValue");
                arguments[2] = (String)properties.get("percent");
                arguments[3] = (String)properties.get("minRep");
                arguments[4] = (String)properties.get("maxRep");
            }
            catch(IOException e){
                System.out.println(e.getMessage());
            }
        }
        else{
            properties.setProperty("minValue" , "1");
            properties.setProperty("maxValue" , "10");
            properties.setProperty("percent" , "70");
            properties.setProperty("minRep" , "10");
            properties.setProperty("maxRep" , "25");

            arguments[0] = (String)properties.get("minValue");
            arguments[1] = (String)properties.get("maxValue");
            arguments[2] = (String)properties.get("percent");
            arguments[3] = (String)properties.get("minRep");
            arguments[4] = (String)properties.get("maxRep");

             try{
                FileOutputStream outputStream = new FileOutputStream(filePath);
                properties.store(outputStream, "Prop conf");

            }
            catch(IOException e){
                System.out.println(e.getMessage());
            }

        }
        parseAndRun(arguments);
    }
}
