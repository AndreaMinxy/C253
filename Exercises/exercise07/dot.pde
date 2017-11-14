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
}