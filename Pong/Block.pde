// Block
//
// A class that defines a block that the oponents must hit in order to score points.

class Block {
  int HEIGHT = 70;
  int WIDTH = 16;
  /////////////// Properties ///////////////


  // The position, velocity, size and color of the block (note that vx isn't really used right now)
  int x;
  int y;
  int vx;
  int vy;
  color blockColor = color(255, 70, 100);

  

 
  /////////////// Constructor ///////////////

  //  Block(int _x, int _y, int _size, int _color)
  //
  // Sets the position and controls based on arguments,
  // starts the velocity at 0

  Block(int _x, int _y) {
    x = _x;
    y = _y;
    

    
  }


  /////////////// Methods ///////////////

  // update()
  //
  // Updates position based on velocity and constraints the paddle to the window

  void update() {

    // Constrain the block's y position to be in the window
    y = constrain(y,0 + HEIGHT/2,height - HEIGHT/2);
    
    endGame();
  }
  
void endGame(){
  if(HEIGHT > height || HEIGHT < height) {
  fill(255, 0, 0);}
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

  
}