color blue = #3C1FFF;
color lightBlue = #96CAFC;
color red = #FF261F;
color pink = #FF7474;
Blue p1;
Red p2;


void setup() {
  size(800, 600);
  rectMode(CENTER);
  p1 = new Blue(100, 300);
  p2 = new Red(width-100, 300);
  background(255);
  
}


void draw() {
  
  p1.show();
  p1.act();
  p2.show();
  p2.act();
}
