//COLOURS======================================================
  color pink = #F511A6;
  color gray = #AFAFAF;


//===================================================================



int mode;
final int p1 = 1;
final int p2 = 2;

void setup(){
  size(800, 600);
  mode = 1;
  

}

void draw(){
 
  
  if (mode == p1){
    patternOne();  
  }
  if(mode == p2){
    patternTwo();
  }
  
  //buttons
  fill(255, 255, 255, 100);
  stroke(255, 255, 255, 100);
 circle(50, 300, 50);
 circle(750, 300, 50);
  fill(50);
  textSize(45);
 text("<", 37, 315);
 text(">", 740, 315);


}

void mouseClicked(){
  if(dist(50, 300, mouseX, mouseY) < 25 && mode == p2){
    mode -= 1;
  }
    if(dist(750, 300, mouseX, mouseY) < 25 && mode == p1){
    mode += 1;
  }
}
