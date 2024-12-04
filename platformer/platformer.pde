//fix bridge regen with playerDead boolean
import fisica.*;
FWorld world;
PImage map;
color white = #FFFFFF;
color black = #000000;
color red = #EA311C;
color blue = #86CBFF;
color orange = #FFC95D;
color brown = #5F4A1F;
color pink = #F2A4EE;
color purple = #CAA5FF;

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

//enemies
color goombaC = #c7506b;
color wallC = #595959;

color thwompC = #ff05ff;

color hammerBroC = #ff0505;
color hammerWallC = #eb7575;

//trampoline
color trampolineBlue = #3f37db;

//lava
color lavaOrange = #ffa600;


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

//textures==========================
PImage grass;
PImage ice;
PImage dirt;
PImage spike;
PImage bridge;
PImage treeTrunk;
PImage treeTopW;
PImage treeTopC;
PImage treeTopE;
PImage treeTopM;
PImage trampoline;
//character animations================
PImage[] idle;
PImage[] jump;
PImage[] run;
PImage[] action;

//enemies
PImage[] goomba;
FGoomba gmb;

PImage[] thwompPic;
FThwomp thwomp;

PImage[] hammerBroPic;
PImage hammerPic;
FHammerBro hammerBro;
FHammer hammer;


//lava
PImage[] lavaPic;

int direction;

final int L = -1;
final int R = 1;



void setup() {
  //game booleans
  //playerDead = false;
  //playerDeadNum = 0;
  direction = R;
  bridgeReset = false;

  //texttures========
  grass = loadImage("grass.png");
  grass.resize(32, 32);

  ice = loadImage("ice.png");
  ice.resize(32, 32);

  dirt = loadImage("dirt.png");
  dirt.resize(32, 32);

  spike = loadImage("spike.png");//get new spike texture
  spike.resize(32, 32);

  treeTrunk = loadImage("tree_trunk.png");

  treeTopW = loadImage("treetop_w.png");
  treeTopE = loadImage("treetop_e.png");
  treeTopC = loadImage("treetop_center.png");
  treeTopM = loadImage("tree_intersect.png");

  bridge = loadImage("bridge.png");

  trampoline = loadImage("trampoline.png");

  //load actions===================
  idle = new PImage[2];
  idle[0] = loadImage("idle0.png");
  idle[1] = loadImage("idle1.png");

  jump = new PImage[1];
  jump[0] = loadImage("jump0.png");

  run = new PImage[3];
  run[0] = loadImage("runright0.png");
  run[1] = loadImage("runright1.png");
  run[2] = loadImage("runright2.png");

  action = idle;


  reverseImage(run[0]).save("runright0.png");
  reverseImage(run[1]).save("runright1.png");
  reverseImage(run[2]).save("runright2.png");

  goomba = new PImage[2];
  goomba[0] = loadImage("goomba0.png");
  goomba[0].resize(gridSize, gridSize);
  goomba[1] = loadImage("goomba1.png");
  goomba[1].resize(gridSize, gridSize);

  thwompPic = new PImage [2];
  thwompPic[0] = loadImage("thwomp0.png"); //asleep
  thwompPic[1] = loadImage("thwomp1.png");//angry

  thwompPic[0].resize(gridSize*2, gridSize*2);
  thwompPic[1].resize(gridSize*2, gridSize*2);

  hammerBroPic = new PImage[2];
  hammerBroPic[0] = loadImage("hammerbro0.png");
  hammerBroPic[1] = loadImage("hammerbro1.png");

  hammerPic = new PImage();
  hammerPic = loadImage("hammer.png");

  lavaPic = new PImage[6];
  lavaPic[0] = loadImage("lava0.png");
  lavaPic[1] = loadImage("lava1.png");
  lavaPic[2] = loadImage("lava2.png");
  lavaPic[3] = loadImage("lava3.png");
  lavaPic[4] = loadImage("lava4.png");
  lavaPic[5] = loadImage("lava5.png");

  lavaPic[0].resize(gridSize, gridSize);
  lavaPic[1].resize(gridSize, gridSize);
  lavaPic[2].resize(gridSize, gridSize);
  lavaPic[3].resize(gridSize, gridSize);
  lavaPic[4].resize(gridSize, gridSize);
  lavaPic[5].resize(gridSize, gridSize);
  //bridge = loadImage("bridge.png"); //get new bridge texture

  //===========================
  fullScreen();
  Fisica.init(this);
  terrain = new ArrayList <FGameObject>();
  enemies = new ArrayList <FGameObject>();
  lava = new ArrayList <FGameObject>();
  hammerList = new ArrayList <FGameObject>();
  world = new FWorld(-10000, -10000, 10000, 10000);
  world.setGravity(0, 900);
  map = loadImage("texturemap.png");
  loadWorld(map);
  loadPlayer();
  
}

