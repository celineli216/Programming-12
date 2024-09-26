class Blue {
  PVector loc;
  PVector vel;
  PVector dir;
  boolean start;
  boolean isPainting;
  int startingX;
  int startingY;

  Blue(int startx, int starty) {
    loc = new PVector(startx, starty);
    vel = new PVector (0, 0);
    dir = new PVector (1, 0);
    start = false;
    startingX = startx;
    startingY = starty;
    isPainting = false;
  }

  void act() {
    move();
  }


  void show() {
    if (start == true) {
      paint();
    }
    brush();
  }

  void brush() {
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(dir.heading());
    //fill(255);
    //stroke(0);
    //rect(0, 0, 60, 30);
    //fill(0);
    //rect(0+40, 0, 20, 10);
    //fill(blue);
    //rect(0 + 60, 0, 20, 60);
    fill(blue);
    triangle(-20,  -10 , 0, 0, -20, 10);

    popMatrix();
  }


  void move() {
    //movement
    vel.limit(4);
    vel.add(dir);

    //controls
    if (wkey) {
      loc.add(vel);
      start = true;
      isPainting = true;
    }
    if (skey) {
      loc.sub(vel);
        start = true;
      isPainting = true;
    }
    if (akey) {
      dir.rotate(-radians(3));
        //start = true;
      isPainting = true;
    }
    if (dkey) {
      dir.rotate(radians(3));
        //start = true;
      isPainting = true;
    }

    //restrictions
    if (loc.x > width) loc.x -= 10;
    if (loc.x < 0) loc.x += 10;
    if (loc.y > height) loc.y -= 10;
    if (loc.y  < 0) loc.y += 10;
    

  }

  void paint() {

    fill(lightBlue);
    noStroke();
    ellipse(loc.x, loc.y, 90, 60);
  }
}
