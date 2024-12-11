class FGoomba extends FGameObject {
  int direction = L;
  int speed = 50;
  int frame = 0;

  FGoomba(float x, float y) {
    super(gridSize, gridSize);
    setPosition(x, y);
    setName("goomba");
    setRotatable(false);
  }
  void act() {
    animate();
    collide();
    move();
  }
  
  void animate(){
    if(frame >= goomba.length) frame = 0;
    
    if(frameCount % 5 == 0){
      if(direction == R) attachImage(goomba[frame]);
      if(direction == L) attachImage(reverseImage(goomba[frame]));
      frame++;
    }
    
    if(isTouching("player")){
      if(player.getY() < getY()-gridSize/2){
      world.remove(this);
      enemies.remove(this);
      player.setVelocity(player.getVelocityX(), -300);
      } else{
        player.lives--;
        player.setPosition(260, 1400);
      }
    }
    
  }  
  void collide(){
    
    if(isTouching("wall")){
      direction *= -1;
      setPosition(getX()+direction, getY());
    }
    
  }
  
  void move(){
    float vy = getVelocityY();
    setVelocity(speed * direction, vy);
  }
  
}
