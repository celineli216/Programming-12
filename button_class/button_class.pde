Button button[];


color blue = #0354FF;
color pink = #FF03F3;
color red = #FF1008;
color green = #08FF6C;
color purple = #8700C1;
color yellow = #FFF412;
color white = #FCFEFF;
color teal = #55EDFF;
color bkg;
boolean mouseReleased;
boolean wasPressed;
PImage buttonPic;

void setup(){
  size(800, 600);
  rectMode(CENTER);
  imageMode(CENTER);
  buttonPic = loadImage("donut.png");
  
  button = new Button[4];
  button[0] = new Button("BLUE",  500, 200, 400, 380, blue, pink);
  button[1] = new Button("RED",  150, 130, 150, 150, red, white );
  button[2] = new Button("GREEN",  150, 300, 150, 150, green, yellow);
  button[3] = new Button(buttonPic,  400, 500, 600, 150, purple, teal);
  
}


void draw(){
  background(bkg);
  click();
  int i =0;
  while(i< 4){
    button[i].show();
    if(button[i].clicked){
      bkg = button[i].normal;
    }
    i++;
  }


}
