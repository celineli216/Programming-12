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

//underworld textures

PImage blueCobble;
PImage blackCobble;
PImage brownGem;
PImage underDirt;
PImage underGrass;
PImage skull;
PImage redDirt;
//character animations================
PImage[] knight_idle;
PImage[] knight_jump;
PImage[] knight_run;
PImage[] knight_action;
PImage[] knight_attack;

//enemies
PImage[] goomba;
FGoomba gmb;

PImage[] thwompPic;
FThwomp thwomp;

PImage[] hammerBroPic;
PImage hammerPic;
FHammerBro hammerBro;
FHammer hammer;

PImage[] slimeIdle;
FSlime slime;
PImage[] slimeMove;
PImage[] slimeAttack;

PImage[] skeletonIdle;
PImage[] skeletonWalk;
PImage[] skeletonAttack;
PImage[] skeletonAction;
FSkeleton skeleton;


//lava
PImage[] lavaPic;



void vloadImage() {
  background = loadImage("underworld_bg1.png");
  
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

  //underworld============
  blueCobble = loadImage("blue_cobble.png");
  blueCobble.resize(gridSize, gridSize);

  blackCobble = loadImage("black_cobble1.png");
  blackCobble.resize(gridSize, gridSize);

  underGrass = loadImage("underground_grass2.png");
  underGrass.resize(gridSize, gridSize);

  underDirt = loadImage("underworld_dirt2.png");
  underDirt.resize(gridSize, gridSize);
  
  redDirt = loadImage("red_dirt.png");
  redDirt.resize(gridSize, gridSize);
  
  brownGem = loadImage("brown_gem.png");
  brownGem.resize(gridSize, gridSize);

  skull = loadImage("skull.png");
  skull.resize(gridSize, gridSize);
  //load actions===================
  //idle = new PImage[2];
  //idle[0] = loadImage("idle0.png");
  //idle[1] = loadImage("idle1.png");

  //jump = new PImage[1];
  //jump[0] = loadImage("jump0.png");

  //run = new PImage[3];
  //run[0] = loadImage("runright0.png");
  //run[1] = loadImage("runright1.png");
  //run[2] = loadImage("runright2.png");

  //action = idle;


  //reverseImage(run[0]).save("runright0.png");
  //reverseImage(run[1]).save("runright1.png");
  //reverseImage(run[2]).save("runright2.png");


//PLAYER ANIMATIONS=======================================

  knight_idle = new PImage[11];
  for (int i =0; i < knight_idle.length; i++) {
    knight_idle[i] = loadImage("knight_idle" + i + ".png");
  }

  knight_jump = new PImage[1];
  for (int i =0; i < knight_jump.length; i++) {
    knight_jump[i] = loadImage("knight_jump"+ i + ".png");
  }

  knight_run = new PImage[7];
  for (int i =0; i < knight_run.length; i++) {
    knight_run[i] = loadImage("knight_run" + i + ".png");
  }

  //for (int i =0; i < knight_run.length; i++) {
  //  reverseImage(knight_run[i]).save("knight_run" + i + ".png");
  //}

  knight_attack = new PImage[7];

  for (int i =0; i < knight_attack.length; i++) {
    knight_attack[i] = reverseImage(loadImage("knight_attack" + i + ".png"));
  }
  
  //  for (int i =0; i < knight_run.length; i++) {
  //  reverseImage(knight_attack[i]).save("knight_attack" + i + ".png");
  //}

  knight_action = knight_idle;


  //end player animations
  
  slimeIdle = new PImage[4];
  for (int i = 0; i < slimeIdle.length; i++){
    slimeIdle[i] = loadImage("slime-idle-" + i + ".png");
    slimeIdle[i].resize(gridSize, gridSize);
  }
  
  slimeMove = new PImage[3];
    for (int i = 0; i < slimeMove.length; i++){
    slimeMove[i] = loadImage("slime-move-" + i + ".png");
    slimeMove[i].resize(gridSize, gridSize);
  }
  
    slimeAttack = new PImage[5];
    for (int i = 0; i < slimeAttack.length; i++){
    slimeAttack[i] = loadImage("slime-attack-" + i + ".png");
    slimeAttack[i].resize(gridSize, gridSize);
  }
  
  //SKELETON IMAGES===========================
    skeletonIdle = new PImage[4];
  for (int i = 0; i < skeletonIdle.length; i++){
    skeletonIdle[i] = loadImage("skeleton_idle" + i + ".png");
    skeletonIdle[i].resize(gridSize*3, gridSize*3);
  }
  
  skeletonWalk = new PImage[4];
    for (int i = 0; i < skeletonWalk.length; i++){ 
    skeletonWalk[i] = loadImage("skeleton_walk" + i + ".png");
    skeletonWalk[i].resize(gridSize*3, gridSize*3);
  }
  
    skeletonAttack = new PImage[8];
    for (int i = 0; i < skeletonAttack.length; i++){
    skeletonAttack[i] = loadImage("skeleton_attack" + i + ".png");
    skeletonAttack[i].resize(gridSize*3, gridSize*3);
  }
  
  skeletonAction = skeletonIdle;
  
  
  

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
}
