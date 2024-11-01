import fisica.*;
FWorld world;
PImage map;
color white = #FFFFFF;
color black = #000000;
color green = #56E070;
color red = #EA311C;
color blue = #86CBFF;
color orange = #FFC95D;
color brown = #5F4A1F;
color pink = #F2A4EE;
color purple = #CAA5FF;


int gridsize = 32;

void setup() {
  size(600, 600);
  Fisica.init(this);
  world = new FWorld(-2000, -2000, 2000, 2000);
  world.setGravity(0, 900);
  map = loadImage("map.png");
  loadWorld(map);
}

void loadWorld(PImage img) {
  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
      color c = img.get(x, y);
      if (c == black) {
        FBox b = new FBox(gridsize, gridsize);
        b.setPosition(x*gridsize, y*gridsize);
        b.setStatic(true);
        world.add(b);
      }
    }
  }
}

void draw() {
  background(white);
  world.step();
  world.draw();
}
