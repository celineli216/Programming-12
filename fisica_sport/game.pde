PVector loc;
PVector vel;
PVector jump;
int x, y;
FBox p1;
void game() {
  background(blue);
  //  //initialise world
  //makeWorld();

  ////add terrain to world
  //makeGround();
  //makePlatform();

  //makeBox();

  actP1();
  world.step();
  world.draw();
}




void makeP1() {
  FBox p1 = new FBox(25, 100);
  
  p1.setPosition(x, y);
 
  //set visuals
  p1.setStroke(0);
  p1.setStrokeWeight(2);
  p1.setFillColor(green);

  //set physical properties
  p1.setDensity(0.2);
  p1.setFriction(1);
  p1.setRestitution(0.25);

  world.add(p1);
}

void actP1() {
  float p1_vx = p1.getVelocityX();
  float p1_vy = p1.getVelocityY();
  if (spacekey) p1.setVelocity(p1_vx, -100);
}






//===========================================================================================

void makeWorld() {
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 900);
}

//===========================================================================================
void makePlatform() {
  FBox platform1 = new FBox(200, 20);
  platform1.setPosition(400, 300);

  platform1.setStatic(true);
  platform1.setFillColor(brown);
  platform1.setFriction(0.1);

  world.add(platform1);
}
void makeGround() {
  ground = new FPoly();

  //plot the vertices of this platform
  ground.vertex(0, height- 100);
  ground.vertex(width, height - 100);
  ground.vertex(width, height);
  ground.vertex(0, height);

  // define properties
  ground.setStatic(true);
  ground.setFillColor(brown);
  ground.setFriction(0.1);

  //put it in the world
  world.add(ground);
}

//===========================================================================================
