package producer_consumer;

import java.util.Random;

public class Producer extends Thread {
	private final String name;
    private final ThreadSafeStack<Character> stack;
    private final Random random = new Random();
    
    public Producer(ThreadSafeStack<Character> stack, String name) {
    	this.name = name;
        this.stack = stack;
    }
    
    @Override
    public void run() {
        while (true) {
            try {
                char item = (char) ('A' + random.nextInt(26)); // Generate a random uppercase letter
                stack.push(item);
                System.out.println(this.name + " Produced: " + item);
                Thread.sleep(1000); // Simulate time taken to produce an item
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
        }
    }
}