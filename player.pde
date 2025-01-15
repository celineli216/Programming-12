//fix jump to idle animation delay
class FPlayer extends FGameObject {

  int frame;
  int bladeFrame;
  int lives;
  float health;
  FBox attackBox;

  boolean attackRight;
  boolean attackLeft;

  int direction = R;


  FPlayer() {
    super (gridSize, gridSize*2);
    setPosition(35, 1450);
    setName("player");
    setRotatable(false);
    setFillColor(red);
    frame = 0;
    bladeFrame = 0;
    lives = 3;
    health = 100;

    attackRight = false;
    attackLeft = false;
  }

  void attack() {
    FBox attackBox = new FBox(gridSize, gridSize);
    if (direction == R) {
      attackBox.setPosition(getX() + gridSize/2, getY());
    } else {
      attackBox.setPosition(getX() - gridSize/2, getY());
    }


    attackBox.setName("knightAttackBox");
    attackBox.setStrokeWeight(1);
    //attackBox.setStroke(0);
    attackBox.setNoStroke();
    attackBox.setNoFill();
    world.add(attackBox);
    attackBox.setStatic(false);

    attackBox.setSensor(true);
  }


  void act() {
    handleInput();
    //animateKnight();
    animateBlade();
    handleHealth();
    healthBar();




    if (isTouching("spike")) {
      playerDead = true;
      setPosition(100, 0);
      resetBridge();
    } else if (isTouching("lava")) {
      playerDead = true;
      setPosition(100, 0);
      resetBridge();
    } else if (isTouching("thwomp")) {
      playerDead = true;
      setPosition(100, 0);
    } else if (isTouching("hammer")) {
      playerDead = true;
      setPosition(100, 0);
    } else {
      playerDead = false;
    }
  }//end act==========================


  //void animateKnight() {
  //  if (frame >= knight_action.length) frame = 0;
  //  if (frameCount % 2 == 0) {
  //    knight_action[frame].resize(gridSize*5, gridSize*5);
  //    if (direction == R )attachImage(knight_action[frame]);
  //    if (direction == L ) attachImage(reverseImage(knight_action[frame]));
  //    frame++;
  //  }
  //}

  //  void animateBlade() {
  //  if (bladeFrame >= blade_action.length) bladeFrame = 0;
  //  if (frameCount % 2 == 0) {
  //    blade_action[bladeFrame].resize(gridSize, gridSize);
  //    if (direction == R )attachImage(blade_action[bladeFrame]);
  //    if (direction == L ) attachImage(reverseImage(blade_action[bladeFrame]));
  //    bladeFrame++;
  //  }
  //}

  void animateBlade() {

    if (frame >= blade_action.length) frame = 0;
    if (frameCount % 2 == 0) {

      blade_action[frame].resize(gridSize*2, gridSize*2);

      if (direction == R )attachImage(blade_action[frame]);
      if (direction == L ) attachImage(reverseImage(blade_action[frame]));
      frame++;
    }
  }

  void handleInput() {
    float vy = getVelocityY();
    float vx = getVelocityX();
    if (abs(vy) < 0.1) {
      knight_action = knight_idle;
      blade_action = blade_idle;
    }
    if (akey) {
      knight_action = knight_run;
      blade_action = blade_run;
      direction = L;

      setVelocity(-220, vy);
    }

    if (dkey) {
      knight_action = knight_run;
      blade_action = blade_run;
      direction = R;
      attackRight = true;
      setVelocity (220, vy);
    }

    if (wkey) {
      setVelocity(vx, -200);
    }
    if (spacekey) {
      knight_action = knight_attack;
      blade_action = blade_attack;
      attack();
    }

    if (nkey) {
      knight_action = knight_attack;
      blade_action = blade_throw;
      throwKnife();
    }
    if ( abs(vy) > 0.1) {
      knight_action = knight_jump;
      blade_action = blade_jump;
    }
  }//end handle input=======

  void throwKnife() {
    FKnife knife = new FKnife();
    knifeList.add(knife);
    world.add(knife);
  }

  void healthBar() {
    float barLength;
    //health bar shortens from both sides because rectMode(CENTER)
    pushStyle();
    rectMode(CORNER);
    barLength = map(health, 0, 100, 0, gridSize * 9 );
    //barLength = gridSize*9;
    fill(brown);
    //health bar background
    rect(100, 50, gridSize*10, gridSize/2);

    //health bar
    fill(grassGreen);
    rect(115, 53, barLength, gridSize/3);

    popStyle();

    //temporary
    fill(grassGreen);
    text(health, 400, 50);
  }

  void handleHealth() {
    if (health <= 0) {
      setPosition(35, 1450);
      lives -= 1;
      health = 100;
    }

    //slime--------
    for (FGameObject enemy : enemies) {
      if (enemy instanceof FSlime) {
        FSlime slimeEnemy = (FSlime) enemy;
        if (slimeEnemy.isAttack) {
          health -= 0.1;
        }
      }
    }
    //end slime------------
    //wizard---------
    for (FGameObject enemy : enemies) {
      if (enemy instanceof FWizard) {
        FWizard wizardEnemy = (FWizard) enemy;
        if (wizardEnemy.isAttack) {
          health -= 0.2;
        }
      }
    }
    //endwizard-------------

    //worm---------
    
    for (FGameObject enemy : enemies) {
      if (enemy instanceof FWorm) {
        FWorm wormEnemy = (FWorm) enemy;
        if (wormEnemy.isAttack) {
          health -= 0.5;
        }
      }
    }
    
    
    //end worm-------------
  }//end handle health=========
}
