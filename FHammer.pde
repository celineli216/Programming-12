class FHammer extends FGameObject {
  
float vy = getVelocityY();
float py = getY();
  FHammer() {
    super(gridSize, gridSize);
    setPosition(hammerBro.getX(), hammerBro.getY() - 10);
    attachImage(hammerPic);
    setAngularVelocity(5);
    setVelocity(hammerBro.direction * 500, vy - 100);
    setSensor(false);
    setName("hammer");
    
  }

  void act() {
    if(isTouching("grass") || isTouching("hammerWall")){
      hammerList.remove(hammer);
      setSensor(true);
      
    }
    
    
    
    
  }
  
}
