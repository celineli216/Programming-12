void patternThree(){
  background(0);
  rectMode(CENTER);
  
  pattern();



}

void pattern(){
  pushMatrix();
  translate(width/2, height/2);
  noFill();
  stroke(255);
  int i =0;
  float angle = 0;
  while(i < 100){
    scale(0.95);
    rotate(radians(angle));
    rect(0, 0, 400, 400);
    angle += 0.1;
    
  }
  
  popMatrix();
}
