class PoisonApple extends Item {
  int dx;
  int dy;

  PoisonApple(int x, int y, int damage) {
    super(x, y, damage);
    dx = (int)random(11) - 5;
    dy = (int)random(11) - 5;
    stand = loadImage("apple_doku_ringo.png");
  }

  void update(){
    if (getX() + dx > width || getX() + dx < 0) dx = -dx;
    if (getY() + dy > height || getY() + dy < 0) dy = -dy;
    setXY(getX()+ dx, getY() + dy);
    super.update();
  }
}
