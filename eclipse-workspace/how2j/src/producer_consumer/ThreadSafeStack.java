package producer_consumer;

import java.util.Stack;

public class ThreadSafeStack<T> {
    private final Stack<T> stack = new Stack<>();
    private final int maxSize;
    
    public ThreadSafeStack(int maxSize) {
        this.maxSize = maxSize;
    }
    
    public synchronized void push(T item) throws InterruptedException {
        while (stack.size() == maxSize) {
        	System.out.println("Waiting: the stack is full");
            wait(); // Wait if the stack is full
        }
        stack.push(item);
        notifyAll(); // Notify waiting threads that an item has been added
    }
    
    public synchronized T pop() throws InterruptedException {
        while (stack.isEmpty()) {
        	System.out.println("Waiting: the stack is empty");
            wait(); // Wait if the stack is empty
        }
        T item = stack.pop();
        notifyAll(); // Notify waiting threads that an item has been removed
        return item;
    }
    
    public synchronized int size() {
        return stack.size();
    }
}
