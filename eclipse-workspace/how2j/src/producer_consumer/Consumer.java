package producer_consumer;

public class Consumer extends Thread {
	private final String name;
    private final ThreadSafeStack<Character> stack;
    
    public Consumer(ThreadSafeStack<Character> stack, String name) {
    	this.name = name;
        this.stack = stack;
    }
    
    @Override
    public void run() {
        while (true) {
            try {
                char item = stack.pop();
                System.out.println(this.name + " Consumed: " + item);
                Thread.sleep(1500); // Simulate time taken to consume an item
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
        }
    }
}