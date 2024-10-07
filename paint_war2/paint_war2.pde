PGraphics gameField;
color blue = #3C1FFF;
color lightBlue = #96CAFC;
color red = #FF261F;
color pink = #FF7474;

 //*******
Blue p1;
Red p2;
Timer myTimer;
 //*******
 
//MODE FRAMEWORK
//int mode;
//final int INTRO = 1;
//final int GAME = 2;
//final int WIN = 3;

void setup() {
  size(800, 600);
  rectMode(CENTER);

  //game field
  //***
  gameField = createGraphics(width, height);
  //*******
  
  //======
  //mode = INTRO;
  
  //******
  p1 = new Blue(100, 300);
  p2 = new Red(width-100, 300);
  myTimer = new Timer(10);
  background(255);
  //*******
  
}


void draw() {
  //  if (mode == INTRO) {
  //  intro();
  //} else if (mode == GAME) {
  //  game();
  //}
  // else if(mode == WIN) {
  //  win();
  //}
  //else {
  //  println("mode error" + mode);
  //}
  
  //*******
  image(gameField, 0, 0);
  gameField.beginDraw();
  p1.show();
  p1.act();
  p2.show();
  p2.act();
  
  
  //timer box
  fill(255);
  rect(400, 90, 120, 80);
  myTimer.show();
  myTimer.act();
  
  gameField.endDraw();
  
  //********
  if(myTimer.curTime == -1){
    noLoop();
    winner();
  }
  
}

void winner(){
  gameField.loadPixels();
  
  int blueCount = 0;
  int redCount = 0; 
  for(int i =0; i < gameField.pixels.length; i++){
    color c = gameField.pixels[i];
    
    if(c == lightBlue){
      blueCount++;
    }
    if(c == pink){
      redCount++;
    }
  }
  
  if(blueCount > redCount){
    text("BLUE WINS", width/2, height/2);
  }
  else if(redCount > blueCount){
    text("RED WINS", width/2, height/2);
  }
  else{
    text("TIE", width/2, height/2);
  }
}
