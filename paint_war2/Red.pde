class Red {
  PVector loc;
  PVector vel;
  PVector dir;
  boolean start;
  boolean isPainting;
  int startingX;
  int startingY;

  Red(int startx, int starty) {
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

    fill(red);
    //triangle(-20,  -10 , 0, 0, -20, 10);
    triangle(20, 10, 0, 0, 20, -10);
    fill(0);
    circle(0, 0, 5);

    popMatrix();
  }


  void move() {
    //movement
    vel.limit(4);
    vel.add(dir);

    //controls
    if (upkey) {
      loc.sub(vel);
      start = true;
      isPainting = true;
    }
    if (downkey) {
      loc.add(vel);
        start = true;
      isPainting = true;
    }
    if (leftkey) {
      dir.rotate(-radians(3));
        //start = true;
      isPainting = true;
    }
    if (rightkey) {
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
    gameField.fill(pink);
    gameField.noStroke();
    gameField.ellipse(loc.x, loc.y, 90, 60);
  }
}
