class FLava extends FGameObject {
  int frame = 0;
  //gif lavaGif;
  FLava(float x, float y) {
    super();
    setPosition(x, y);
    setName("lava");
    setStatic(true);
    //lavaGif = new gif("lava", ".png",  6, 5, x, y);
  }

  void act() {
    //lavaGif.show();
  }


  }
