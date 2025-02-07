package multiplethread;

import charactor.Hero;

public class HadoukenThread extends Thread {
    private Hero h1;
    private Hero h2;

    public HadoukenThread(Hero h1, Hero h2) {
        this.h1 = h1;
        this.h2 = h2;
    }

    public void run() {
        while (!h2.isDead()) {
            for (int i = 0; i < 3; i++) {
                if (h2.isDead()) break;
                h1.hadouken(h2);
                try {
                    Thread.sleep(1000); // 1-second interval between hadoukens
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
            h1.rechargeHadouken(); // Recharge after 3 attacks
        }
    }
}
