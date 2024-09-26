class bPaint {
  PVector loc;
  PVector vel;
  PVector dir;
  bPaint() {
    loc = new PVector (p1.loc.x, p1.loc.y);
    vel = new PVector (p1.vel.x, p1.vel.y);
    dir = new PVector (p1.dir.x, p1.dir.y);
  }

  void show() {
    paintMark();
  }

  void act() {
  }

  void paintMark() {
    pushMatrix();
    translate(loc.x, loc.y);
    fill(blue);
    noStroke();
    rotate(dir.heading());
    ellipse(0, 0, 80, 60);
    popMatrix();
  }
}
