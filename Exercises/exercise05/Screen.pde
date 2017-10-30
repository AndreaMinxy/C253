class Screen {

  //initializing the properties of the screens
  int screenWidth;
  int screenHeight;
  int x;
  int y;
  int vx;

  //defining the properties/arguments of the screens
  Screen(int _x, int _y, int _width, int _height, int _vx) {

    x =_x;
    y =_y;
    screenHeight =_height;
    screenWidth =_width;
    vx =_vx;
  }

  void update() {
    println(x);
    x += vx;

    if (x==499 || x>499) {
      vx = -vx;
    } else if (x==1 || x<1) {
      vx = -vx;
    }
  }


  void display() {
    rect(x, y, screenWidth, screenHeight);
    rectMode(CENTER);
    fill(255);
    noStroke();
  }
}