class Ball {


  float tx = random(0, 100);
  float ty = random(0, 100);
  float speed = 10;
  float x;
  float y;


  Ball(int _x, int _y) {
    x = _x;
    y= _y;
  }

  void update() {
    float vx = speed * (noise(tx) * 2 - 1);
    float vy = speed * (noise(ty) * 2 - 1);
    x += vx;
    y += vy;
  }

  void display() {
    ellipse(x, y, 20, 20);
    tx += 0.01;
    ty += 0.01;
  }
}