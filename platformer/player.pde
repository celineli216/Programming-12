class FPlayer extends FGameObject {

int frame;
int direction;



  FPlayer() {
    super ();
    setPosition(100, 0);
    setName("player");
    setRotatable(false);
    setFillColor(red);
    frame = 0;
    direction = R;
  }

  void act() {

    handleInput();
    animate();

    if (isTouching("spike")) {
      playerDead = true;
      setPosition(100, 0);
      resetBridge();
    
    } else {
      playerDead = false;
    }
  }//end act==========================


  void animate(){
    if(frame >= action.length) frame = 0;
    if(frameCount % 5 == 0){
      if(direction == R )attachImage(action[frame]);
      if(direction == L) attachImage(reverseImage(action[frame]));
      frame++;
    }
  }

  void handleInput() {
    float vy = getVelocityY();
    float vx = getVelocityX();
    if (abs(vy) < 0.1){
      action = idle;
    }
    if (akey) {
      setVelocity(-200, vy);
      action = run;
      direction = L;
    }
    if (dkey) {
      setVelocity (200, vy);
      action = run;
      direction = R;
    }
    if (wkey) {
      setVelocity(vx, -200);
    }
    if( abs(vy) > 0.1){
      action = jump;
    }
  }//end handle input=======
}
