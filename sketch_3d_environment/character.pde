void controlCamera() {

  if (wkey && canMoveForward()) {
    eyeX = eyeX + cos(leftRightHeadAngle) * 10;
    eyeZ = eyeZ + sin(leftRightHeadAngle) * 10;
  }
  if (skey && canMoveBackward()) {
    eyeX = eyeX - cos(leftRightHeadAngle) * 10;
    eyeZ = eyeZ - sin(leftRightHeadAngle) * 10;
  }
  if (dkey && canMoveRight()) {
    eyeX = eyeX + cos(leftRightHeadAngle + radians(90)) * 10;
    eyeZ = eyeZ + sin(leftRightHeadAngle + radians(90)) * 10;
  }
  if (akey && canMoveLeft()) {
    eyeX = eyeX - cos(leftRightHeadAngle + radians(90)) * 10;
    eyeZ = eyeZ - sin(leftRightHeadAngle + radians(90)) * 10;
  }
  
  if(spacekey){
    Bullet bullet  = new Bullet();
    objects.add(bullet);
    
    
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
  //println(eyeX, eyeY, eyeZ);
}

boolean canMoveForward() {
  float fwdx, fwdy, fwdz;
  float leftx, lefty, leftz;
  float rightx, righty, rightz;
  int mapx, mapy;
  //To do: prevent player from walking into walls sideways and backwards


  fwdx = eyeX + cos(leftRightHeadAngle) * 200;
  fwdy = eyeY;
  fwdz = eyeZ + sin(leftRightHeadAngle) * 200;


  mapx = int(fwdx+2000) / gridSize;
  mapy = int(fwdz+2000) / gridSize;

  leftx = fwdx + cos(leftRightHeadAngle + radians(90)) * gridSize / 2;
  lefty = fwdy;
  leftz = fwdz + sin(leftRightHeadAngle + radians(90)) * gridSize / 2;
  
  mapx = int(leftx + 2000) / gridSize;
  mapy = int(leftz + 2000) / gridSize;


  rightx = fwdx - cos(leftRightHeadAngle + radians(90)) * gridSize / 2;
  righty = fwdy;
  rightz = fwdz - sin(leftRightHeadAngle + radians(90)) * gridSize / 2;
  
  mapx = int(rightx + 2000) / gridSize;
  mapy = int(rightz + 2000) / gridSize;
  
  if (map2.get(mapx, mapy) == white) {
    return true;
  } else {
    return false;
  }
}

boolean canMoveBackward() {
  float backx, backy, backz;
  int mapx, mapy;

  backx = eyeX - cos(leftRightHeadAngle) * 200;
  backy = eyeY;
  backz = eyeZ - sin(leftRightHeadAngle) * 200;

  mapx = int(backx + 2000) / gridSize;
  mapy = int(backz + 2000) / gridSize;

  if (map2.get(mapx, mapy) == white) {
    return true;
  } else {
    return false;
  }
}

boolean canMoveRight() {
  float rightx, righty, rightz;
  int mapx, mapy;

  rightx = eyeX + cos(leftRightHeadAngle + radians(90)) * 200;
  righty = eyeY;
  rightz = eyeZ + sin(leftRightHeadAngle + radians(90)) * 200;

  mapx = int(rightx + 2000) / gridSize;
  mapy = int(rightz + 2000) / gridSize;

  if (map2.get(mapx, mapy) == white) {
    return true;
  } else {
    return false;
  }
}

boolean canMoveLeft() {
  float leftx, lefty, leftz;
  int mapx, mapy;

  leftx = eyeX - cos(leftRightHeadAngle + radians(90)) * 200;
  lefty = eyeY;
  leftz = eyeZ - sin(leftRightHeadAngle + radians(90)) * 200;

  mapx = int(leftx + 2000) / gridSize;
  mapy = int(leftz + 2000) / gridSize;

  if (map2.get(mapx, mapy) == white) {
    return true;
  } else {
    return false;
  }
}
