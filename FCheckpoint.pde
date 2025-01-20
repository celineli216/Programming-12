class FCheckpoint extends FGameObject{
  
  boolean savedPoint;
  
  FCheckpoint(float x, float y){
    super(gridSize, gridSize);
    setPosition(x, y);
    setRotatable(false);
    setStatic(true);
    savedPoint = false;
    
  }
  
  void act(){
    if(isTouching("player")){
      savedPoint = true;
    }
    
  }




}
