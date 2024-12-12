//fix bridge regen with playerDead boolean
import fisica.*;
FWorld world;
PImage map;
PImage background;
color white = #FFFFFF;
color black = #000000;
color red = #EA311C;
color blue = #86CBFF;
color orange = #FFC95D;
color brown = #5F4A1F;
color pink = #F2A4EE;
color purple = #CAA5FF;
color grey = #58595F;

//ground
color grassGreen = #50ab76;
color dirtBrown = #ed9e70;
color iceBlue = #99f3ff;

//tree
color trunkBrown = #e3755f;
color leafGreen1 = #cff291;
color leafGreen2 = #69c976;
color leafGreen3 = #36777a;

//spikes and traps
color spikeGrey = #b3b3b3;
color bridgeBrown = #6b2f0c;

//coin
color coinC = #d48231;

//enemies
color goombaC = #c7506b;
color wallC = #595959;

color thwompC = #ff05ff;

color hammerBroC = #ff0505;
color hammerWallC = #eb7575;

color slimeC = #05c9ff;

color skeletonC = #9c9c9c;

color wormC = #8c8100;
//trampoline
color trampolineBlue = #3f37db;

//lava
color lavaOrange = #ffa600;

//underworld colours
color cobblestoneBlue = #043d5e;
color cobblestoneBlack = #000000;
color cobblestoneWall = #0a7ec2;

color underDirtC = #261004;
color underGrassC = #03523a;
color gemC = #8c7257;
color skullC = #83855e;
color lava2 = #ff5f03;
color redDirtC = #6e0000;
color stepC = #d48231;


int gridSize = 32;
float zoom = 1.5;

FPlayer player;
ArrayList<FGameObject> terrain;
ArrayList<FGameObject> enemies;
ArrayList<FGameObject> lava;
ArrayList<FGameObject> hammerList;
FLava lav;

boolean playerDead;
ArrayList<FBridge> bridges = new ArrayList<>();
FBridge br;

boolean bridgeReset;


//PLAYER VARIABLES===========



int direction;

final int L = -1;
final int R = 1;




void setup() {
  //game booleans
  //playerDead = false;
  //playerDeadNum = 0;
  
  rectMode(CENTER);

  direction = R;
  bridgeReset = false;
  vloadImage();
  //image(background, 0, 0, 20000, 20000);
  





  //===========================
  fullScreen();
  Fisica.init(this);
  terrain = new ArrayList <FGameObject>();
  enemies = new ArrayList <FGameObject>();
  lava = new ArrayList <FGameObject>();
  hammerList = new ArrayList <FGameObject>();
  world = new FWorld(-10000, -10000, 10000, 10000);
  world.setGravity(0, 900);
  map = loadImage("underworld.png");
  loadWorld(map);
  loadPlayer();
}



void loadPlayer() {
  player = new FPlayer();
  player.act();

  world.add(player);
}
void draw() {

  background(grey);


  drawWorld();
  


  actWorld();

  fill(0);
  textSize(50);
  text(player.getX() + "," + player.getY(), width/2, height/2 - 100);
}

void actWorld() {
  player.act();
  for (int i =0; i< terrain.size(); i++) {
    FGameObject t = terrain.get(i);
    t.act();
  }
  for (int i =0; i< lava.size(); i++) {
    FGameObject l = lava.get(i);
    l.act();
  }
  for (int i =0; i < enemies.size(); i++) {
    FGameObject e = enemies.get(i);
    e.act();
  }
  for (int i =0; i < hammerList.size(); i++) {
    FGameObject h = hammerList.get(i);
    h.act();
  }
}

void resetBridge() {
  for (FBridge bridgePiece : bridges) {
    bridgePiece.resetToOriginal(); // Reset each piece to its original state
  }
}





void drawWorld() {
  pushMatrix();
  translate(-player.getX()*zoom + width/2, -player.getY()*zoom + height/2);
  scale(zoom);
  world.step();
  world.draw();
  popMatrix();
}
