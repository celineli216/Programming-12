void drawMap() {
  for (int x = 0; x < map2.width; x++) {
    for (int y = 0; y < map2.height; y ++) {
      color c = map2.get(x, y);
      if (c == lightBlue) {
        for (int i =1; i< 4; i++) {
          texturedCube(x*gridSize-2000, height-(gridSize*i), y*gridSize-2000, brick, gridSize);
        }
      } else if (c == black) {
        for (int i =1; i< 4; i++) {
          texturedCube(x*gridSize-2000, height-(gridSize*i), y*gridSize-2000, diamond, gridSize);
        }
      }
    }
  }
} //end drawMap


void drawFocalPoint() {
  pushMatrix();
  translate(focusX, focusY, focusZ);
  fill(255, 0, 0);
  sphere(2);
  popMatrix();
}


void drawFloor(int start, int end, int level, int gap) {
  stroke(255);
  int x = start;
  int z = start;
  while (z < end) {
    texturedCube(x, level, z, oakPlank, gap);
    //line(x, level, start, x, level, end);
    //line(start, level, z, end, level, z); // x, y, z, x, y, z
    x += gap;
    if (x >= end) {
      x = start;
      z += gap;
    }
  }
}
