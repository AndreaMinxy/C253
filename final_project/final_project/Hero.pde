//Class Hero

//the protagonist of the game, the Bisexual. It needs to move left and right so it needs an 
//x position, a y poistion, a vx and a vy for speed, and a width and  a height

class Hero {

  //the keys that makes the blast appear
  char shootKey;

  //define the image
  PImage Bisexual;

  // Default values for speed and size
  int SPEED = 5;
  int SIZE = 60;

  // The location of the flag
  float x;
  float y;

  // The velocity of the flag
  float vx;

  //the keys that makes the avatar move
  char leftKey;
  char rightKey;

  //setting up the constructors

  Hero(float _x, float _y, char _leftKey, char _rightKey, char _shootKey) {

    x =_x;
    y = _y;
    vx = SPEED;
    rightKey = _rightKey;
    leftKey = _leftKey;
    shootKey = _shootKey;
  }

  void update() {    
    //update position with velocity to move the avatar
    x += vx;

    // Constrain the avatar's x position to be in the game screen
    x = constrain(x, 0 + SIZE/2, width - SIZE/2);

    //load the image
    Bisexual =loadImage("flag02.png");

    //call the shoot blast function
    shootBlast();
    
    //call the handle hit function
    handleHit();
    
  }

  void display() {

    //display the image
    imageMode(CENTER);
    image(Bisexual, x, y, SIZE, SIZE);
  }

//make the blasts appear
  void shootBlast() {
    //check the list of blasts and update thei movement and display their form
    for (int i = 0; i < allBlast.size(); i++) { 
      if (allBlast.get(i).update()) {
        allBlast.remove(i);
      } else {
        allBlast.get(i).display();
      }
    }
  }
  
  //check if hero got hit by bullet
  void handleHit() {
   
    for (int i = 0; i < allBlast.size(); i++) { 
      allBlast.get(i).display();

      if (allBlast.get(i).collide(this) && (allBlast.get(i).isPlayerShoot == false)) {
        allBlast.remove(i);
        background(255, 0,0);
    }
  }
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

    if (key == shootKey) {
      allBlast.add(new Blast(x, y, true));
    }
  }

  void keyReleased() {
    // Check if the key is our right key and if the avatar is moving right
    if (key == rightKey && vx == SPEED) {
      // If so it should stop
      vx = 0;
    } // Otherwise check if the key is our left key and avatar is moving left
    else if (key == leftKey && vx == -SPEED) {
      // If so it should stop
      vx = 0;
    }
  }
}