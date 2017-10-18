// Block
//
// A class that defines a block that the oponents must hit in order to score points.

class Block {
  int HEIGHT = 70;
  int WIDTH = 16;
  
  //end game boolean
  boolean endGame;
  /////////////// Properties ///////////////


  // The position, velocity, size and color of the block (note that vx isn't really used right now)
  int x;
  int y;
  int vx;
  int vy;
  int blockColor;




  /////////////// Constructor ///////////////

  //  Block(int _x, int _y, int _size, int _color)
  //
  // Sets the position and controls based on arguments,
  // starts the velocity at 0

  Block(int _x, int _y, int _bColor) {
    x = _x;
    y = _y;
    blockColor =_bColor;
  }


  /////////////// Methods ///////////////

  // update()
  //
  // Updates position based on velocity and constraints the paddle to the window

  void update() {

    // Constrain the block's y position to be in the window
    //y = constrain(y, 0 + HEIGHT/2, height - HEIGHT/2);

  }

  void endGame (){ 
  if(HEIGHT > 400){
    endGame = true;
    noLoop();
  }
}


  // display()
  //
  // Display the paddle at its location

  void display() {
    // Set display properties
    noStroke();
    fill(blockColor);
    rectMode(CENTER);

    // Draw the paddle as a rectangle
    rect(x, y, WIDTH, HEIGHT);
  }
  
  void drawPos() {
  println(HEIGHT);
}
}