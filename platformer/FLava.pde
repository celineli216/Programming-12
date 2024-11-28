class FLava extends FGameObject{
  int frame;
  FLava(float x, float y){
    super(gridSize, gridSize);
    setPosition(x, y);
    setName("lava");
    setStatic(true);
    setRotatable(false);
    
    frame = int(random(lavaPic.length));
    
  }
  
  void act(){
    animate();
  }
  
  void animate(){
    
    if(frameCount % 5 == 0){
      frame = (frame+1) % lavaPic.length;
      attachImage(lavaPic[frame]);
      
      }
      
    
    
  }//end animate






}
