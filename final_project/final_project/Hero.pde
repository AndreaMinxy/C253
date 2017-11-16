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


  //the keys that makes the avatar move
  char leftKey;
  char rightKey;

  //setting up the constructors

  Hero(int _x, int _y, char _leftKey, char _rightKey) {

    x =_x;
    y = _y;
    vx = SPEED;
    rightKey = _rightKey;
    leftKey = _leftKey;
  }

  void update() {

    //load the image
    Bisexual =loadImage("flag02.png");
    
    
    //update position with velocity to move the avatar
    x += vx;

    // Constrain the avatar's x position to be in the game screen
    x = constrain(x, 0 + SIZE/2, width - SIZE/2);

  }

  void display() {
  
    //display the image
    imageMode(CENTER);
    image(Bisexual, x, y, SIZE, SIZE);
  }

  void keyPressed() {
    // Check if the key is our right key (l)
    if (key == rightKey) {
      // If so we want a negative x velocity
      vx = SPEED;
    } // Otherwise check if the key is our left key  (a)
    else if (key == leftKey) {
      // If so we want a positive x velocity
      vx = -SPEED;
    }
  }

  void keyReleased() {
    // Check if the key is our right key and if the avatar is moving right
    if (key == rightKey && vx < 0) {
      // If so it should stop
      vx = 0;
    } // Otherwise check if the key is our left key and avatar is moving left
    else if (key == leftKey && vx > 0) {
      // If so it should stop
      vx = 0;
    }
  }
}