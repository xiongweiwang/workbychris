package charactor;

public class HeroExercise1 {
    public String name; 
    public float hp;
    public int damage;
    private final Object lock = new Object(); // Synchronization object for locking
    private static final float MAX_HP = 1000;
    private boolean isHealing = false; // To track if healing is in progress

    public HeroExercise1(String name, float hp, int damage) {
        this.name = name;
        this.hp = hp;
        this.damage = damage;
    }

    public void attackHero(HeroExercise1 target) {
        synchronized (this.lock) {
            System.out.println(name + " is attacking " + target.name);
            try {
                Thread.sleep(100); // Simulate attack time
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            target.hp -= damage;
            System.out.format("%s's HP is now %.0f%n", target.name, target.hp);
            target.checkHealth(); // Check if healing is needed
        }
    }

    public void heal() {
        synchronized (this.lock) {
            while (hp >= MAX_HP) {
                try {
                    isHealing = true;
                    System.out.println(name + " is at full health and waiting for damage...");
                    this.lock.wait(); // Wait if health is full
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
            isHealing = false;
            while (hp < MAX_HP) {
                hp += 10; // Heal by 10 units per iteration
                System.out.format("%s is healing, HP is now %.0f%n", name, hp);
                try {
                    Thread.sleep(100); // Simulate healing time
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
            if (hp > MAX_HP) {
                hp = MAX_HP; // Cap the HP at maximum
            }
            System.out.println(name + " has fully healed.");
        }
    }

    public void checkHealth() {
        synchronized (this.lock) {
            if (hp < MAX_HP && isHealing) {
                this.lock.notify(); // Notify the healing thread if health is below maximum
            }
        }
    }

    public boolean isDead() {
        return hp <= 0;
    }

    public Object getLock() {
        return this.lock;
    }
}
