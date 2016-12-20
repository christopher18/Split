// Chris Acker
// December 18, 2016

ArrayList<Block> blocks = new ArrayList<Block>();
int scl = 20;
// keeps track of which block we are controlling
int currBlock = 0;
// keep track of last time a block was created
long lastTimeBlock = System.currentTimeMillis();
PVector goal;

void setup() {
  size(600, 600);
  addBlock(0, 0);
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
  long currTime = System.currentTimeMillis();
  // check if its been 10 seconds yet
  if (currTime - lastTimeBlock > 10000) {
    lastTimeBlock = currTime;
    addBlock(floor(random(width)), floor(random(height)));
  }
  for (int i = 0; i < blocks.size(); i++) {
    blocks.get(i).update();
    blocks.get(i).show();
  }
  
  fill(255, 0, 100);
  rect(goal.x, goal.y, scl, scl);
}
// to do when an arrow key is pressed
void keyPressed() {
  if (keyCode == UP) {
    blocks.get(currBlock).dir(0, -1);
  } else if (keyCode == DOWN) {
    blocks.get(currBlock).dir(0, 1);
  } else if (keyCode == RIGHT) {
    blocks.get(currBlock).dir(1, 0);
  } else if (keyCode == LEFT) {
    blocks.get(currBlock).dir(-1, 0);
  }
  if (currBlock + 1 > blocks.size() - 1) {
    currBlock = 0;
  } else {
    currBlock++;
  }
}

// add a new block, takes coordinates x and y
void addBlock(int xpos, int ypos) {
  blocks.add(new Block());
  blocks.get(blocks.size() - 1).x = xpos;
  blocks.get(blocks.size() - 1).y = ypos;
}