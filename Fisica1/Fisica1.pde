import fisica.*;

//palette
color blue   = color(29, 178, 242);
color brown  = color(166, 120, 24);
color green  = color(74, 163, 57);
color red    = color(224, 80, 61);
color yellow = color(242, 215, 16);

color pink = #FF03F3;

color purple = #8700C1;

color white = #FCFEFF;
color teal = #55EDFF;
//assets
PImage redBird;

FPoly topPlatform;
FPoly bottomPlatform;

//cloud and image
int x1, x2;
PImage donut;

//buttons
int gravity;
boolean isGravity;
boolean isFbodies;
boolean mouseReleased;
boolean wasPressed;
PImage buttonPic;
Button button1;
Button button2;

//fisica
FWorld world;

void setup() {
  rectMode(CENTER);
  //make windows

  //vloud vars
  x1 = 100;
  x2 = width/2;
  donut = loadImage("donut.png");
  donut.resize(50, 50);
  
  //button variables
  
  isGravity = true;
  isFbodies = true;
  gravity = 900;
  
  button1 = new Button("GRAVITY", 300, 500, 100, 50, green, white);
  button2 = new Button("SPAWN", 300, 600, 100, 60, blue, pink);
  
  //fullScreen();
  size(800, 800);

  //load resources
  redBird = loadImage("red-bird.png");

  //initialise world
  
  makeWorld();
  
  //add terrain to world
  makeTopPlatform();
  makeBottomPlatform();
  
  //button
  
  

}




//===========================================================================================

void makeWorld() {
  Fisica.init(this);
  world = new FWorld();
  
  //world.setGravity(0, gravity);
}



//===========================================================================================

void makeTopPlatform() {
  topPlatform = new FPoly();

  //plot the vertices of this platform
  topPlatform.vertex(-100, height*.1);
  topPlatform.vertex(width*0.8, height*0.4);
  topPlatform.vertex(width*0.8, height*0.4+100);
  topPlatform.vertex(-100, height*0.1+100);

  // define properties
  topPlatform.setStatic(true);
  topPlatform.setFillColor(brown);
  topPlatform.setFriction(0.1);

  //put it in the world
  world.add(topPlatform);
}

//===========================================================================================

void makeBottomPlatform() {
  bottomPlatform = new FPoly();

  //plot the vertices of this platform

  bottomPlatform.vertex(width, height*0.6);
  bottomPlatform.vertex(width, height*0.6+200);

  bottomPlatform.vertex(width - 150, height*0.6+200);
  bottomPlatform.vertex(width-200, height*0.6+200);


  bottomPlatform.vertex(width - 200, height*0.6);
  bottomPlatform.vertex(width - 150, height*0.6);

  bottomPlatform.vertex(width - 150, height*0.6+100);
  bottomPlatform.vertex(width - 50, height*0.6+100);

  bottomPlatform.vertex(width - 50, height*0.6);








  // define properties
  bottomPlatform.setStatic(true);
  bottomPlatform.setFillColor(brown);
  bottomPlatform.setFriction(0);

  //put it in the world
  world.add(bottomPlatform);
}


//===========================================================================================

void draw() {
  click();
  
  buttonFunc();
  world.setGravity(0, gravity);
  
  println("x: " + mouseX + " y: " + mouseY);
  background(blue);
  
  if (frameCount % 20 == 0 && isFbodies == true) {  //Every 20 frames ...
    makeCircle();
    makeBlob();
    makeBox();
    makeBird();
  }
  world.step();  //get box2D to calculate all the forces and new positions
  
  //clouds===========================
  x1 +=2;
  x2 += 3;
  if (x1 > width+300) {
    x1 = 100;
  }

  if (x2 > width+300) {
    x2 = width/2;
  }
  
  fill(white);
  ellipse(x1, 200, 300, 100);
 
  world.draw();  //ask box2D to convert this world to processing screen coordinates and draw
  makeButtons();
  fill(white);
  ellipse(x2, height/2, 300, 100);
  
    //add buttons
    //buttonFunc();
  
 
  

  //clouds=============================
}


//===========================================================================================
void buttonFunc(){
  //gravity 
  if(button1.clicked) isGravity =! isGravity;
  if(isGravity == false){
    gravity = 0;
  }
  else{
    gravity = 900;
  }
  
  //fbodies
  if(button2.clicked) isFbodies =! isFbodies;
  

}

void makeButtons(){

  button1.show();
  button2.show();
  
}





void makeCircle() {
  FCircle circle = new FCircle(50);
  circle.setPosition(random(width), -5);

  //set visuals
  circle.setStroke(0);
  circle.setStrokeWeight(2);
  circle.setFillColor(red);

  //set physical properties
  circle.setDensity(0.2);
  circle.setFriction(1);
  circle.setRestitution(1);

  //add to world
  world.add(circle);
}

//===========================================================================================

void makeBlob() {
  FBlob blob = new FBlob();

  //set visuals
  blob.setAsCircle(random(width), -5, 50);
  blob.setStroke(0);
  blob.setStrokeWeight(2);
  blob.setFillColor(yellow);

  //set physical properties
  blob.setDensity(0.2);
  blob.setFriction(1);
  blob.setRestitution(0.25);

  //add to the world
  world.add(blob);
}

//===========================================================================================

void makeBox() {
  FBox box = new FBox(50, 50);
  box.setPosition(random(width), -5);

  //set visuals
  box.setStroke(0);
  box.setStrokeWeight(2);
  

  //set physical properties
  box.setDensity(0.5);
  box.setFriction(0.1);
  box.setRestitution(5);
  box.attachImage(donut);
  world.add(box);
}


//===========================================================================================

void makeBird() {
  FCircle bird = new FCircle(48);
  bird.setPosition(random(width), -5);

  //set visuals
  bird.attachImage(redBird);

  //set physical properties
  bird.setDensity(0.8);
  bird.setFriction(1);
  bird.setRestitution(0.5);
  world.add(bird);
}
