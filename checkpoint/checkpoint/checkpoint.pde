//colours
color beige = #EADB8C;
color red = #FF2E2E;
color blue = #B2D5FF;
color brown = #6C4D45;
color yellow = #FFE45D;
color green = #56D32D;
color darkBlue = #021239;
color white = #FFFFFF;
color black = #000000;
// animation variables
int bcolour;
int sunY, moonY;
boolean day;
float starsX, starsY;



void setup(){
  size(800, 600);
  
 //init animation
 
  bcolour = 1;
  sunY = 700;
  moonY = 700;
  day = true;


   

  
  
  
}

void draw(){
   //animation
     starsX = random(800);
  starsY = random(600);
    if (sunY > -100 && day == true ){
    sunY -= 6;
    if(sunY <= -100){
      day =! day;
      sunY = 700;
    }
      //if(sunY == -100){
      //  day =! day;
      //  sunY = 700;
      //}
  }
  
  if (moonY >-100 && day == false ){
    moonY -= 6;
    if(moonY <= -100){
      day =! day;
      moonY = 700;
    }
      //if (moonY == -100){
      //  moonY = 700;
      //}
  }
  
  if (day == true){
    bcolour = blue;
  }
  
  if (day == false){
    bcolour = darkBlue;
  }
  

  
    if (day == true){
  background(bcolour);
  }
  else{
    background(bcolour);
  
  }


    if(day == false){
    stars();
  }
  body();
  roof();
  window();
  door();
  sun();
  moon();
  ground();
  trunk();
  leaves();
  

  

  
  

}

void stars(){

  fill(white);
  circle(starsX, starsY, 5);
  
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



void sun(){
  fill(yellow);
  circle(700, sunY, 100);
}

void moon(){
  fill(white);
  circle(700, moonY, 100);
  fill(darkBlue);
  noStroke();
  circle(670, moonY, 100);
}

void ground(){
  fill(green);
  rect(0, 500, 800, 100);
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
