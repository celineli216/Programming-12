import fisica.*;

//palette
color blue   = color(29, 178, 242);
color brown  = color(166, 120, 24);
color green  = color(74, 163, 57);
color red    = color(224, 80, 61);
color yellow = color(242, 215, 16);

//mouse
boolean mouseReleased;
boolean wasPressed;
PImage buttonPic;
//modes
final int intro = 1;
final int game = 2;
int mode;

//player 1


FPoly ground;


//fisica
FWorld world;

void setup() {
  //make window
  size(800, 600);
  rectMode(CENTER);

  //player1========================
  x = 400;
  y = 300;
  //loc = new PVector(startx, starty);
  //vel = new PVector (0, 0);
  //jump = new PVector(0, 0);
//================================

  //initialise world
  makeWorld();

  //add terrain to world
  makeGround();
  makePlatform();
  makeP1();

  mode = 1;
}

////===========================================================================================

//void makeWorld() {
//  Fisica.init(this);
//  world = new FWorld();
//  world.setGravity(0, 900);
//}

////===========================================================================================
//void makePlatform(){
//  FBox platform1 = new FBox(200, 20);
//  platform1.setPosition(400, 300);

//  platform1.setStatic(true);
//  platform1.setFillColor(brown);
//  platform1.setFriction(0.1);

//  world.add(platform1);

//}
//void makeGround() {
//  ground = new FPoly();

//  //plot the vertices of this platform
//  ground.vertex(0, height- 100);
//  ground.vertex(width, height - 100);
//  ground.vertex(width, height);
//  ground.vertex(0, height);

//  // define properties
//  ground.setStatic(true);
//  ground.setFillColor(brown);
//  ground.setFriction(0.1);

//  //put it in the world
//  world.add(ground);
//}

////===========================================================================================


//===========================================================================================

void draw() {
  //println("x: " + mouseX + " y: " + mouseY);

  click();
  if (mode == intro) {
    intro();
  } else if (mode == game) {
    game();
  }
  text(mode, 400, 100);





  //world.step();
  //world.draw();
}


//===========================================================================================




//void makeBox() {
//  FBox box = new FBox(25, 100);
//  box.setPosition(400, 300);

//  //set visuals
//  box.setStroke(0);
//  box.setStrokeWeight(2);
//  box.setFillColor(green);

//  //set physical properties
//  box.setDensity(0.2);
//  box.setFriction(1);
//  box.setRestitution(0.25);

//  world.add(box);


//}

//===========================================================================================
