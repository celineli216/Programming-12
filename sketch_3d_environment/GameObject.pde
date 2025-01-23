class GameObject{
  PVector loc;
  float size;
  float lives;
  
  GameObject(){
    loc = new PVector(0, 0, 0);
    size = 10;
    lives = 1;
  }
  
  GameObject(float x, float y, float z, float s){
    lives = 1;
    loc = new PVector(x, y, z);
    size = s;
  }
  
  void act(){
  
  }
  
  void show(){
    pushMatrix();
    translate(loc.x, loc.y, loc.z);
    //fill(white);
    fill(0, 0, 255);
    stroke(100);
    box(size);
    
    //fill(255, 0, 0);
    
    //sphere(size);
    
    popMatrix();
  }
  
  void bulletHit(){}
  



}
