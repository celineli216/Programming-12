//colours
color red = #FF0004;
color blue = #000EFF;

PlayerOne p1;
PlayerTwo p2;
ArrayList<Bullet> bullets;
//ArrayList<Bullet> bullets;
void setup() {
  size(600, 400);
  rectMode(CENTER);
  p1 = new PlayerOne(0+50, height/2);
  p2 = new PlayerTwo (width - 50, height/2);
  bullets = new ArrayList<Bullet>();
  //p2 = new Player(width - 50, height/2);
}

void draw() {
  background(0);
  p1.show();
  p1.act();
  int i = 0;
  while (i < bullets.size()){
    Bullet b = bullets.get(i);
    b.show();
    b.act();
    i++;
    

  }
  //  int i = 0;
  //while (i <= bullets.size()){
  //  Bullet currentBullet = bullets.get(i);
  //  currentBullet.act();
  //  currentBullet.show();
  //  i++;
  //}
  p2.show();
  p2.act();


}
