package multiplethread;

import charactor.HeroExercise1;

public class HeroInteractionExample {

//    private static final HeroExercise1 hero = new HeroExercise1("Hero", 1000, 50);
//
//    public static void main(String[] args) {
//        Thread healingThread = new Thread(() -> {
//            while (true) {
//                hero.heal(); // Heal the hero
//                try {
//                    Thread.sleep(5000); // Heal every 5 seconds
//                } catch (InterruptedException e) {
//                    e.printStackTrace();
//                }
//            }
//        });
//
//        Thread damageThread = new Thread(() -> {
//            while (true) {
//                if (!hero.isDead()) {
//                    hero.attackHero(hero); // Simulate damage to the hero
//                    try {
//                        Thread.sleep(2000); // Damage every 2 seconds
//                    } catch (InterruptedException e) {
//                        e.printStackTrace();
//                    }
//                }
//            }
//        });
//
//        healingThread.start();
//        damageThread.start();
//    }

	private static final HeroExercise1 hero = new HeroExercise1("Hero", 1000, 50);

	public static void main(String[] args) {
		// Create two healing threads
		Thread healingThread1 = new Thread(() -> {
			while (true) {
				hero.heal(); // Heal the hero
				try {
					Thread.sleep(5000); // Heal every 5 seconds
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
			}
		});

		Thread healingThread2 = new Thread(() -> {
			while (true) {
				hero.heal(); // Heal the hero
				try {
					Thread.sleep(5000); // Heal every 5 seconds
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
			}
		});

		// Create five damage threads
		Thread damageThread1 = new Thread(() -> {
			while (true) {
				if (!hero.isDead()) {
					hero.attackHero(hero); // Simulate damage to the hero
					try {
						Thread.sleep(2000); // Damage every 2 seconds
					} catch (InterruptedException e) {
						e.printStackTrace();
					}
				}
			}
		});

		Thread damageThread2 = new Thread(() -> {
			while (true) {
				if (!hero.isDead()) {
					hero.attackHero(hero); // Simulate damage to the hero
					try {
						Thread.sleep(2000); // Damage every 2 seconds
					} catch (InterruptedException e) {
						e.printStackTrace();
					}
				}
			}
		});

		Thread damageThread3 = new Thread(() -> {
			while (true) {
				if (!hero.isDead()) {
					hero.attackHero(hero); // Simulate damage to the hero
					try {
						Thread.sleep(2000); // Damage every 2 seconds
					} catch (InterruptedException e) {
						e.printStackTrace();
					}
				}
			}
		});

		Thread damageThread4 = new Thread(() -> {
			while (true) {
				if (!hero.isDead()) {
					hero.attackHero(hero); // Simulate damage to the hero
					try {
						Thread.sleep(2000); // Damage every 2 seconds
					} catch (InterruptedException e) {
						e.printStackTrace();
					}
				}
			}
		});

		Thread damageThread5 = new Thread(() -> {
			while (true) {
				if (!hero.isDead()) {
					hero.attackHero(hero); // Simulate damage to the hero
					try {
						Thread.sleep(2000); // Damage every 2 seconds
					} catch (InterruptedException e) {
						e.printStackTrace();
					}
				}
			}
		});

		healingThread1.start();
		healingThread2.start();
		damageThread1.start();
		damageThread2.start();
		damageThread3.start();
		damageThread4.start();
		damageThread5.start();
	}
}
