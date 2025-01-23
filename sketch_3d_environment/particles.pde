class Particle extends GameObject {
  PVector velocity; 
  int lifespan;     

  
  Particle(PVector loc) {
    super(loc.x, loc.y, loc.z, random(5, 9)); 
    velocity = PVector.random3D();           
    velocity.mult(random(2, 5));             
    lifespan = int(random(30, 60));          
  }

 
  void act() {
    loc.add(velocity); 
    lifespan--;        
    if (lifespan <= 0) {
      lives = 0; 
    }
  }

  
  void show() {
    pushMatrix();
    translate(loc.x, loc.y, loc.z);
    noStroke();
    fill(0, 0, 255); 
    sphere(size); 
    popMatrix();
  }
}
