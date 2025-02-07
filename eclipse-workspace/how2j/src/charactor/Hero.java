package charactor;

public class Hero{
    public String name; 
    public float hp;
    public int damage;
    private int hadoukenCharges = 3;
    
  //回血
  //如果一个类，其方法都是有synchronized修饰的，那么该类就叫做线程安全的类
    public synchronized void recover(){
//    	synchronized (this) {
//    		hp=hp+1;
//    	}
    	hp=hp+1;
    }
     
    //掉血
    public synchronized void hurt(){
//    	synchronized (this) {
//    		hp=hp-1;
//    	}
    	hp=hp-1;
    }
    
    public void attackHero(Hero h) {
//    	try {
//    		//为了表示攻击需要时间，每次攻击暂停1000毫秒
//			Thread.sleep(1000);
//		} catch (InterruptedException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
    	h.hp-=damage;
  
    	System.out.format("%s 正在攻击 %s, %s的血变成了 %.0f%n",name,h.name,h.name,h.hp);
    	
    	if(h.isDead())
    		System.out.println(h.name +"死了！");
    }
    
    public void hadouken(Hero h) {
        if (hadoukenCharges > 0) {
            System.out.println(name + " 使用波动拳对 " + h.name + " 发起攻击！");
            h.hp -= damage * 2; // Double damage for hadouken
            hadoukenCharges--;
            System.out.format("%s 的血变成了 %.0f%n", h.name, h.hp);
            if(h.isDead())
                System.out.println(h.name + " 死了！");
        } else {
            System.out.println(name + " 正在充能，无法使用波动拳");
        }
    }
    
    public synchronized void rechargeHadouken() {
        try {
            System.out.println(name + " 正在充能波动拳...");
            Thread.sleep(5000); // Recharge time
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        hadoukenCharges = 3;
        System.out.println(name + " 充能完成，可以再次使用波动拳");
    }

	public boolean isDead() {
		return 0>=hp?true:false;
	}

}


