boolean wkey, akey, skey, dkey;
float eyeX, eyeY, eyeZ, focusX, focusY, focusZ, tiltX, tiltY, tiltZ;
float leftRightHeadAngle, upDownHeadAngle;
void keyPressed() {
  if (key == 'w') wkey = true;
  if (key == 's') skey = true;
  if (key == 'a') akey = true;
  if (key == 'd') dkey = true;
}

void keyReleased() {
  if (key == 'w') wkey = false;
  if (key == 's') skey = false;
  if (key == 'a') akey = false;
  if (key == 'd') dkey = false;
}

void setup() {
  size(800, 600, P3D);
  textureMode(NORMAL);
  wkey = akey = skey = dkey = false;
  eyeX = width/2;
  eyeY = height/2;
  eyeZ = 0;
  focusX = width/2;
  focusY = height/2;
  focusZ = 10;
  tiltX = 0;
  tiltY = 1;
  tiltZ = 0;
  
  leftRightHeadAngle = 0;
  noCursor();
}

void draw() {
  background(0);
  camera(eyeX, eyeY, eyeZ, focusX, focusY, focusZ, tiltX, tiltY, tiltZ);
  
  drawFloor();
  drawFocalPoint();
  controlCamera();
}

void drawFocalPoint(){
  pushMatrix();
  translate(focusX, focusY, focusZ);
  sphere(5);
  popMatrix();
}


void drawFloor() {
  stroke(255);


  for (int x = -2000; x <= 2000; x += 100) {
    line(x, height, -2000, x, height, 2000);
    line(-2000, height, x, 2000, height, x); // x, y, z, x, y, z
  }
}

void controlCamera() {
  
  if (wkey) eyeZ -= 10;
  if (skey) eyeZ += 10;
  if (akey) eyeX -= 10;
  if (dkey) eyeX += 10;
  
  leftRightHeadAngle  = leftRightHeadAngle + (mouseX - pmouseX)* 0.01;
  upDownHeadAngle = upDownHeadAngle + (mouseY - pmouseY)  * 0.01;
  if(upDownHeadAngle > PI/2.5) upDownHeadAngle = -PI/2.5;
  
  focusX = eyeX + cos(leftRightHeadAngle) * 300;
  focusZ = eyeZ + sin(leftRightHeadAngle) * 300; 
  focusY = eyeY + tan(upDownHeadAngle)*300;
  
  
  println(eyeX, eyeY, eyeZ);
}