package charactor;

import java.util.Scanner;

import item.Item;

public class HeroSe {

	String name; // 姓名

	float hp; // 血量

	float armor; // 护甲

	int moveSpeed; // 移动速度

	int deathTime;

	int kill;

	int assistAtackTimes;

	double money;

	int lastHits;

	int attackSpeed;

	String killWord;

	String killedWorld;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public float getHp() {
		return hp;
	}

	public void setHp(float hp) {
		this.hp = hp;
	}

	public float getArmor() {
		return armor;
	}

	public void setArmor(float armor) {
		this.armor = armor;
	}

	public int getMoveSpeed() {
		return moveSpeed;
	}

	public void setMoveSpeed(int moveSpeed) {
		this.moveSpeed = moveSpeed;
	}

	public int getDeathTime() {
		return deathTime;
	}

	public void setDeathTime(int deathTime) {
		this.deathTime = deathTime;
	}

	public int getKill() {
		return kill;
	}

	public void setKill(int kill) {
		this.kill = kill;
	}

	public int getAssistAtackTimes() {
		return assistAtackTimes;
	}

	public void setAssistAtackTimes(int assistAtackTimes) {
		this.assistAtackTimes = assistAtackTimes;
	}

	public double getMoney() {
		return money;
	}

	public void setMoney(double money) {
		this.money = money;
	}

	public int getLastHits() {
		return lastHits;
	}

	public void setLastHits(int lastHits) {
		this.lastHits = lastHits;
	}

	public int getAttackSpeed() {
		return attackSpeed;
	}

	public void setAttackSpeed(int attackSpeed) {
		this.attackSpeed = attackSpeed;
	}

	public String getKillWord() {
		return killWord;
	}

	public void setKillWord(String killWord) {
		this.killWord = killWord;
	}

	public String getKilledWorld() {
		return killedWorld;
	}

	public void setKilledWorld(String killedWorld) {
		this.killedWorld = killedWorld;
	}

	// 坑队友
	void keng() {
		System.out.println("坑队友！");
	}

	void addSpeed(int speed) {
		// 在原来的基础上增加移动速度
		moveSpeed = moveSpeed + speed;
	}
	
	void legendary() {
		System.out.println();
	}
	
	void recovery(float blood) {
		hp += blood;
	}

	public static void main(String[] args) {
		HeroSe garen = new HeroSe();
		garen.name = "盖伦";
		garen.hp = 616.28f;
		garen.armor = 27.536f;
		garen.moveSpeed = 350;
		garen.addSpeed(100);

		HeroSe teemo = new HeroSe();
		teemo.name = "提莫";
		teemo.hp = 383f;
		teemo.armor = 14f;
		teemo.moveSpeed = 330;

		Item xueping = new Item("xueping", 50);
		Item caoxie = new Item("caoxie", 300);
		Item changjian = new Item("changjian", 350);
		
//		Scanner s = new Scanner(System.in);
//		float a22 = s.nextFloat();
//		System.out.println("第一个数tizhong："+a22);
//		float b22 = s.nextFloat();
//		System.out.println("第2个数身高*："+b22);
//		System.out.println(a22/(b22*b22));
		
	       String a = "5";
	       int b = 6;
	       float c = 5f;
	       
	       System.out.println(a.equals(c));  //返回 true

	}
}
