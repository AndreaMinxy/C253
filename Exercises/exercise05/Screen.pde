class Screen{

int screenWidth;
int screenHeight;
int x;
int y;



Screen(int _x, int _y, int _width, int _height) {

  x =_x;
  y =_y;
  screenHeight =_height;
  screenWidth =_width;
}


 void display() {
    rect(x, y, screenWidth, screenHeight);
    fill(255);
  
  }
}