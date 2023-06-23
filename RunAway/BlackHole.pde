class BlackHole extends Human {
  int dx;
  int dy;

  BlackHole(String name, int x, int y) {
    super(name, x, y);
    dx = (int)random(11) - 5;
    dy = (int)random(11) - 5;
    stand = loadImage("space_blackhole2.png");
  }

  void update(){
    if (getX() + dx > width || getX() + dx < 0) dx = -dx;
    if (getY() + dy > height || getY() + dy < 0) dy = -dy;
    setXY(getX()+ dx, getY() + dy);
    super.update();
  }
}
