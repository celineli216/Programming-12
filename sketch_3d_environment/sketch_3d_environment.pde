
import java.awt.Robot;
//colours
color darkBlue = #3f37db;
color lightBlue = #99f3ff;
color black = #000000;
color white = #FFFFFF;
Robot rbt;
boolean skipFrame;


//map variables
int gridSize;
PImage map;
PImage map2;
boolean wkey, akey, skey, dkey, spacekey;
float eyeX, eyeY, eyeZ, focusX, focusY, focusZ, tiltX, tiltY, tiltZ;
float leftRightHeadAngle, upDownHeadAngle;
PImage brick;
PImage diamond;
PImage oakPlank;

ArrayList<GameObject> objects;


void setup() {
  //textures
  objects = new ArrayList<GameObject>();
  brick = loadImage("Stone_Bricks.png");
  diamond = loadImage("Diamond.png");
  oakPlank = loadImage("oak_plank.png");
  fullScreen(P3D);
  //size(displayWidth, displayHeight, P3D);
  textureMode(NORMAL);


  wkey = akey = skey = dkey = false;
  eyeX = width/2;
  eyeY = 9* height/10;
  eyeZ = height/2;
  focusX = width/2;
  focusY = height/2;
  focusZ = 10;
  tiltX = 0;
  tiltY = 1;
  tiltZ = 0;

  //initialize map
  
  map2 = loadImage("map2.png");
  gridSize = 100;

  leftRightHeadAngle = 0;
  //noCursor();
  try {
    rbt = new Robot();
  }
  catch(Exception e) {
    e.printStackTrace();
  }
  skipFrame = false; 
  
  //targets
  //Target target = new Target( random(-800, 800), height - gridSize/2, random(-800, 800), 50);
   //Target target = new Target( 500, height, 3200, 50);
  for (int i = 0; i < 5; i++){
    objects.add(new Target( random(-800, 800), height - gridSize/2, random(-800, 800), 50));
  }
}

void draw() {
  background(0);
  //lights();
  pointLight(255, 255, 255, eyeX, eyeY, eyeZ);
  camera(eyeX, eyeY, eyeZ, focusX, focusY, focusZ, tiltX, tiltY, tiltZ);
  fill(0, 255, 0);
  println();

  drawFloor(-2000, 2000, height, 100);  //floor
  drawFloor(-2000, 2000, height-gridSize*4, gridSize); //ceiling
  drawFocalPoint();
  controlCamera();
  drawMap();
  
  int i = 0;
  while(i<objects.size()) {
    GameObject obj = objects.get(i);
    obj.act();
    obj.show();
    if(obj.lives == 0){
      objects.remove(i);
    } else{
      i++;
    }
  }
}
