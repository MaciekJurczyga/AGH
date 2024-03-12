import java.util.Date;

public class Weekend2 {
    public static void main(String[] args){
        Date data = new Date();
        String days[] = {"Niedziela", "Poniedziałek", "Wtorek", "Środa", "Czwartek", "Piątek", "Sobota"};
        int day  = data.getDay();
        switch (day){
            case 1:
                System.out.println("Dziś jest" + days[day] +  "do weekendu pozstało" + (5-day) + "dni");
                break;
            case 2:
                System.out.println("Dziś jest" + days[day] +  "do weekendu pozstało" + (5-day) + "dni");
                break;
            case 3:
                System.out.println("Dziś jest" + days[day] +  "do weekendu pozstało" + (5-day) + "dni");
                break;
            case 4:
                System.out.println("Dziś jest" + days[day] +  "do weekendu pozstało" + (5-day) + "dni");
                break;
            case 5:
                System.out.println("Dziś jest" + days[day] +  "do weekendu pozstał" + (5-day) + "dzień");
                break;
            default:
                System.out.println("mamy weekend");

        }

    }
}
