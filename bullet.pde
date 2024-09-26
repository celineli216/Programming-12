class Bullet extends GameObject{

  boolean  life;
  
  Bullet() {
    life = true;
    loc = new PVector (p1.loc.x, p1.loc.y);
    vel = new PVector (p1.dir.x, p1.dir.y);
    vel.setMag(10);
  }
  
//  Bullet(){
//    loc = new PVector (p1.loc.x, p1.loc.y);
//    vel = p1.dir.copy();
//    vel.setMag(10);
//  }
  
  void show() {
    fill(blue);
    circle(loc.x, loc.y, 5);
  }
  

  
  
  void act(){
    loc.add(vel);
    //checkLives();
  }
//  void checkLives(){
//    if (loc.x < 0) life = false;
//    if (loc.x > width) life = false;
//    if (loc.y < 0) life = false;
//    if (loc.y > height) life = false;
//    if (loc.y == p2.loc.y) life = false;
//    if (loc.x == p2.loc.x) life = false;
  
//}




}
