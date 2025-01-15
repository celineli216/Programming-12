class FWorm extends FGameObject {


  float health;

  boolean willAttack;
  boolean isAttack;
  boolean r;
  boolean l;

  boolean isDead;

  int speed;

  int frame = 0;
  int direction;
  



  FWorm(float x, float y) {
    super(gridSize*2, gridSize*2);
    

    setPosition(x, y);
    setName("fireworm");
    setRotatable(false);
    willAttack = false;
    isAttack = false;
    isDead = false;
    speed = 100;
    direction = R; //?
    r = true;
    l = false;

    health = 100;
  }



  void act() {
    animateIdle();
    detectPlayer();
    attack();
    move();
    
    attacked();
  }





  void attack() {
    if (isTouching("player")) {
      isAttack = true;
      
      animateAttack();
      
      //skeletonAction = skeletonAttack;
    } else if (willAttack == true){
      animateAttack();
      throwFireball();
    }
    
    if (isTouching("player") == false) {
      isAttack = false;
    }
  }



  void animateAttack() {
    if (frame >= wormAttack.length) frame = 0;

    if (frameCount % 5 == 0) {
      if (r) attachImage(wormAttack[frame]);
      if (l) attachImage(reverseImage(wormAttack[frame]));
      frame++;
    }
  }
  void animateWalk() {
    if (frame >= wormWalk.length) frame = 0;

    if (frameCount % 5 == 0) {
      if (r) attachImage(wormWalk[frame]);
      if (l) attachImage(reverseImage(wormWalk[frame]));
      frame++;
    }
  }

  void animateIdle() {
    if (frame >= wormIdle.length) frame = 0;

    if (frameCount % 5 == 0) {
      if (r) attachImage(wormIdle[frame]);
      if (l) attachImage(reverseImage(wormIdle[frame]));
      frame++;
    }
  }

  void detectPlayer() {
    if (player.getX() > getX()) {
      r = true;
      direction = R;
    } else {
      r = false;
    }

    if (player.getX() < getX()) {
      l = true;
      direction = L;
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
     
    }

    if (l == true && willAttack == true) {
      animateWalk();
      setVelocity(-speed, vy);
      
    }
  }


  void attacked() {
    if (isTouching("knightAttackBox")) {
      health -= 2;
    } else if (isTouching("knife")) {
      health -= 2;
    }
    if (health <= 0) {
      isDead = true;
      world.remove(this);
      enemies.remove(this);
    }
  }
//alter so that it shoots a fireball one at a time
  void throwFireball() {
if (frameCount % 100 == 0) {
    FFireball fireball = new FFireball(this);
    fireballList.add(fireball);
    world.add(fireball);
  }
  }
}
