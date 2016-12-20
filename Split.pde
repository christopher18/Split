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
  frameRate(5);
  pickLocation();
}
// this will be the code that changes where the goal is
void pickLocation() {
  int cols = width/scl;
  int rows = height/scl;
  goal = new PVector(floor(random(cols)), floor(random(rows)));
  goal.mult(scl);
}

void draw() {
  background(51);
  // retrieve the current time
  long currTime = System.currentTimeMillis();
  // check if its been 10 seconds yet
  if (currTime - lastTimeBlock > 10000) {
    lastTimeBlock = currTime;
    addBlock(blocks.get(currBlock).x, blocks.get(currBlock).y);
  }
  // for each block, update block's position and show it.
  for (int i = 0; i < blocks.size(); i++) {
    // it is important that the update and show happends before the if statement
    blocks.get(i).update();
    blocks.get(i).show();
    // if the position of the block is the same as the goal, remove the block from ArrayList
    if (blocks.get(i).score(goal)) {
      blocks.remove(i);
      nextBlock();
    }
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
  nextBlock();
}

// add a new block, takes coordinates x and y
void addBlock(float xpos, float ypos) {
  Block b = new Block();
  // set coordinates of new block
  b.x = xpos;
  b.y = ypos;
  // send block off in a random direction
  int rand = floor(random(4));
  if (rand == 0) {
    b.dir(0, -1);
  } else if (rand == 1) {
    b.dir(0, 1);
  } else if (rand == 2) {
    b.dir(1, 0);
  } else {
    b.dir(-1, 0);
  }
  blocks.add(b);
}

// increment currBlock and set to 0 if at end
void nextBlock() {
  if (currBlock + 1 > blocks.size() - 1) {
    currBlock = 0;
  } else {
    currBlock++;
  }
}