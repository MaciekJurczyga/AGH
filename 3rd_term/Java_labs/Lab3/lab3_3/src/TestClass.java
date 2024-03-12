public class TestClass {
    private static int id = 0;
    private long ms;

    public TestClass(){
        this.id++;
        this.ms = System.currentTimeMillis();
    }
    public String toString(){
        return String.format("%3d.  [%13d]",this.id, this.ms);
    }
    public static void main(String[] args){
        if (args.length != 1){
            System.out.println("niepoprawna ilość argumetów");
        }
        else{
            int length = Integer.parseInt(args[0]);
            for (int i=0; i<length; i++){
                TestClass test1 = new TestClass();
                System.out.println(test1.toString());
            }
            System.out.println("liczba argumentów: " + length);
        }

    }

}

