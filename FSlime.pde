class FSlime extends FGameObject {
 
  float sx;
  float sy;

  boolean willAttack;
  boolean isAttack;
  boolean r;
  boolean l;
  
  boolean isDead;

  int speed;

  int frame = 0;

  FSlime(float x, float y) {


    super(gridSize, gridSize);

    sx = x;
    sy = y;

    isAttack = false;
    willAttack = false;

    r = true;
    l = false;

    speed = 100;


    setPosition(x, y);

    setRotatable(false);
    
    isDead = false;
  }

  void act() {
    if (willAttack == true) {
      fill(0);
      text("will attack", width/2, height/2-200);
    } else {
      text("won't attack", width/2, height/2-200);
    }
    animate();
    move();
    attack();
    detectPlayer();
    attacked();
    touchLava();
  }
  void animate() {
    animateIdle();
  }

  void detectPlayer() {

    if (player.getX() > getX()) {
      r = true;
    } else {
      r = false;
    }

    if (player.getX() < getX()) {
      l = true;
    } else {
      l = false;
    }
    // return mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2;
    if (player.getX() > getX() - gridSize*6 && player.getX() < getX() + gridSize*6 && player.getY() > getY() - gridSize) {
      willAttack = true;
    } else {
      willAttack = false;
    }
  }


  void move() {
    float vy = getVelocityY();

    if (r == true && willAttack == true) {
      setVelocity(speed, vy);
      animateMove();
    }

    if (l == true && willAttack == true) {
      setVelocity(-speed, vy);
      animateMove();
    }
  }

  void attack() {
    if (isTouching("player")) {
      isAttack = true;
      animateAttack();
    } else {
      isAttack = false;
    }
  }

  void animateIdle() {
    if (frame >= slimeIdle.length) frame = 0;

    if (frameCount % 5 == 0) {
      if (l) attachImage(slimeIdle[frame]);
      if (r) attachImage(reverseImage(slimeIdle[frame]));
      frame++;
    }
  }

  void animateMove() {
    if (frame >= slimeMove.length) frame = 0;

    if (frameCount % 5 == 0) {
      if (l) attachImage(slimeMove[frame]);
      if (r) attachImage(reverseImage(slimeMove[frame]));
      frame++;
    }
  }

  void animateAttack() {
    if (frame >= slimeAttack.length) frame = 0;

    if (frameCount % 2 == 0) {
      if (l) attachImage(slimeAttack[frame]);
      if (r) attachImage(reverseImage(slimeAttack[frame]));
      frame++;
    }
  }

  void touchLava() {
    if (isTouching("lava")) {
      setPosition(sx, sy);
    }
  }
  
  void attacked(){
    if(isTouching("knightAttackBox")){
      isDead = true;
      world.remove(this);
      enemies.remove(this);
    }
  }
}//end FSlime class=========
