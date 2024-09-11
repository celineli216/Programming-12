void patternOne() {
  background(0);
  int x =-50;
  int y = -50;
  while(y < 600){
    x += 100;
  
  if(x >= 800){
    x = -50;
    y += 100;

  }
  circles(x, y);
  }







  //while(x < 900){
  //  noFill();
  //  stroke(255);
  //  strokeWeight(5);
  //  circle(x ,y + 100, 200);
  //  x += 200;
}

void circles(int x, int y) {
  pushMatrix();
  translate(x, y);
  noFill();
  stroke(pink);
  strokeWeight(5);
  //middles
  circle(0, 0, 100);
  //top two
  circle(-50, -50, 100);
  circle(50, -50, 100);
  //bottom two
  circle(-50, 50, 100);
  circle(50, 50, 100);
  popMatrix();
  
}
