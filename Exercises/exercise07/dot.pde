//dot

// a class that defnes the dots you paint on the screen

class Dot {

  //boolean
  boolean replay = true;

  //speed and size of the dot
  int speed = 5;
  int size = 20;

  //sets the velocity of the dots
  float vx;
  float vy;

  //defines the x y position of the balls
  float x;
  float y;

  //defines the colour of the dot
  color dotColor= color(0, 0, 0);

  Dot(int _x, int _y, color _color) {

    x=_x;
    y=_y;
    dotColor=_color;
    vx= speed;
    vy= speed;
  }

  void update() {
    x += vx;
    y += vy;
  }

  void display() {
    fill(0, 0, 0);
    noStroke();
    ellipse(x, y, size, size);
  }

  //Code found online on an open source platform:
  //checks if the object is off screen and makes it "wrap around" the screen.
  //source: https://openprocessing.org/sketch/52869
  boolean checkBoundary() {
    if (x<-40) {
      x = width+39;
      return true;
    }
    if (y<-40) {
      y = height+39;
      return true;
    }
    if (x>width+39) {
      x = -40;
      return true;
    }
    if (y>height+39) {
      y = -40;
      return true;
    }
    //all move off screen
    return false;
  }
}