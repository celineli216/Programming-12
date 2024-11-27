class FThwomp extends FGameObject{
  float px; //player x
  float py; // player y
  float tx;
  float ty;
  FBox detect;
  FThwomp(float x, float y){
    super();
    setPosition(x, y);
    //px = player.getX();
    //py = player.getY();
    tx = x;
    ty = y;
    FBox detect = new FBox(gridSize, 4*gridSize);
    detect.setPosition(x, y); //left off here, add detection for thwomp
  
  }
  
  void act(){
    attachImage(thwompPic[0]);

  }
  
  void drawRect(){
   
    
  }
  
  void awake(){
  
  }



}
