class FWizard extends FGameObject {
  float sx;
  float sy;
  
  float health;

  boolean willAttack;
  boolean isAttack;
  boolean r;
  boolean l;

  boolean isDead;

  int speed;

  int frame = 0;

  FBox detect;

  FWizard(float x, float y) {
    super(gridSize*2, gridSize*2);
    sx = x;
    sy = y;
    setPosition(x, y);
    setName("skeleton");
    setRotatable(false);
    willAttack = false;
    isAttack = false;
    isDead = false;
    speed = 100;
    direction = R; //?
    r = true;
    l = false;
    
    health = 100;

    //FBox detect = new FBox(gridSize*10, gridSize*3);
    //detect.setNoFill();
    //detect.setStroke(0);
    //detect.setStatic(true);
    //detect.setSensor(true);
    //detect.setPosition(sx, sy);
    //detect.setName("skeletonDetect");
    //world.add(detect);
  }

  void act() {
    animateIdle();
    detectPlayer();
    move();
    attack();
    attacked();
  }

  //void animate() {
  //  if (frame >= skeletonAction.length) frame = 0;
  //  if (frameCount % 2 == 0) {
  //    skeletonAction[frame].resize(gridSize*6, gridSize*6);
  //    if (r)attachImage(skeletonAction[frame]);
  //    if (l) attachImage(reverseImage(skeletonAction[frame]));
  //    frame++;
  //  }
  //}
  


  
  void attack() {
        if (isTouching("player")) {
      isAttack = true;
      animateAttack();
      //skeletonAction = skeletonAttack;
    } else {
      isAttack = false;
    }
  }
  
  void animateAttack() {
    if (frame >= wizardAttack.length) frame = 0;

      if (frameCount % 5 == 0) {
      if (r) attachImage(wizardAttack[frame]);
      if (l) attachImage(reverseImage(wizardAttack[frame]));
      frame++;
    }
  }
  void animateWalk() {
    if (frame >= wizardRun.length) frame = 0;

    if (frameCount % 5 == 0) {
      if (r) attachImage(wizardRun[frame]);
      if (l) attachImage(reverseImage(wizardRun[frame]));
      frame++;
    }
  }

  void animateIdle() {
    if (frame >= wizardIdle.length) frame = 0;

     if (frameCount % 5 == 0) {
      if (r) attachImage(wizardIdle[frame]);
      if (l) attachImage(reverseImage(wizardIdle[frame]));
      frame++;
    }
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
    //if(player.isTouching("skeletonDetect")){
    //  willAttack = true;

    //}
    //else{
    //  willAttack = false;
    //}

    if (player.getX() > getX() - gridSize*6 && player.getX() < getX() + gridSize*6 && player.getY() > getY() - gridSize*6 && player.getY() < getY() +gridSize*6) {
      willAttack = true;
    } else {
      willAttack = false;
    }
  }//end detectplayer========

  void move() {
    float vy = getVelocityY();

    if (r == true && willAttack == true) {
      setVelocity(speed, vy);
      animateWalk();
      //skeletonAction = skeletonWalk;
    }
    
    if (l == true && willAttack == true) {
      animateWalk();
      setVelocity(-speed, vy);
      //skeletonAction = skeletonWalk;
    }
   
  }
  
  
    void attacked(){
    if(isTouching("knightAttackBox")){
      health -= 2;
      }
      
    else if(isTouching("knife")){
      health -= 2;
      }
      if(health <= 0){
      isDead = true;
      world.remove(this);
      enemies.remove(this);
      }
    
  }
  
} //end wizard class=========================================