void loadWorld(PImage img) {
  for (int y = 0; y < img.height; y++) {

    for (int x = 0; x < img.width; x++) {
      color c = img.get(x, y); // colour of current piel
      color s = img.get(x, y+1); //colour below current pixel
      color w = img.get(x-1, y); //colour west of current pixel
      color e = img.get(x+1, y); //colour east of current pixel
      //color n = img.get(x, y-1); //colour above current pixel
      FBox b = new FBox(gridSize, gridSize);
      b.setPosition(x*gridSize, y*gridSize);
      b.setStatic(true);
      b.setNoStroke();

      if (c == grassGreen) {
        b.attachImage(grass);
        b.setFillColor(grassGreen);
        b.setFriction(4);

        b.setName("grass");
        world.add(b);
      } else if (c == dirtBrown) {
        b.setFillColor(dirtBrown);
        b.attachImage(dirt);
        b.setName("dirt");
        world.add(b);
      } else if (c == trunkBrown) {
        b.setFillColor(trunkBrown);
        b.setName("tree trunk");
        b.attachImage(treeTrunk);
        b.setSensor(true); // puts it in the background
        world.add(b);
      } else if (c == leafGreen1 ) { //middle
        b.setFillColor(leafGreen1);
        b.setName("leaf1");
        b.attachImage(treeTopC);
        b.setFriction(4);
        world.add(b);
      } else if (c == leafGreen2 && w != leafGreen2  && e == leafGreen1) { //end
        b.setFillColor(leafGreen2);
        b.setName("leaf2");
        b.attachImage(treeTopW);
        b.setFriction(4);
        world.add(b);
      } else if (c == leafGreen2 && w == leafGreen1 && e != leafGreen2) { //end
        b.setFillColor(leafGreen2);
        b.setName("leaf2");
        b.attachImage(treeTopE);
        b.setFriction(4);
        world.add(b);
      } else if (c == leafGreen3 && s == trunkBrown) { //middle piece
        b.setFillColor(leafGreen3);
        b.setFriction(4);
        b.attachImage(treeTopM);
        b.setName("leaf3");
        world.add(b);
      } else if (c == iceBlue) {
        b.setFillColor(iceBlue);
        b.setFriction(0);
        b.attachImage(ice);
        b.setName("ice");
        world.add(b);
        //traps
      } else if (c == spikeGrey) {
        b.setFillColor(spikeGrey);
        b.setFriction(4);
        b.attachImage(spike);
        b.setName("spike");
        world.add(b);
        //fancy terrain
      } else if (c == bridgeBrown ) {
        FBridge bridgePiece = new FBridge(x * gridSize, y * gridSize);
        bridgePiece.setRotatable(false);
        bridges.add(bridgePiece);
        bridgePiece.attachImage(bridge);
        terrain.add(bridgePiece);
        world.add(bridgePiece);
      }
      //enemies
      else if ( c == goombaC) {
        FGoomba gmb = new FGoomba(x*gridSize, y*gridSize);
        enemies.add(gmb);
        world.add(gmb);
      } else if ( c== wallC) {
        b.setFillColor(wallC);
        b.setFriction(4);
        b.setName("wall");
        world.add(b);
      } else if (c == trampolineBlue) {
        b.setFillColor(trampolineBlue);
        b.setFriction(0);
        b.setRestitution(3);
        b.attachImage(trampoline);
        b.setName("trampoline");
        world.add(b);
      } else if (c == lavaOrange) {
        FLava lav = new FLava(x*gridSize, y*gridSize);
        lava.add(lav);
        world.add(lav);
      } else if (c == thwompC) {
        FThwomp thwomp = new FThwomp(x*gridSize, y*gridSize);
        enemies.add(thwomp);
        b.setFillColor(thwompC);
        world.add(thwomp);
      } else if (c == hammerBroC) {
        hammerBro = new FHammerBro(x * gridSize, y * gridSize); // Assign to global variable
        enemies.add(hammerBro); // Add it to the enemies list
        b.setFillColor(hammerBroC);
        world.add(hammerBro);
      } else if (c == hammerWallC) {
        b.setFillColor(hammerWallC);
        b.setName("hammerWall");
        b.attachImage(grass);
        b.setFriction(4);

        world.add(b);
      }
    }//=======================================
  }//=======================================
}//=======================================

void loadPlayer() {
  player = new FPlayer();
  player.act();

  world.add(player);
}
void draw() {
  background(blue);

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
