// Chris Acker
// December 18, 2016

class Block {
  float x = 0;
  float y = 0;
  float xspeed = 1;
  float yspeed = 0;

  boolean score(PVector pos) {
    float d = dist(x, y, pos.x, pos.y);
    if (d < 1) {
      return true;
    } else {
      return false;
    }
  }

  void dir(float x, float y) {
    xspeed = x;
    yspeed = y;
  }
// how should death be handled?
  void death() {
    
  }

  void update() {
    //println(total + " " + tail.size());

    x = x + xspeed*scl;
    y = y + yspeed*scl;
    // if square goes "out of bounds", circle back around
    if (x > width && xspeed > 0) {
      x = 0;
    } else if (x < 0 && xspeed < 0) {
      x = width;
    } else if (y < 0 && yspeed < 0) {
      y = width;
    } else if (y > width && yspeed > 0) {
      y = 0;
    }
  }
// 
  void show() {
    if (blocks.get(currBlock).equals(this)) {
      fill(0, 0, 255);
    } else {
      fill(255);
    }
    rect(x, y, scl, scl);
  }
}