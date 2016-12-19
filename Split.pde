// Chris Acker
// December 18, 2016

Block b;
int scl = 20;

PVector food;

void setup() {
  size(600, 600);
  b = new Block();
  frameRate(20);
  pickLocation();
}

void pickLocation() {
  int cols = width/scl;
  int rows = height/scl;
  food = new PVector(floor(random(cols)), floor(random(rows)));
  food.mult(scl);
}

void mousePressed() {
  b.total++;
}

void draw() {
  background(51);

  if (b.eat(food)) {
    pickLocation();
  }
  
  b.update();
  b.show();

  fill(255, 0, 100);
  rect(food.x, food.y, scl, scl);
}

void keyPressed() {
  if (keyCode == UP) {
    b.dir(0, -1);
  } else if (keyCode == DOWN) {
    b.dir(0, 1);
  } else if (keyCode == RIGHT) {
    b.dir(1, 0);
  } else if (keyCode == LEFT) {
    b.dir(-1, 0);
  }
}