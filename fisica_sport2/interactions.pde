boolean wkey;
boolean skey;
boolean akey;
boolean dkey;
boolean upkey;
boolean downkey;
boolean rightkey;
boolean leftkey;
boolean spacekey;
void keyPressed() {
  if (key == 'w') wkey = true;
  if (key == 's') skey = true;
  if (key == 'a') akey = true;
  if (key == 'd') dkey = true;
  if (keyCode == UP) upkey = true;
  if (keyCode == DOWN) downkey = true;
  if (keyCode == RIGHT) rightkey = true;
  if (keyCode == LEFT) leftkey = true;
  if (key == ' ') spacekey = true;
}


void keyReleased() {
  if (key == 'w') wkey = false;
  if (key == 's') skey = false;
  if (key == 'a') akey = false;
  if (key == 'd') dkey = false;
  if (keyCode == UP) upkey = false;
  if (keyCode == DOWN) downkey = false;
  if (keyCode == RIGHT) rightkey = false;
  if (keyCode == LEFT) leftkey = false;
  if (key == ' ') spacekey = false;
}
