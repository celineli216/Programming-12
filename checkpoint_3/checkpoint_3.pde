color red = #FA0303;
color blue = #C3EAF7;
color lightGrey = #B2B2B2;
color darkGrey = #767676;
color navy = #5C5E89;



void setup(){
  size(800, 600);


}


void draw(){
  background(navy);
  car(400, 300, 0.5, 90);
  car(200, 400, 1, 45);
  car(300, 100, 2, 30);




}

void car(int x, int y, float s, float r){
  pushMatrix();
  translate(x, y);
  scale(s);
  rotate(radians(r));
  top();
  window();
  bottom();
  wheel(30, 60);
  wheel(170, 60);
  popMatrix();

}

void bottom(){
  noStroke();
  fill(red);
  rect(0, 0, 200, 60); 
  //rect(300, 270, 200, 60);
  
}

void top(){
  fill(red);
  noStroke();
  ellipse(100, 0, 130, 100);
}

void window(){
  fill(blue);
  ellipse(100, 0, 100, 70);
}

void wheel(int x, int y){
  pushMatrix();
  translate(x, y);
  fill(0);
  circle(0, 0, 50);
  popMatrix();
 
}
