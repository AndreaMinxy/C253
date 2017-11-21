class Blast {

  // Default values for speed and size
  int SPEED = 15;
  int SIZE = 10;

  // The location of the blast
  float x;
  float y;

  // The velocity of the blast
  int vy;

  //setting up the constructor
  Blast(int _x, int _y) {
    x =_x;
    y = _y;
    vy = SPEED;
  }

  boolean update() {

    //get the blaster moving
    y -=vy;

    if (y > width || x<0) {
      return true;
    }
    return false;
  }

  void display() {
    fill(#E828D2);
    noStroke();
    rect(x, y, SIZE, SIZE);
  }
}