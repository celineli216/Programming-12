class PlayerOne extends GameObject {

  PVector dir;
  int lives;


  PlayerOne(float startX, float startY) {
    loc = new PVector (startX, startY);
    vel = new PVector (0, 0);
    dir = new PVector (1, 0);
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
    stroke(blue);
    strokeWeight(3);
    square(0, 0, 50);
    rect(0+20, 0, 40, 10);
    circle(0, 0, 30);
  }
  void act() {
    move();
    shoot();
  }

  void move() {
    //movement
    vel.limit(4);
    vel.add(dir);
    
    //controls
    if (wkey) loc.add(vel);
    if (skey) loc.sub(vel);
    if (akey) dir.rotate(-radians(3));
    if (dkey) dir.rotate(radians(3));
    
    //restrictions
    if(loc.x > width) loc.x -= 10;
    if(loc.x < 0) loc.x += 10;
    if(loc.y > height) loc.y -= 10;
    if(loc.y  < 0) loc.y += 10;
  }
  
  void shoot(){
    if (spacekey) bullets.add(new Bullet() );
  
  }
  

  

}
