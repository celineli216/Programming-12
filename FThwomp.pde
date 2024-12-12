class FThwomp extends FGameObject {

  float tx;
  float ty;
  FBox detect;
  boolean isAwake;

  FThwomp(float x, float y) {
    super(gridSize*2, gridSize*2);
    setPosition(x, y+15);


    tx = x;
    ty = y;
    setStatic(true);
    setName("thwomp");
    FBox detect = new FBox(gridSize, 6*gridSize);
    detect.setPosition(x, y + 3*gridSize); 
    world.add(detect);
    setStatic(true);
    detect.setStatic(true);
    detect.setSensor(true);
    detect.setNoFill();
    detect.setNoStroke();
  }

  void act() {
    attachImage(thwompPic[0]);
    awake();
  }
  // return mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2;
  void awake() {
    //if(player.getX() > tx - gridSize/2 && player.getX() < tx + gridSize/2 && player.getY() > ty - gridSize/2 && player.getY() < ty + gridSize/2){
    //  isAwake = true;
    //  attachImage(thwompPic[1]);

    //}
    if (player.getX() > tx - gridSize && player.getX() < tx + gridSize && player.getY() > ty) {
      isAwake = true;
    }
    if (isAwake) {
      attachImage(thwompPic[1]);
      setStatic(false);
    }

  }//end awake
}
