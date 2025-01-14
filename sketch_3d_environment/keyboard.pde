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
