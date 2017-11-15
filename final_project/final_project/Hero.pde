//Class Hero

//the protagonist of the game, the Bisexual. It needs to move left and right so it needs an 
//x position, a y poistion, a vx and a vy for speed, and a width and  a height

class Hero {

  //define the image
  PImage Bisexual;

  // Default values for speed and size
  int SPEED = 5;
  int SIZE = 60;

  // The location of the flag
  int x;
  int y;

  // The velocity of the flag
  int vx;
  int vy;

  //setting up the constructors

  Hero(int _x, int _y) {
    
    x =_x;
    y = _y;
    vx = SPEED;
    vy = SPEED;
  }

  void update() {

    //load the image
    Bisexual =loadImage("flag02.png");
  }

  void display() {

    //display the image
    imageMode(CENTER);
    image(Bisexual, width/2, 550, SIZE, SIZE);
    
  }
}