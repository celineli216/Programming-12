class Bullet extends GameObject{
  PVector dir;
  float speed;
  
  Bullet(){
    super(eyeX, eyeY, eyeZ, 10);
    speed = 50;
    float vx = cos(leftRightHeadAngle);
    float vy = tan(upDownHeadAngle);
    float vz = sin(leftRightHeadAngle);
    dir = new PVector(vx, vy, vz);
    dir.setMag(speed);
    
  }
  
  void act(){
    int hitx = int(loc.x+2000)/gridSize;
    int hity = int(loc.z+2000)/gridSize;
    if(map2.get(hitx, hity) == white){
      loc.add(dir);
    } else{
      lives = 0;
      println("bullet hit wall");
      
      for(int i =0; i < 5; i++){
        objects.add(new Particle(loc));
      }
    }//end else
    
    
  }//end act
  
  void handleTarget(){
    int i =0;
    while(i < objects.size()){
      GameObject obj = objects.get(i);
      
      if( PVector.dist(loc, obj.loc) < obj.size/2){
          obj.bulletHit();
          lives = 0;
          break;
      }
      i++;
    }
  
  }


}
