class FKnife extends FGameObject{
  float vy = getVelocityY();
  float vx = getVelocityX();
  float y = getY();
  float x = getX();
  
  FKnife(){
    super(gridSize/2, gridSize/2);
    if(player.direction > 0){
    setPosition(player.getX() + gridSize/4, player.getY());
    
    }
    if(player.direction < 0){
      setPosition(player.getX() - gridSize/4, player.getY());
    }
    attachImage(knifePic);
    setSensor(false);
    setVelocity(player.direction * 900, 0);

    setName("knife");
    
  }
  
    void act() {
    if(isTouching("grass") || isTouching("hammerWall") || isTouching("cobblestone") || isTouching("cobblestoneWall") || isTouching("underDirt") || isTouching("underGrass")||isTouching("reddirt") || isTouching("knife")){
      knifeList.remove(knife);
      world.remove(knife);
      setSensor(true);
      
    }
    
    if(player.direction < 0){
      attachImage(reverseImage(knifePic));
    }
    
  
    
    
    
    
  }




}
