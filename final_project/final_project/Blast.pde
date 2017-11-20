class Blast {

  // Default values for speed and size
  int SPEED = 5;
  int SIZE = 10;

  // The location of the blast
  int x;
  int y;

  // The velocity of the blast
  int vy;


  //the keys that makes the blast appear
  char shootKey;


  //setting up the constructors

  Blast(int _x, int _y, char _blast) {

    x =_x;
    y = _y;
    vy = SPEED;
    shootKey =_blast;
  }

  void update() {

    //get the blaster moving
    y -=vy;
    
  }

  void display() {
    
    fill(#E828D2);
    noStroke();
    rect(x,y, SIZE, SIZE);
  }
  
  boolean keyClicked(){
    // Check if the key is our right key (l)
    if (key == shootKey) {
      // If so we want a negative y velocity (go upwards)
      vy = -SPEED;
    } 
    return true;
  }
}