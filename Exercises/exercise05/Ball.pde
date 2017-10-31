class Ball {


  float tx = random(0, 100);
  float ty = random(0, 100);
  float speed = 7;
  float x;
  float y;
  int ballHeight;
  int ballWidth;

  Ball(int _x, int _y, int _height, int _width) {
    x = _x;
    y= _y;
    ballHeight = _height;
    ballWidth= _width;
  }

  //taken from example noise code to create organic random movement
  void update() {
    println(mouseX);
    float vx = speed * (noise(tx) * 2 - 1);
    float vy = speed * (noise(ty) * 2 - 1);
     x += vx;
    y += vy;
   
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

  void display() {
    ellipse(x, y, ballWidth, ballHeight);
    tx += 0.01;
    ty += 0.01;
  }
  
  //Counts the points when you click the ball
   void mousePressed(){
  if(dist(mouseX, mouseY, x, y) < ballWidth/2){
    scoreVis ++;
    } 
    
  }

}