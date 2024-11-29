class FPlayer extends FGameObject {

  int frame;
  int lives;

  FPlayer() {
    super (gridSize, gridSize);
    setPosition(2390, 1300);
    setName("player");
    setRotatable(false);
    setFillColor(red);
    frame = 0;
    lives = 3;
  }

  void act() {
    animate();
    handleInput();
    

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
    if (frame >= action.length) frame = 0;
    if (frameCount % 5 == 0) {
      if (direction == R )attachImage(action[frame]);
      if (direction == L) attachImage(reverseImage(action[frame]));
      frame++;
    }
  }

  void handleInput() {
    float vy = getVelocityY();
    float vx = getVelocityX();
    if (abs(vy) < 0.1) {
      action = idle;
    }
    if (akey) {
      direction = L;
      setVelocity(-220, vy);
      action = run;
      
    }
    if (dkey) {
      direction = R;
      setVelocity (220, vy);
      action = run;
      
    }
    if (wkey) {
      setVelocity(vx, -200);
    }
    if ( abs(vy) > 0.1) {
      action = jump;
    }
  }//end handle input=======
}
