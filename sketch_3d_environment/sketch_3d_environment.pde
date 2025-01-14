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
boolean wkey, akey, skey, dkey;
float eyeX, eyeY, eyeZ, focusX, focusY, focusZ, tiltX, tiltY, tiltZ;
float leftRightHeadAngle, upDownHeadAngle;
PImage brick;
PImage diamond;



void setup() {
  //textures
  brick = loadImage("Stone_Bricks.png");
  diamond = loadImage("Diamond.png");
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
  map = loadImage("map.png");
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
}

void draw() {
  background(0);
  camera(eyeX, eyeY, eyeZ, focusX, focusY, focusZ, tiltX, tiltY, tiltZ);

  drawFloor(-2000, 2000, height, 100);  //floor
  drawFloor(-2000, 2000, height-gridSize*3, 100); //ceiling
  drawFocalPoint();
  controlCamera();
  drawMap();
}

void drawMap() {
  for (int x = 0; x < map.width; x++) {
    for (int y = 0; y < map.height; y ++) {
      color c = map.get(x, y);
      if (c == lightBlue) {
        for(int i =1; i< 4; i++){
        texturedCube(x*gridSize-2000, height-(gridSize*i), y*gridSize-2000, brick, gridSize);
        }
      }
      else if (c == black) {
        for(int i =1; i< 4; i++){
        texturedCube(x*gridSize-2000, height-(gridSize*i), y*gridSize-2000, diamond, gridSize);
        }
      }
    }
  }
} //end drawMap

void drawFocalPoint() {
  pushMatrix();
  translate(focusX, focusY, focusZ);
  sphere(5);
  popMatrix();
}


void drawFloor(int sx, int ex, int y, int i) {
  stroke(255);


  for (int x = sx; x <= ex; x += i) {
    line(x, y, -2000, x, y, 2000);
    line(-2000, y, x, 2000, y, x); // x, y, z, x, y, z
  }
}

void controlCamera() {

  if (wkey) {
    eyeX = eyeX + cos(leftRightHeadAngle) * 10;
    eyeZ = eyeZ + sin(leftRightHeadAngle) * 10;
  }
  if (skey) {
    eyeX = eyeX - cos(leftRightHeadAngle) * 10;
    eyeZ = eyeZ - sin(leftRightHeadAngle) * 10;
  }
  if (akey) {
    eyeX = eyeX + cos(leftRightHeadAngle + radians(90)) * 10;
    eyeZ = eyeZ + sin(leftRightHeadAngle + radians(90)) * 10;
  }
  if (dkey) {
    eyeX = eyeX - cos(leftRightHeadAngle + radians(90)) * 10;
    eyeZ = eyeZ - sin(leftRightHeadAngle + radians(90)) * 10;
  }



  if (skipFrame == false) {
    leftRightHeadAngle = leftRightHeadAngle + (mouseX - pmouseX) * 0.01;
    upDownHeadAngle = upDownHeadAngle + (mouseY - pmouseY) * 0.01;
  }

  if (upDownHeadAngle > PI/2.5) upDownHeadAngle = -PI/2.5;
  if (upDownHeadAngle < -PI/2.5) upDownHeadAngle = -PI/2.5;

  focusX = eyeX + cos(leftRightHeadAngle) * 300;
  focusZ = eyeZ + sin(leftRightHeadAngle) * 300;
  focusY = eyeY + tan(upDownHeadAngle)*300;

  if (mouseX < 2) {
    rbt.mouseMove(width-3, mouseY);
    skipFrame = true;
  } else if (mouseX > width-2) {
    rbt.mouseMove(3, mouseY);
    skipFrame = true;
  } else {
    skipFrame = false;
  }
  println(eyeX, eyeY, eyeZ);
}
