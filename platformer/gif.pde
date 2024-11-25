class gif {
  PImage [] frames;
  String beforeFrame;
  String afterFrame;
  int numFrame;
  int speed;
  int currentFrame;
  float x, y, w, h;

  gif(String bFrame, String aFrame, int nFrame, int s, float _x,  float _y) {
    frames = new PImage[nFrame];
    beforeFrame = bFrame;
    afterFrame = aFrame;
    numFrame = nFrame;
    speed = s;
    currentFrame = 0;
    x = _x;
    y = _y;

    for (int i = 0; i < numFrame; i++) {
      frames[i] = loadImage(beforeFrame + i + afterFrame);
    }
    
    w = frames[0].width;
    h = frames[0].height;
  }
  
    gif(String bFrame, int nFrame, int s, float _x,  float _y) {
    frames = new PImage[nFrame];
    beforeFrame = bFrame;
    numFrame = nFrame;
    speed = s;
    currentFrame = 0;
    x = _x;
    y = _y;

    for (int i = 0; i < numFrame; i++) {
      frames[i] = loadImage(beforeFrame + i);
    }
    
    w = frames[0].width;
    h = frames[0].height;
  }
  
  gif(String bFrame, String aFrame, int nFrame, int s, float _x, float _y, float _w, float _h){
    this(bFrame, aFrame, nFrame, s, _x, _y);//calls other constructor
    w = _w;
    h = _h;
    
  }

  void show() {
    if (currentFrame == numFrame) currentFrame = 0;//makes sure its not @ the end, if @ the end it loops back
    image(frames[currentFrame], x, y, w, h);
    if(frameCount % speed == 0) currentFrame++;
  }

  void act() {
  }
}
