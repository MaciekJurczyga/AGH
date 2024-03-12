public class FloatArithmeticMean {
    public static void main(String[] args){
        if (args.length == 0){
            System.out.println("Brak argumentów programu");
            System.exit(0);
        }
        double fsum = 0;
        for (int i = 0; i < args.length; i++){
            fsum += Double.parseDouble(args[i]);
            System.out.printf("%10.3f\n", Double.parseDouble(args[i]));
        }
        System.out.println("----------");
        System.out.printf("%10.3f\n\n", fsum);
        System.out.printf("średnia arytmetyczna: %.4f", fsum/args.length );
    }

}
