//colours
color beige = #EADB8C;
color red = #FF2E2E;
color blue = #B2D5FF;
color brown = #6C4D45;
color yellow = #FFE45D;
color green = #56D32D;
color darkBlue = #021239;
// animation variables
int bcolour;



void setup(){
  size(800, 600);
 
  bcolour = 0;
  if (bcolour == 0){
  background(blue);
  }
  else{
    background(darkBlue);
  
  }

  
  
  
}

void draw(){
  body();
  roof();
  window();
  door();
  ground();
  sun();
  trunk();
  leaves();
  

}

void body(){
  stroke(0);
  fill(beige);
  rect(200, 200, 400, 300);

}

void roof(){
  fill(red);
    triangle(200, 200, 400, 100, 600, 200);

}

void window(){
  fill(blue);
  square(250, 300, 100);
  square(450, 300, 100);
  stroke(0);
  line(300, 300, 300, 400);
  line(250, 350, 350, 350);
  line(500, 300, 500, 400);
  line(450, 350, 550, 350);
  
}


void door(){
  fill(brown);
  rect(360, 350, 80, 150);
  //KNOB
  fill(yellow);
  circle(430, 425, 10);
}

void ground(){
  fill(green);
  rect(0, 500, 800, 100);
}

void sun(){
  fill(yellow);
  circle(100, 100, 100);
}

void trunk(){
  fill(brown);
  rect(80, 300, 25, 200);
}

void leaves(){
  noStroke();
  fill(green);
  circle(70, 300, 70);
  circle(90, 300, 80);
  circle(100, 270, 100);
  circle(130, 290, 50);
  circle(70, 250, 100);

};
