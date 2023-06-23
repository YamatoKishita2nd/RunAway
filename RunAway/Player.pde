class Player extends Human {
  Player(String name) {
    super(name, width/2, height/2);
    stand = loadImage("business_suit_good.png");
  }

  void update(){
    setXY(mouseX, mouseY);
    super.update();
  }
}
