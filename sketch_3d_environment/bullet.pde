class Bullet extends GameObject {
  PVector dir;
  float speed;

  Bullet() {
    super(eyeX, eyeY, eyeZ, 10);
    speed = 50;
    float vx = cos(leftRightHeadAngle);
    float vy = tan(upDownHeadAngle);
    float vz = sin(leftRightHeadAngle);
    dir = new PVector(vx, vy, vz);
    dir.setMag(speed);
  }

  void act() {
    handleTarget();
    
    int hitx = int(loc.x+2000)/gridSize;
    int hity = int(loc.z+2000)/gridSize;

    if (map2.get(hitx, hity) == white) {
     
      loc.add(dir);


    } else {
      lives = 0;
   

      for (int i =0; i < 5; i++) {
        objects.add(new Particle(loc));
      }
      
     
    }//end else
  }//end act

  void handleTarget(){
      for (int i= 0; i < targetList.size(); i++) {
        Target t = targetList.get(i);
        
        float distance = dist(loc.x, loc.y, loc.z, t.loc.x, t.loc.y, t.loc.z);
        //if (PVector.dist(loc, t.loc) < t.size/2) {
          

        if( distance < t.size/2){
          
          t.bulletHit();
          lives = 0;
            for (int p =0; p < 5; p++) {
        objects.add(new Particle(loc));
      }
         
        }
      }//end for loop
  
}//end handle target
}
