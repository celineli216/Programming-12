gif rain, duck;
void setup(){
  size(800, 600);
  imageMode(CENTER);
  rain = new gif("frame_", "_delay-0.06s.gif", 20, 5, 400, 300, 800, 600);
  duck = new gif("frame_", "_delay-0.04s.gif", 15, 5, 400, 500, 100, 200);
  

}

void draw(){
  rain.show();
  duck.show();

}
