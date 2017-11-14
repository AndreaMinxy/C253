//dot

// a class that defnes the dots you paint on the screen

class Dot {

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
  color dotColor= color(0,0,0);

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
    ellipse(x, y, size, size);
    fill(0,0,0);
    noStroke();
  }
  
   //Code found online on an open source platform:
  //checks if the object is off screen and makes it "wrap around" the screen.
  //source: https://openprocessing.org/sketch/52869
  void checkBoundary() {
    if (x<-40) {
      x = width+39;
    }
    if (y<-40) {
      y = height+39;
    }
    if (x>width+39) {
      x = -40;
    }
    if (y>height+39) {
      y = -40;
    }
    //all move off screen
  }
}