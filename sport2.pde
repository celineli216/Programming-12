import fisica.*;
//palette
color blue   = color(29, 178, 242);
color brown  = color(166, 120, 24);
color green  = color(74, 163, 57);
color red    = color(224, 80, 61);
color yellow = color(242, 215, 16);
color purple = #8700C1;
color white = #FCFEFF;
color teal = #55EDFF;
color blackT = color(0, 0, 0, 100);
color whiteT = color(255, 255, 255, 100);

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
int ballBounce;
boolean greenScored;
boolean whiteScored;

//mode framework
final int intro = 1;
final int game = 2;
final int win = 3;
int mode;

  //button
  boolean mouseReleased;
  boolean wasPressed;
  PImage buttonPic;
  Button introButton;
//displays
gif introScene;
PImage court;

PImage player1;
PImage player2;
PImage ballImg;

void setup() {
  size(800, 600);
  rectMode(CENTER);
  imageMode(CENTER);
  //button intro
  introButton = new Button("START", 400, 300, 200, 100, blackT, whiteT);
  court = loadImage("court.jpg");
  player1 = loadImage("player1.png");
  player2 = loadImage("player2.png");
  ballImg = loadImage("ball.png");
  player1.resize(100, 70);
  player2.resize(100, 70);
  ballImg.resize(50, 70);
  //=====
  makeWorld();


  
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

  ballBounce = 1;

  //
  mode = 1;

  //gifs
  introScene = new gif("frame_", "_delay-0.07s.gif", 95, 5, 400, 300, 800, 600);
}

void draw() {
  click();
  if (mode == 1) {
    intro();
  } else if (mode == 2) {
    game();
  } else {
    win();
  }
}
