void patternTwo(){
  background(0);
  triangles(400, 300);
  
}

void triangles(float x, float y){
  pushMatrix();
  translate(x, y);
  triangle(-25, -25, 0, -50, 25, -25);
  popMatrix();

  
}
