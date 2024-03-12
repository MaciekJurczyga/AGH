
import java.util.Date;

public class Weekend {
    public static void main(String[] args){
        Date data = new Date();
        int day = data.getDay();
        if ( day == 6 || day == 0){
            System.out.println("jest weekend");
        }
        else{
            System.out.println("dni do weekendu " + (5-day));
        }
    }

}

