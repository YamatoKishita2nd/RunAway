Player player;
BlackHole[] blackhole = new BlackHole[3];
Volcano[] volcano = new Volcano[3];
HardRoad[] hardRoad = new HardRoad[3];
Medicine[] medicine = new Medicine[3];
PoisonApple[] poisonApple = new PoisonApple[3];

int time = 0;
int hp = 1000;
int gameover = 0;

void setup() {
  size(500, 500);
  background(255);

  for (int i = 0; i < blackhole.length; i++) {
    blackhole[i] = new BlackHole("Black", (int)random(500), (int)random(500));
  }
  player = new Player("Ichiro");
  
  for (int i = 0; i < volcano.length; i++) {
    volcano[i] = new Volcano((int)random(500), (int)random(500), -10);
  }
  for (int i = 0; i < hardRoad.length; i++) {
    hardRoad[i] = new HardRoad((int)random(500), (int)random(500), -20);
  }
  for (int i = 0; i < medicine.length; i++) {
    medicine[i] = new Medicine((int)random(500), (int)random(500), 15);
  }
  for (int i = 0; i < poisonApple.length; i++) {
    poisonApple[i] = new PoisonApple((int)random(500), (int)random(500), -5);
  }
}

void draw() {
  background(255);
  player.update();
  for (int i = 0; i < blackhole.length; i++) {
    blackhole[i].update();
  }
  for (int i = 0; i < volcano.length; i++) {
    volcano[i].update();
  }
  for (int i = 0; i < hardRoad.length; i++) {
    hardRoad[i].update();
  }
  for (int i = 0; i < hardRoad.length; i++) {
    medicine[i].update();
  }
  for (int i = 0; i < poisonApple.length; i++) {
    poisonApple[i].update();
  }

  for (int i = 0; i < blackhole.length; i++) {
    if (abs(player.getX() - blackhole[i].getX()) < (player.getWidth() + blackhole[i].getWidth())/2 &&
        abs(player.getY() - blackhole[i].getY()) < (player.getHeight() + blackhole[i].getHeight())/2) {
      gameover = 1;
    }
  }
  
  for (int i = 0; i < volcano.length; i++) {
    if (abs(player.getX() - volcano[i].getX()) < (player.getWidth() + volcano[i].getWidth())/2 &&
        abs(player.getY() - volcano[i].getY()) < (player.getHeight() + volcano[i].getHeight())/2) {
      int damage = volcano[i].getDamage();
      changeHP(damage);
    }
  }
  for (int i = 0; i < hardRoad.length; i++) {
    if (abs(player.getX() - hardRoad[i].getX()) < (player.getWidth() + hardRoad[i].getWidth())/2 &&
        abs(player.getY() - hardRoad[i].getY()) < (player.getHeight() + hardRoad[i].getHeight())/2){
      int damage = hardRoad[i].getDamage();
      changeHP(damage);
    }
  }
  for (int i = 0; i < medicine.length; i++) {
    if (abs(player.getX() - medicine[i].getX()) < (player.getWidth() + medicine[i].getWidth())/2 &&
        abs(player.getY() - medicine[i].getY()) < (player.getHeight() + medicine[i].getHeight())/2) {
      int damage = medicine[i].getDamage();
      changeHP(damage);
    }
  }
  for (int i = 0; i < poisonApple.length; i++) {
    if (abs(player.getX() - poisonApple[i].getX()) < (player.getWidth() + poisonApple[i].getWidth())/2 &&
        abs(player.getY() - poisonApple[i].getY()) < (player.getHeight() + poisonApple[i].getHeight())/2) {
      int damage = poisonApple[i].getDamage();
      changeHP(damage);
    }
  }

  fill(0);
  time++;
  textSize(16);
  text("Timer: " + time, 0, 15);
  text("HP: " + hp, 0, 30);
  
  if (gameover == 1) {
    background(255);
    textSize(20);
    text("GameOver", 200, 250);
    text("Score is " + time + " !", 190, 300);
    noLoop();
  }
}

void changeHP(int damage) {
  hp = hp + damage;
  if (hp < 0) {
    hp = 0;
    gameover = 1;
  }
}
