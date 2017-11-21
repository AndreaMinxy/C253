class Shield {

  //shield positions
  float x;
  float y;

  //shield color
  color shieldColor;

  Shield(float _x, float _y, color _shieldColor) {
    x = _x;
    y= _y;
    shieldColor = _shieldColor;
  }

  void update() {
  }

  void display() {
    fill(shieldColor);
    rect(x, y, 50, 20);
  }
  
  boolean fade(){
  
  }
}