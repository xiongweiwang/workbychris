package charactor;

public class HeroDeathLock {
    public String name; 
    public float hp;
    public int damage;
    private final Object lock = new Object(); // Synchronization object for locking

    public HeroDeathLock(String name, float hp, int damage) {
        this.name = name;
        this.hp = hp;
        this.damage = damage;
    }

    public void attackHero(HeroDeathLock target) {
        synchronized (this.lock) {
            System.out.println(name + " is attacking " + target.name);
            try {
                Thread.sleep(100); // Simulate attack time
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            target.hp -= damage;
            System.out.format("%s's HP is now %.0f%n", target.name, target.hp);
        }
    }

    public Object getLock() {
        return this.lock;
    }

    public boolean isDead() {
        return hp <= 0;
    }
}
