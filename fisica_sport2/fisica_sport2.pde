import fisica.*;
//palette
color blue   = color(29, 178, 242);
color brown  = color(166, 120, 24);
color green  = color(74, 163, 57);
color red    = color(224, 80, 61);
color yellow = color(242, 215, 16);
FWorld world;
FPoly ground;
FPoly rightBorder;
FPoly leftBorder;
FBox topBorder;
//FPoly rightGoal;
FPoly rightHoop;
FPoly leftHoop;
FBox p1;
FBox p2;
FCircle ball;
boolean onGround;
boolean onGround2;

//scoring
int greenScore;
int whiteScore;
boolean greenScored;
boolean whiteScored;
void setup() {
  size(800, 600);
  rectMode(CENTER);
  makeWorld();

  //makeRightBorder();
  //makeLeftBorder();
  //makeTopBorder();

  makeGround();
  makePlatform();
  makeRightHoop();
  makeLeftHoop();
  makePlayer();
  makePlayerTwo();
  makeCircle();
  onGround = false;


  //scoring
  greenScore = 0;
  whiteScore = 0;
  greenScored = false;
  whiteScored = false;
}

void draw() {
  background(blue);

  world.draw();
  world.step();
  handlePlayerInput();
  handlePlayerInput2();
  checkIfGrounded();
  checkIfGrounded2();

  handleGreenScoring();
  handleWhiteScoring();
  fill(255);
  textSize(50);
  text(whiteScore, 200, 100);
  fill(green);
  text(greenScore, 600, 100);
}

void makeWorld() {
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 450);
  world.setEdges();
}



void makeRightHoop() {
  rightHoop = new FPoly();
  rightHoop.vertex(width-10, 100 +50);
  rightHoop.vertex(width-10, 100 +75 +50);
  rightHoop.vertex(width-75-10-5, 100+75 +50);
  rightHoop.vertex(width-75-10-5, 100 +50);
  rightHoop.vertex(width-75-10, 100 +50);
  rightHoop.vertex(width-75-10, 100+75-5 +50);
  rightHoop.vertex(width-10-5, 100+75-5 +50);
  rightHoop.vertex(width-10-5, 100 +50);

  rightHoop.setStatic(true);
  rightHoop.setFillColor(green);
  rightHoop.setFriction(1);
 
  world.add(rightHoop);
}

void handleWhiteScoring() {
  if(ball.getY() <= 145 && ball.getY() >= 140 && width-75-10 <ball.getX() && ball.getX() < width-10-5) whiteScore++;
}

void makeLeftHoop() {
  leftHoop = new FPoly();
  leftHoop.vertex(10, 100 +50);
  leftHoop.vertex(10, 100 +75 +50);
  leftHoop.vertex(75+10+5, 100+75 +50);
  leftHoop.vertex(75+10+5, 100 +50);
  leftHoop.vertex(75+10, 100 +50);
  leftHoop.vertex(75+10, 100+75-5 +50);
  leftHoop.vertex(10+5, 100+75-5 +50);
  leftHoop.vertex(10+5, 100 +50);

  leftHoop.setStatic(true);
  
  leftHoop.setFriction(0.1);
  world.add(leftHoop);
}

void handleGreenScoring() {
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
void makePlatform() {
  FBox platform1 = new FBox(200, 20);
  platform1.setPosition(400, 400);

  platform1.setStatic(true);
  platform1.setFillColor(brown);
  platform1.setFriction(0.1);

  world.add(platform1);
}

void makePlayer() {

  p1 = new FBox(50, 50);
  p1.setPosition(200, 100);
  p1.setDensity(0.5);
  p1.setFriction(0.1);
  p1.setRestitution(0.5);
  world.add(p1);
}

void handlePlayerInput() {
  float p1_vx = p1.getVelocityX();
  float p1_vy = p1.getVelocityY();
  if (wkey && onGround) {
    p1.setVelocity(p1_vx, -500);
    onGround = false;
  }
  if (akey) p1.setVelocity(-200, p1_vy);
  if (dkey) p1.setVelocity(200, p1_vy);
  if (skey) p1.setVelocity(p1_vx, 300);
}

void checkIfGrounded() {
  float p1_y = p1.getY();
  // Check if the player is close to the ground
  if ( p1_y > height - 150) {
    onGround = true;
  } else if ( p1_y >= 250) { // Adjust the threshold as needed
    onGround = true;
  } else {
    onGround = false;
  }
}

void makePlayerTwo() {

  p2 = new FBox(50, 50);
  p2.setFillColor(green);
  p2.setPosition(600, 100);
  p2.setDensity(0.5);
  p2.setFriction(0.1);
  p2.setRestitution(0.5);
  world.add(p2);
}

void handlePlayerInput2() {
  float p2_vx = p2.getVelocityX();
  float p2_vy = p2.getVelocityY();
  if (upkey && onGround2) {
    p2.setVelocity(p2_vx, -500);
    onGround = false;
  }
  if (leftkey) p2.setVelocity(-200, p2_vy);
  if (rightkey) p2.setVelocity(200, p2_vy);
  if (downkey) p2.setVelocity(p2_vx, 300);
}

void checkIfGrounded2() {
  float p2_y = p2.getY();
  // Check if the player is close to the ground
  if ( p2_y > height - 150) {
    onGround2 = true;
  } else if ( p2_y >= 350) { // Adjust the threshold as needed
    onGround2 = true;
  } else {
    onGround2 = false;
  }
}

void makeCircle() {
  ball = new FCircle(50);
  ball.setFillColor(red);
  ball.setPosition(400, 100);
  ball.setDensity(0.3);
  ball.setFriction(0.1);
  ball.setRestitution(1);

  world.add(ball);
}

void contactStarted(FContact c) {
  FBody body1 = c.getBody1();
  FBody body2 = c.getBody2();

  // Check if the ball collided with player 1
  if ((body1 == ball && body2 == p1) || (body2 == ball && body1 == p1)) {
    ball.setVelocity(ball.getVelocityX(), -500);  // Bounce the ball upwards
  }

  // Check if the ball collided with player 2
  if ((body1 == ball && body2 == p2) || (body2 == ball && body1 == p2)) {
    ball.setVelocity(ball.getVelocityX(), -500);  // Bounce the ball upwards
  }
}
