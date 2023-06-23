class Item {
  //private PImage stand;
  PImage stand;
  private int x;
  private int y;
  private int damage;

  Item(int x, int y, int damage) {
    this.x = x;
    this.y = y;
    this.damage = damage;
  }
  
  void setXY(int x, int y){
     this.x = x;
     this.y = y;
  }

  int getX(){
    return x;
  }

  int getY() {
     return y;
  } 
  
  int getHeight(){
     return stand.height;
  }
  
  int getWidth(){
     return stand.width;
  }
  
  void update(){
      image(stand, (int)(x - stand.width/2), (int)(y - stand.height/2 ), stand.width, stand.height);
  }
  
  void setDamage(int damage) {
    this.damage = damage;
  }
  
  int getDamage() {
    return damage;
  }
}
