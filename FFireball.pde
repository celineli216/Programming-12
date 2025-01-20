class FFireball extends FGameObject {
  
float vy = getVelocityY();
float py = getY();
FWorm worm;
  FFireball(FWorm worm) {
    super(gridSize, gridSize);
    this.worm = worm;
    setPosition(worm.getX(), worm.getY() - 10); //null pointer exception
    attachImage(fireballPic);
    setAngularVelocity(0);
    setVelocity(worm.direction * 500, vy - 100);
    setSensor(false);
    setName("fireball");
    
  }

  void act() {
        if(isTouching("grass") || isTouching("hammerWall") || isTouching("cobblestone") || isTouching("cobblestoneWall") || isTouching("underDirt") || isTouching("underGrass")||isTouching("reddirt") || isTouching("knife") || isTouching("fireball")){

      fireballList.remove(fireball);
      setSensor(true);
      
    }
    
    
    
    
  }
  
}
