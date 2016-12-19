// Chris Acker
// December 18, 2016

ArrayList<Block> blocks = new ArrayList<Block>();
int scl = 20;

PVector goal;

void setup() {
  size(600, 600);
  blocks.add(new Block());
  frameRate(10);
  pickLocation();
}

void pickLocation() {
  int cols = width/scl;
  int rows = height/scl;
  goal = new PVector(floor(random(cols)), floor(random(rows)));
  goal.mult(scl);
}

void draw() {
  background(51);

  if (blocks.get(0).eat(goal)) {
    pickLocation();
  }
  
  blocks.get(0).update();
  blocks.get(0).show();

  fill(255, 0, 100);
  rect(goal.x, goal.y, scl, scl);
}

void keyPressed() {
  if (keyCode == UP) {
    blocks.get(0).dir(0, -1);
  } else if (keyCode == DOWN) {
    blocks.get(0).dir(0, 1);
  } else if (keyCode == RIGHT) {
    blocks.get(0).dir(1, 0);
  } else if (keyCode == LEFT) {
    blocks.get(0).dir(-1, 0);
  }
}