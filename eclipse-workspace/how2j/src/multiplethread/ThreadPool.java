package multiplethread;

import java.util.LinkedList;

public class ThreadPool {

	int threadPoolSize;

	// 任务容器
	LinkedList<Runnable> tasks = new LinkedList<Runnable>();

	public ThreadPool(int threadPoolSize) {
		this.threadPoolSize = threadPoolSize;
		synchronized (tasks) {
			for (int i = 0; i < this.threadPoolSize; i++) {
				new TaskConsumeThread("任务消费者线程 " + i).start();
			}
		}

	}

//	public void add(Runnable r, String name) {
	public void add(Runnable r) {
		synchronized (tasks) {
			tasks.add(r);
			//System.out.println("任务" + name + "被添加到任务容器中");
			tasks.notifyAll();
		}
	}

	class TaskConsumeThread extends Thread {

		public TaskConsumeThread(String name) {
			super(name);
		}

		Runnable task;

		public void run() {

			System.out.println("启动： " + this.getName());

			while (true) {
				synchronized (tasks) {
					while (tasks.isEmpty()) {
						try {
							tasks.wait();
							//System.out.println("任务容器tasks为空, " +this.getName() + " 等待任务中");
						} catch (InterruptedException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
					task = tasks.removeLast();
					// 允许添加任务的线程可以继续添加任务
					tasks.notifyAll();
//					try {
//						sleep(1000);
//					} catch (InterruptedException e) {
//						// TODO Auto-generated catch block
//						e.printStackTrace();
//					}
				}
				System.out.println(this.getName() + " 获取到任务，并执行");
				task.run();
			}
		}

	}
}
