// FIX SLIME.ISATTACK NULL POINTER EXCEPTION
//CODE HEALTH BAR
class FPlayer extends FGameObject {

  int frame;
  int lives;
  float health;
  FBox attackBox;
  
  boolean attackRight;
  boolean attackLeft;


  FPlayer() {
    super (gridSize, gridSize);
    setPosition(35, 1450);
    setName("player");
    setRotatable(false);
    setFillColor(red);
    frame = 0;
    lives = 3;
    health = 100;
    
    attackRight = false;
    attackLeft = false;
  }

  void attack() {
    FBox attackBox = new FBox(2*gridSize, 2*gridSize);
    if(direction == R){
    attackBox.setPosition(getX() + gridSize/2, getY());
    }
    else{
      attackBox.setPosition(getX() - gridSize/2, getY());
    }
    
    
    attackBox.setName("knightAttackBox");
    attackBox.setStrokeWeight(1);
    //attackBox.setStroke(0);
    attackBox.setNoStroke();
    attackBox.setNoFill();
    world.add(attackBox);
    attackBox.setStatic(false);
    attackBox.setForce(0, 200);
    attackBox.setSensor(true);

    
  }


  void act() {
    handleInput();
    animate();
    handleHealth();
    healthBar();
    



    if (isTouching("spike")) {
      playerDead = true;
      setPosition(100, 0);
      resetBridge();
    } else if (isTouching("lava")) {
      playerDead = true;
      setPosition(100, 0);
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


  void animate() {
    if (frame >= knight_action.length) frame = 0;
    if (frameCount % 2 == 0) {
      knight_action[frame].resize(gridSize*5, gridSize*5);
      if (direction == R )attachImage(knight_action[frame]);
      if (direction == L ) attachImage(reverseImage(knight_action[frame]));
      frame++;
    }
  }

  void handleInput() {
    float vy = getVelocityY();
    float vx = getVelocityX();
    if (abs(vy) < 0.1) {
      knight_action = knight_idle;
    }
    if (akey) {
      knight_action = knight_run;
      direction = L;
     
      setVelocity(-220, vy);
    }
  
    if (dkey) {
      knight_action = knight_run;
      direction = R;
      attackRight = true;
      setVelocity (220, vy);
    }
     
    if (wkey) {
      setVelocity(vx, -200);
    }
    if (spacekey) {
      knight_action = knight_attack;
      attack();
    }
    if ( abs(vy) > 0.1) {
      knight_action = knight_jump;
    }
  }//end handle input=======

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

    for (FGameObject enemy : enemies) {
      if (enemy instanceof FSlime) {
        FSlime slimeEnemy = (FSlime) enemy;
        if (slimeEnemy.isAttack) {
          health -= 0.1;
        }
      }
    }
  }//end handle health=========
}
