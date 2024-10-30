class Button {
  int x, y, w, h;
  boolean clicked;
  color highlight, normal;
  String text;
  PImage img;

  Button(String t, int _x, int _y, int _w, int _h, color norm, color high) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    text = t;
    highlight = high;
    normal = norm;
    clicked = false;
  }
  
  Button(PImage pic, int _x, int _y, int _w, int _h, color norm, color high){
    x = _x;
    y = _y;
    h = _h;
    w = _w;
    highlight = high;
    normal = norm;
    clicked = false;
    img = pic;
  }

  void show() {

    tactile();
    drawButton();
    drawLabel();
    checkClicks();

  }

  boolean touchingMouse() {
    return mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2;
  }

  void drawButton() {
    //draws button and tactile
    stroke(0);
    strokeWeight(1);
    rect(x, y, w, h, 30);
  }

  void drawLabel() {
    textAlign(CENTER, CENTER);
          if (touchingMouse()) {
      fill(normal);
    } else {
      fill(highlight);
    }

    
    if (img == null){
          textSize(w/4);
    text(text, x, y);
    }
    else{
      image(img, x, y, w, h);
    }
  }
  
  void tactile(){
      if (touchingMouse()) {
      fill(highlight);
    } else {
      fill(normal);
    }

  }
  
  void checkClicks(){
  
    if (mouseReleased && touchingMouse()) {
      clicked = true;
    } else {
      clicked = false;
    }
  }
}
