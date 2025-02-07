//package multiplethread;
//
//import java.text.SimpleDateFormat;
//import java.util.ArrayList;
//import java.util.Collections;
//import java.util.Date;
//import java.util.List;
//
//import charactor.Hero;
//import charactor.HeroDeathLock;
//import charactor.HeroInteract;
//
//public class TestThread {
//
//	public static String now() {
//		return new SimpleDateFormat("HH:mm:ss").format(new Date());
//	}
//
//	public static void main(String[] args) {
//
//		final Hero gareen = new Hero();
//		gareen.name = "盖伦";
//		gareen.hp = 10;
//		gareen.damage = 50;
//
//		final Hero teemo = new Hero();
//		teemo.name = "提莫";
//		teemo.hp = 1000;
//		teemo.damage = 30;
//
//		final Hero bh = new Hero();
//		bh.name = "赏金猎人";
//		bh.hp = 1000;
//		bh.damage = 50;
//
//		final Hero leesin = new Hero();
//		leesin.name = "盲僧";
//		leesin.hp = 1000;
//		leesin.damage = 80;
//
//		// 创建多线程-继承线程类
////		KillThread killThread1 = new KillThread(gareen,teemo);
////		killThread1.start();
////		KillThread killThread2 = new KillThread(bh,leesin);
////		killThread2.start();
//
//		// Thread(Runnable threadOb)
//		// 创建多线程-实现Runnable接口
////		Battle battle1 = new Battle(gareen, teemo);
////		new Thread(battle1).start();
////
////		Battle battle2 = new Battle(bh, leesin);
////		new Thread(battle2).start();
//
//		// 创建多线程-匿名类
////        Thread t1= new Thread(){
////            public void run(){
////                //匿名类中用到外部的局部变量teemo，必须把teemo声明为final
////                //但是在JDK7以后，就不是必须加final的了
////                while(!teemo.isDead()){
////                    gareen.attackHero(teemo);
////                }              
////            }
////        };
////         
////        t1.start();
////          
////        Thread t2= new Thread(){
////            public void run(){
////                while(!leesin.isDead()){
////                    bh.attackHero(leesin);
////                }              
////            }
////        };
////        t2.start();
//
//		// 当前线程暂停
////		Thread t100= new Thread(){
////            public void run(){
////                int seconds =0;
////                while(true){
////                    try {
////                        Thread.sleep(1000);
////                    } catch (InterruptedException e) {
////                        // TODO Auto-generated catch block
////                        e.printStackTrace();
////                    }
////                    System.out.printf("已经玩了LOL %d 秒%n", seconds++);
////                }              
////            }
////        };
////        t100.start();
//
//		// 加入到当前线程中
////		Thread t1= new Thread(){
////            public void run(){
////                while(!teemo.isDead()){
////                    gareen.attackHero(teemo);
////                }              
////            }
////        };
////          
////        t1.start();
//// 
////        //代码执行到这里，一直是main线程在运行
////        try {
////            //t1线程加入到main线程中来，只有t1线程运行结束，才会继续往下走
////            t1.join();
////        } catch (InterruptedException e) {
////            // TODO Auto-generated catch block
////            e.printStackTrace();
////        }
//// 
////        Thread t2= new Thread(){
////            public void run(){
////                while(!leesin.isDead()){
////                    bh.attackHero(leesin);
////                }              
////            }
////        };
////        //会观察到盖伦把提莫杀掉后，才运行t2线程
////        t2.start();
//
//		// 线程优先级
////		Thread t1= new Thread(){
////            public void run(){
//// 
////                while(!teemo.isDead()){
////                    gareen.attackHero(teemo);
////                }              
////            }
////        };
////          
////        Thread t2= new Thread(){
////            public void run(){
////                while(!leesin.isDead()){
////                    //临时暂停，使得t1可以占用CPU资源
////                    Thread.yield();
////                    bh.attackHero(leesin);
////                }              
////            }
////        };
////         
////        t1.setPriority(Thread.MAX_PRIORITY);
////        t2.setPriority(Thread.MIN_PRIORITY);
////        t1.start();
////        t2.start();
//
//		// 临时暂停
////		Thread t1= new Thread(){
////            public void run(){
//// 
////                while(!teemo.isDead()){
////                    //临时暂停，使得t2可以占用CPU资源
////                    Thread.yield();
////                    gareen.attackHero(teemo);
////                }              
////            }
////        };
////          
////        Thread t2= new Thread(){
////            public void run(){
////                while(!leesin.isDead()){
////                    bh.attackHero(leesin);
////                }              
////            }
////        };
////         
////        t1.setPriority(5);
////        t2.setPriority(5);
////        t1.start();
////        t2.start();
//
//		// 当前线程暂停
////		Thread t100= new Thread(){
////            public void run(){
////                int seconds =0;
////                while(true){
////                    try {
////                        Thread.sleep(1000);
////                    } catch (InterruptedException e) {
////                        // TODO Auto-generated catch block
////                        e.printStackTrace();
////                    }
////                    System.out.printf("已经玩了LOL %d 秒%n", seconds++);
////                }              
////            }
////        };
////        t100.start();
//
////		//守护线程
////		Thread t101= new Thread(){
////            public void run(){
////                int seconds =0;
////                 
////                while(true){
////                    try {
////                        Thread.sleep(1000);
////                    } catch (InterruptedException e) {
////                        // TODO Auto-generated catch block
////                        e.printStackTrace();
////                    }
////                    System.out.printf("已经玩了LOL %d 秒%n", seconds++); 
////                }              
////            }
////        };
////        t101.setDaemon(true);
////        t101.start();
//
//		// --------------------------------------------------------------------------------------------
//		// Start the hadouken attack thread
////        HadoukenThread hadoukenThread = new HadoukenThread(gareen, teemo);
////        hadoukenThread.start();
//
//		/*-----------------------------------------同步Start-----------------------------------------*/
//		// 步骤 1 : 演示同步问题
//		// 多线程同步问题指的是多个线程同时修改一个数据的时候，导致的问题
//
//		// 假设盖伦有10000滴血，并且在基地里，同时又被对方多个英雄攻击
//
//		// 用JAVA代码来表示，就是有多个线程在减少盖伦的hp
//		// 同时又有多个线程在恢复盖伦的hp
//
//		// n个线程增加盖伦的hp
//
////		System.out.printf("盖伦的初始血量是 %.0f%n", gareen.hp);
////		
////        int n = 10000;
////   
////        Thread[] addThreads = new Thread[n];
////        Thread[] reduceThreads = new Thread[n];
////           
////        for (int i = 0; i < n; i++) {
////            Thread t = new Thread(){
////                public void run(){
////                    gareen.recover();
////                    try {
////                        Thread.sleep(100);
////                    } catch (InterruptedException e) {
////                        // TODO Auto-generated catch block
////                        e.printStackTrace();
////                    }
////                }
////            };
////            t.start();
////            addThreads[i] = t;
////               
////        }
////           
////        //n个线程减少盖伦的hp
////        for (int i = 0; i < n; i++) {
////            Thread t = new Thread(){
////                public void run(){
////                    gareen.hurt();
////                    try {
////                        Thread.sleep(100);
////                    } catch (InterruptedException e) {
////                        // TODO Auto-generated catch block
////                        e.printStackTrace();
////                    }
////                }
////            };
////            t.start();
////            reduceThreads[i] = t;
////        }
////           
////        //等待所有增加线程结束
////        for (Thread t : addThreads) {
////            try {
////                t.join();
////            } catch (InterruptedException e) {
////                // TODO Auto-generated catch block
////                e.printStackTrace();
////            }
////        }
////        //等待所有减少线程结束
////        for (Thread t : reduceThreads) {
////            try {
////                t.join();
////            } catch (InterruptedException e) {
////                // TODO Auto-generated catch block
////                e.printStackTrace();
////            }
////        }
////           
////        //代码执行到这里，所有增加和减少线程都结束了
////           
////        //增加和减少线程的数量是一样的，每次都增加，减少1.
////        //那么所有线程都结束后，盖伦的hp应该还是初始值
////           
////        //但是事实上观察到的是：
////                   
////        System.out.printf("%d个增加线程和%d个减少线程结束后%n盖伦的血量变成了 %.0f%n", n,n,gareen.hp);
//
//		// 步骤 4 : synchronized 同步对象概念
////        final Object someObject = new Object();
////        
////        Thread t1 = new Thread(){
////            public void run(){
////                try {
////                    System.out.println( now()+" t1 线程已经运行");
////                    System.out.println( now()+this.getName()+ " 试图占有对象：someObject");
////                    synchronized (someObject) {
////                          
////                        System.out.println( now()+this.getName()+ " 占有对象：someObject");
////                        Thread.sleep(5000);
////                        System.out.println( now()+this.getName()+ " 释放对象：someObject");
////                    }
////                    System.out.println(now()+" t1 线程结束");
////                } catch (InterruptedException e) {
////                    // TODO Auto-generated catch block
////                    e.printStackTrace();
////                }
////            }
////        };
////        t1.setName(" t1");
////        t1.start();
////        Thread t2 = new Thread(){
////  
////            public void run(){
////                try {
////                    System.out.println( now()+" t2 线程已经运行");
////                    System.out.println( now()+this.getName()+ " 试图占有对象：someObject");
////                    synchronized (someObject) {
////                        System.out.println( now()+this.getName()+ " 占有对象：someObject");
////                        Thread.sleep(5000);
////                        System.out.println( now()+this.getName()+ " 释放对象：someObject");
////                    }
////                    System.out.println(now()+" t2 线程结束");
////                } catch (InterruptedException e) {
////                    // TODO Auto-generated catch block
////                    e.printStackTrace();
////                }
////            }
////        };
////        t2.setName(" t2");
////        t2.start();
//
////	}
//
//		// 步骤 5 : 使用synchronized 解决同步问题
////	final Object lock = new Object();
////	
////	int n = 10000;
////	 
////    Thread[] addThreads = new Thread[n];
////    Thread[] reduceThreads = new Thread[n];
////     
////    for (int i = 0; i < n; i++) {
////        Thread t = new Thread(){
////            public void run(){
////            	
////            	//任何线程要修改hp的值，必须先占用someObject
////            	synchronized (lock) {
////            		gareen.recover();
////				}
////                
////                try {
////                    Thread.sleep(1000);
////                } catch (InterruptedException e) {
////                    // TODO Auto-generated catch block
////                    e.printStackTrace();
////                }
////            }
////        };
////        t.start();
////        addThreads[i] = t;
////         
////    }
////     
////    for (int i = 0; i < n; i++) {
////        Thread t = new Thread(){
////            public void run(){
////            	//任何线程要修改hp的值，必须先占用someObject
////            	synchronized (lock) {
////            		gareen.hurt();
////            	}
////            	
////                try {
////                    Thread.sleep(100);
////                } catch (InterruptedException e) {
////                    // TODO Auto-generated catch block
////                    e.printStackTrace();
////                }
////            }
////        };
////        t.start();
////        reduceThreads[i] = t;
////    }
////     
////    for (Thread t : addThreads) {
////        try {
////            t.join();
////        } catch (InterruptedException e) {
////            // TODO Auto-generated catch block
////            e.printStackTrace();
////        }
////    }
////    for (Thread t : reduceThreads) {
////        try {
////            t.join();
////        } catch (InterruptedException e) {
////            // TODO Auto-generated catch block
////            e.printStackTrace();
////        }
////    }
////     
////    System.out.printf("%d个增加线程和%d个减少线程结束后%n盖伦的血量是 %.0f%n", n,n,gareen.hp);
//
//		// 使用hero对象作为同步对象
////		int n = 10000;
////
////		Thread[] addThreads = new Thread[n];
////		Thread[] reduceThreads = new Thread[n];
////
////		for (int i = 0; i < n; i++) {
////			Thread t = new Thread() {
////				public void run() {
////					gareen.recover();
////					try {
////						Thread.sleep(1000);
////					} catch (InterruptedException e) {
////						// TODO Auto-generated catch block
////						e.printStackTrace();
////					}
////				}
////			};
////			t.start();
////			addThreads[i] = t;
////
////		}
////
////		for (int i = 0; i < n; i++) {
////			Thread t = new Thread() {
////				public void run() {
////					gareen.hurt();
////					try {
////						Thread.sleep(100);
////					} catch (InterruptedException e) {
////						// TODO Auto-generated catch block
////						e.printStackTrace();
////					}
////				}
////			};
////			t.start();
////			reduceThreads[i] = t;
////		}
////
////		for (Thread t : addThreads) {
////			try {
////				t.join();
////			} catch (InterruptedException e) {
////				// TODO Auto-generated catch block
////				e.printStackTrace();
////			}
////		}
////		for (Thread t : reduceThreads) {
////			try {
////				t.join();
////			} catch (InterruptedException e) {
////				// TODO Auto-generated catch block
////				e.printStackTrace();
////			}
////		}
////
////		System.out.printf("%d个增加线程和%d个减少线程结束后%n盖伦的血量是 %.0f%n", n, n, gareen.hp);
////		System.out.println();
//
//		/*-----------------------------------------同步End-------------------------------------------*/
//
//		// 把非线程安全的集合转换为线程安全
////		List<Integer> list1 = new ArrayList<>();
////		List<Integer> list2 = Collections.synchronizedList(list1);
//
//		// 死锁
////		final Hero ahri = new Hero();
////        ahri.name = "九尾妖狐";
////        final Hero annie = new Hero();
////        annie.name = "安妮";
////         
////        Thread t1 = new Thread(){
////            public void run(){
////                //占有九尾妖狐
////                synchronized (ahri) {
////                    System.out.println("t1 已占有九尾妖狐");
////                    try {
////                        //停顿1000毫秒，另一个线程有足够的时间占有安妮
////                        Thread.sleep(1000);
////                    } catch (InterruptedException e) {
////                        // TODO Auto-generated catch block
////                        e.printStackTrace();
////                    }
////                     
////                    System.out.println("t1 试图占有安妮");
////                    System.out.println("t1 等待中 。。。。");
////                    synchronized (annie) {
////                        System.out.println("do something");
////                    }
////                }  
////                 
////            }
////        };
////        t1.start();
////        Thread t2 = new Thread(){
////            public void run(){
////                //占有安妮
////                synchronized (annie) {
////                    System.out.println("t2 已占有安妮");
////                    try {
////                         
////                        //停顿1000毫秒，另一个线程有足够的时间占有暂用九尾妖狐
////                        Thread.sleep(1000);
////                    } catch (InterruptedException e) {
////                        // TODO Auto-generated catch block
////                        e.printStackTrace();
////                    }
////                    System.out.println("t2 试图占有九尾妖狐");
////                    System.out.println("t2 等待中 。。。。");
////                    synchronized (ahri) {
////                        System.out.println("do something");
////                    }
////                }  
////                 
////            }
////        };
////        t2.start();
//
//		// 3个线程彼此死锁
//		// To demonstrate a deadlock scenario using the Hero class with three threads
//		// and three synchronization objects.
//		// use three Hero objects as synchronization points to create a deadlock
//		// situation.
////		final HeroDeathLock heroA = new HeroDeathLock("Hero A", 1000, 50);
////		final HeroDeathLock heroB = new HeroDeathLock("Hero B", 1000, 50);
////		final HeroDeathLock heroC = new HeroDeathLock("Hero C", 1000, 50);
////
////		Thread t1 = new Thread(() -> {
////			synchronized (heroA.getLock()) {
////				System.out.println("Thread 1: Locked " + heroA.name);
////				try {
////					Thread.sleep(100);
////				} catch (InterruptedException e) {
////					e.printStackTrace();
////				}
////				System.out.println(heroA.name + "Thread 1 is trying to Locked B");
////				System.out.println(heroA.name + "Thread 1 waiting");
////				synchronized (heroB.getLock()) {
////					System.out.println("Thread 1: Locked " + heroB.name);
////					heroA.attackHero(heroB);
////				}
////			}
////		});
////
////		Thread t2 = new Thread(() -> {
////			synchronized (heroB.getLock()) {
////				System.out.println("Thread 2: Locked " + heroB.name);
////				try {
////					Thread.sleep(100);
////				} catch (InterruptedException e) {
////					e.printStackTrace();
////				}
////				System.out.println(heroB.name + "Thread 2 is trying to Locked B");
////				System.out.println(heroB.name + "Thread 2 waiting");
////				synchronized (heroC.getLock()) {
////					System.out.println("Thread 2: Locked " + heroC.name);
////					heroB.attackHero(heroC);
////				}
////			}
////		});
////
////		Thread t3 = new Thread(() -> {
////			synchronized (heroC.getLock()) {
////				System.out.println("Thread 3: Locked " + heroC.name);
////				try {
////					Thread.sleep(100);
////				} catch (InterruptedException e) {
////					e.printStackTrace();
////				}
////				System.out.println(heroC.name + "Thread 3 is trying to Locked B");
////				System.out.println(heroC.name + "Thread 3 waiting");
////				synchronized (heroA.getLock()) {
////					System.out.println("Thread 3: Locked " + heroA.name);
////					heroC.attackHero(heroA);
////				}
////			}
////		});
////
////		t1.start();
////		t2.start();
////		t3.start();
//
//		// 交互
////		final HeroInteract naruto = new HeroInteract();
////		naruto.name = "naruto";
////		naruto.hp = 10;
////		naruto.damage = 50;
////		Thread t1 = new Thread(() -> {
////			while(true) {
////				naruto.hurt();
////				try {
////	                Thread.sleep(10);
////	            } catch (InterruptedException e) {
////	                // TODO Auto-generated catch block
////	                e.printStackTrace();
////	            }
////			}
////		});
////
////		Thread t2 = new Thread(() -> {
////			while(true) {
////				naruto.recover();
////				try {
////	                Thread.sleep(100);
////	            } catch (InterruptedException e) {
////	                // TODO Auto-generated catch block
////	                e.printStackTrace();
////	            }
////			}
////		});
////		
////		t1.start();
////		t2.start();
//
////		ThreadPool pool = new ThreadPool(10);
////		  
////        for (int i = 0; i < 100; i++) {
////            Runnable task = new Runnable() {
////                @Override
////                public void run() {
////                    System.out.println("执行任务");
////                    //任务可能是打印一句话
////                    //可能是访问文件
////                    //可能是做排序
////                }
////            };
////             
////            pool.add(task, task.getClass().getName() + ": " +i);
////             
////            try {
////                Thread.sleep(1000);
////            } catch (InterruptedException e) {
////                // TODO Auto-generated catch block
////                e.printStackTrace();
////            }
////        }
//
//		ThreadPool pool = new ThreadPool(10);
//		int sleep = 1000;
//		while (true) {
//			pool.add(new Runnable() {
//				@Override
//				public void run() {
//					// System.out.println("执行任务");
//					try {
//						Thread.sleep(1000);
//					} catch (InterruptedException e) {
//						// TODO Auto-generated catch block
//						e.printStackTrace();
//
//					}
//				}
//			});
//			try {
//				Thread.sleep(sleep);
//				sleep = sleep > 100 ? sleep - 100 : sleep;
//			} catch (InterruptedException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//
//		}
//	}
//}
