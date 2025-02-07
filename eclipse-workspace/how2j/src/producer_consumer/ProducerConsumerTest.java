package producer_consumer;

public class ProducerConsumerTest {
    public static void main(String[] args) {
        ThreadSafeStack<Character> stack = new ThreadSafeStack<>(10); // Stack size of 200
        
        // Create and start producer threads
        Producer producer1 = new Producer(stack, "producer1");
        Producer producer2 = new Producer(stack, "producer2");
        producer1.start();
        producer2.start();
        
        // Create and start consumer threads
        Consumer consumer1 = new Consumer(stack, "consumer1");
        Consumer consumer2 = new Consumer(stack, "consumer2");
//        Consumer consumer3 = new Consumer(stack, "consumer3");
        consumer1.start();
        consumer2.start();
//        consumer3.start();
    }
}
