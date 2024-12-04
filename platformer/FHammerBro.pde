class FHammerBro extends FGameObject {
  //float hx;
  //float hy;
  int direction = L;
  int speed = 50;
  int frame = 0;

  FHammerBro(float x, float y) {
    //hx = x;
    //hy = y;
    super(gridSize, gridSize);
    setPosition(x, y);
    setName("hammerBro");
    setRotatable(false);
  }

  void act() {
    animate();
    move();
    collide();
    throwHammer();
  }

  void animate() {
    if (frame >= hammerBroPic.length) frame = 0;

    if (frameCount % 5 == 0) {
      if (direction == R) attachImage(hammerBroPic[frame]);
      if (direction == L) attachImage(reverseImage(hammerBroPic[frame]));
      frame++;
    }
  }//end animate

  void move() {
    float vy = getVelocityY();
    setVelocity(speed * direction, vy);
  }//end move

  void collide() {
    if (isTouching("hammerWall")) {
      direction *= -1;
      if (direction < 0) {
        setPosition(getX()+direction-5, getY());
      } else {
        setPosition(getX()+direction+5, getY());
      }
    }

    //kill player/hammerbro
    if (isTouching("player")) {
      if (player.getY() < getY()-gridSize/2) {
        world.remove(this);
        enemies.remove(this);
        player.setVelocity(player.getVelocityX(), -300);
      } else {
        player.lives--;
        player.setPosition(260, 1400);
      }
    }
  }//end collide

  void throwHammer() { // left off here, add hammers arraylist & make hammer/projectile class (?)

    if (frameCount % 200 == 0) {
      FHammer hammer = new FHammer();
      hammerList.add(hammer);
      world.add(hammer);
    }
  }//end throwHammer
}
