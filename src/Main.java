import java.util.ArrayList;
import java.util.List;

public class Main {
    public static void main(String[] args) throws InterruptedException {
        List<byte[]> memoryConsumers = new ArrayList<>();

        // Loop to stress memory and then clear it
        while (true) {
            // Increase memory usage for 20 seconds
            System.out.println("Increasing memory usage...");
            for (int i = 0; i < 10; i++) {
                memoryConsumers.add(new byte[10 * 1024 * 1024]); // Allocate 10 MB
                Thread.sleep(2000); // Wait for 2 seconds
            }

            // Clear memory consumption to allow scale down
            System.out.println("Clearing memory usage...");
            memoryConsumers.clear(); // Free up memory
            System.gc(); // Suggest garbage collection

            // Pause before next memory spike
            Thread.sleep(30000); // Wait 30 seconds before the next loop
        }
    }
}
