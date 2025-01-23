class Target extends GameObject {
  PVector dir;
  color ogC = lightBlue;
  color hitC = darkBlue;
  int timer;
  boolean isHit;

  Target(float x, float y, float z, float s) {
    super(x, y, z, s);
    dir = new PVector(random(-1, 1), 0, random(-1, 1)); //x,y,z
    dir.setMag(2);
    timer = 0;
    isHit = false;
  }

  void act() {
    loc.add(dir);

    if (loc.x > 800 || loc.x < -800) dir.x *= -1;
    if (loc.z > 800 || loc.z < -800) dir.z *= -1;
    
    if (timer > 0) timer--;
    
    println(isHit);
  }
  
  void show(){
    pushMatrix();
    translate(loc.x, loc.y, loc.z);
    if(timer > 0) fill(hitC);
    else fill(ogC);
    
    box(size);
    popMatrix();
  }
  
  void bulletHit(){
    timer = 60;
    isHit = true;
  }
}
