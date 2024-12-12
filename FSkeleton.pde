class FSkeleton extends FGameObject {
  float sx;
  float sy;

  boolean willAttack;
  boolean isAttack;
  boolean r;
  boolean l;

  boolean isDead;

  int speed;

  int frame = 0;

  FBox detect;

  FSkeleton(float x, float y) {
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
    detectPlayer();
    animate();
    move();
  }

  void animate() {
    if (frame >= skeletonAction.length) frame = 0;
    if (frameCount % 2 == 0) {
      skeletonAction[frame].resize(gridSize*6, gridSize*6);
      if (r )attachImage(skeletonAction[frame]);
      if (l ) attachImage(reverseImage(skeletonAction[frame]));
      frame++;
    }
  }
  void attack() {
  }
  //void animateAttack() {
  //  if (frame >= skeletonAttack.length) frame = 0;

  //  if (frameCount % 5 == 0) {
  //    attachImage(skeletonAttack[frame]);
  //    frame++;
  //  }
  //}
  //void animateWalk() {
  //  if (frame >= skeletonWalk.length) frame = 0;

  //  if (frameCount % 5 == 0) {
  //    if (r) attachImage(skeletonWalk[frame]);
  //    if (l) attachImage(reverseImage(skeletonWalk[frame]));
  //    frame++;
  //  }
  //}

  //void animateIdle() {
  //  if (frame >= skeletonIdle.length) frame = 0;

  //  if (frameCount % 5 == 0) {
  //    attachImage(skeletonIdle[frame]);
  //    frame++;
  //  }
  //}

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
      skeletonAction = skeletonWalk;
    }

    if (l == true && willAttack == true) {
      setVelocity(-speed, vy);
      skeletonAction = skeletonWalk;
    }
  }
}
