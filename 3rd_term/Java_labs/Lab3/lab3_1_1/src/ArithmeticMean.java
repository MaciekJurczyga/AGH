public class ArithmeticMean {
    public static void main (String[] args) {
        if (args.length == 0) {
            System.out.println("Brak argumentów programu ");
            return;
        }
        if (args.length == 1) {
            System.out.println("Podano tylko jedną wartość: " + args[0]);
            return;
        }
        int sum = 0;
        for (String s : args) {
            sum += Integer.parseInt(s);
        }
        int modulo = sum % args.length;
        if (modulo == 0){
            System.out.println("średnia arytmetyczna liczb wynosi: " + sum/args.length);
        }
        else{
            System.out.println("średnia arytmetyczna liczb wynosi: " + sum/args.length + ", reszta " + modulo);
        }
    }
}
