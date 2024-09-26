Mover[] circle1;
int n = 50;
void setup() {
  size(600, 600);
  circle1 = new Mover[n];
  int i = 0;
  while (i < n) {
    circle1[i] = new Mover();
    i++;
  }
}


void draw() {
  
  int i = 0;
  while (i < n) {
    circle1[i].show();
    circle1[i].act();
    i++;
  }
}
