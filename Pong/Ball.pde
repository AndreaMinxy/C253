// Ball
//
// A class that defines a ball that can move around in the window, bouncing
// of the top and bottom, and can detect collision with a paddle and bounce off that.

class Ball {

  /////////////// Properties ///////////////

  //the number of hits on the blocks
  int HITright =0;
  int HITleft =0;

  // Default values for speed and size
  int SPEED = 5;
  int SIZE = 16;

  // The location of the ball
  int x;
  int y;

  // The velocity of the ball
  int vx;
  int vy;

  // The colour of the ball
  int ballColor;

  //determines iff the ball is off the screen
  boolean isOffScreen = (x + SIZE/2 < 0 || x - SIZE/2 > width);
  /////////////// Constructor ///////////////

  // Ball(int _x, int _y)
  //
  // The constructor sets the variable to their starting values
  // x and y are set to the arguments passed through (from the main program)
  // and the velocity starts at SPEED for both x and y 
  // (so the ball starts by moving down and to the right)
  // NOTE that I'm using an underscore in front of the arguments to distinguish
  // them from the class's properties

  Ball(int _x, int _y, int _color) {
    x = _x;
    y = _y;
    vx = SPEED;
    vy = SPEED;
    ballColor = _color;
  }


  /////////////// Methods ///////////////

  // update()
  //
  // This is called by the main program once per frame. It makes the ball move
  // and also checks whether it should bounce of the top or bottom of the screen
  // and whether the ball has gone off the screen on either side.

  void update() {

    // First update the location based on the velocity (so the ball moves)
    x += vx;
    y += vy;

    // Check if the ball is going off the top or the bottom of the screen
    if (y - SIZE/2 < 0 || y + SIZE/2 > height) {
      // If it is, then make it "bounce" by reversing its velocity
      vy = -vy;
    }
    // Check if the ball is going off the left or the right of the screen
    if (x - SIZE/2 < 0 || x + SIZE/2 > width) {
      // If it is, then make it "bounce" by reversing its velocity
      vx = -vx;
    }
  }





  // collide(Paddle paddle)
  //
  // Checks whether this ball is colliding with the paddle passed as an argument
  // If it is, it makes the ball bounce away from the paddle by reversing its
  // x velocity

  void collide(Paddle paddle) {
    // Calculate possible overlaps with the paddle side by side
    boolean insideLeft = (x + SIZE/2 > paddle.x - paddle.WIDTH/2);
    boolean insideRight = (x - SIZE/2 < paddle.x + paddle.WIDTH/2);
    boolean insideTop = (y + SIZE/2 > paddle.y - paddle.HEIGHT/2);            
    boolean insideBottom = (y - SIZE/2 < paddle.y + paddle.HEIGHT/2);

    // Check if the ball overlaps with the paddle
    if (insideLeft && insideRight && insideTop && insideBottom) {
      // If it was moving to the left
      if (vx < 0) {
        // Reset its position to align with the right side of the paddle
        x = paddle.x + paddle.WIDTH/2 + SIZE/2;
      } else if (vx > 0) {
        // Reset its position to align with the left side of the paddle
        x = paddle.x - paddle.WIDTH/2 - SIZE/2;
      }
      // And make it bounce
      vx = -vx;
    }
  }

  //Coliding with the blocks nd moves the ball based on the type of collion
  boolean collide(Block block) {
    // Calculate possible overlaps with the block side by side
    boolean insideLeft = (x + SIZE/2 > block.x - block.WIDTH/3);
    boolean insideRight = (x - SIZE/2 < block.x + block.WIDTH/3);
    boolean insideTop = (y + SIZE/2 > block.y - block.HEIGHT/3);              
    boolean insideBottom = (y - SIZE/2 < block.y + block.HEIGHT/3);


    // Check if the ball overlaps with the blocks
    if (insideLeft && insideRight && insideTop && insideBottom) {
      // If it was moving to the left
      if (block.x < width/2) {


        // Reset its position to align with the right side of the block
        x = block.x + block.WIDTH/2 + SIZE/2;
        //enlarge the size of the block and increase the number of hits being written down by 1
        block.HEIGHT +=20;
        block.WIDTH +=2;
        HITleft++;
      } else if (block.x > width/2) {
        // Reset its position to align with the left side of the block
        x = block.x - block.WIDTH/2 - SIZE/2;
        block.HEIGHT +=20;
        block.WIDTH +=2;
        HITright ++;
      }
      // And make it bounce
      vx = -vx;
      return true;
    }
    return false;
  }



  // display()
  //
  // Draw the ball at its position

  void display() { 
    // Set up the appearance of the ball (no stroke, a fill, and rectMode as CENTER)
    noStroke();
    fill(ballColor);
    rectMode(CENTER);

    // Draw the ball
    rect(x, y, SIZE, SIZE);
  }

  //keeps track of the collisions
  void drawVar() {
    //println(HITright);
    println(HITleft);
  }

  //keeps track of the balls x position
  void drawPos() {
    println(x);
  }
}