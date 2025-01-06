float rotx, roty;
color blue = #7C99ED;
void setup() {
  size(800, 800, P3D);
  rotx = radians(45);
  roty = radians(45);
}

void draw() {
  background(255);
  cube(width/2, height/2, 0, blue, 200);
  ball(100, 100, 0, blue, 300);
}

void ball(float x, float y, float z, color c, float size) {
  pushMatrix();
  fill(c);
  translate(x, y, z);
  rotateX(rotx);
  rotateY(roty);
  noFill();
  strokeWeight(3);
  sphere(size);
  popMatrix();
}

void cube(float x, float y, float z, color c, float size) {
  pushMatrix();
  translate(x, y, z); //x, y, z
  fill(c);
  strokeWeight(3);
  stroke(0);
  rotateX(rotx);
  rotateY(roty);
  box(size); // width, height, depth
  popMatrix();
}

void mouseDragged() {
  rotx = rotx + (pmouseY - mouseY)* 0.01;
  roty = roty + (pmouseX - mouseX)* -0.01;
}
