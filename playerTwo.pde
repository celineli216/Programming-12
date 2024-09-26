class PlayerTwo extends GameObject{
  PVector loc;
  PVector vel;
  PVector dir;
  int lives;
 


  PlayerTwo(float startX, float startY) {
    loc = new PVector (startX, startY);
    vel = new PVector (0, 0);
    dir = new PVector (-1, 0);
    
  }

  void show() {
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(dir.heading());
    tank();
    popMatrix();
  }

  void tank() {
    noFill();
    stroke(red);
    strokeWeight(3);
    square(0, 0, 50);
    rect(0+20, 0, 40, 10);
    circle(0, 0, 30);
  }
 
  
  void act(){
    move();
    life();
  
  }
  
    void move() {
    //movement
    vel.limit(4);
    vel.add(dir);
    
    //controls
    if (upkey) loc.add(vel);
    if (downkey) loc.sub(vel);
    if (leftkey) dir.rotate(-radians(3));
    if (rightkey) dir.rotate(radians(3));
    
        //restrictions
    if(loc.x > width) loc.x -= 10;
    if(loc.x < 0) loc.x += 10;
    if(loc.y > height) loc.y -= 10;
    if(loc.y  < 0) loc.y += 10;;
  }
  
  void life(){

  }
}
