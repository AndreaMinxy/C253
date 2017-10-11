// Feminist Pong
//
// A simple version of Pong using object-oriented programming.
// Allows to people to bounce a ball back and forth between
// two paddles that they control.
//
// No scoring. (Yet!)
// No score display. (Yet!)
// Pretty ugly. (Now!)
// Only two paddles. (So far!)

// Global variables for the paddles and the ball
Paddle leftPaddle;
Paddle rightPaddle;
Block rightBlock;                                                    //added (both)
Block leftBlock;
Ball ball;
//Text text;

// The distance from the edge of the window a paddle should be

int PADDLE_INSET = 50;

// The background colour during play (black)
color backgroundColor = color(0);

//declares the scoreboard
String s = "FAT-O-METER";

// setup()
//
// Sets the size and creates the paddles and ball

void setup() {
  // Set the size
  size(640, 480);
   //scorebaord

  
  // Create the paddles on either side of the screen. 
  // Use PADDLE_INSET to to position them on x, position them both at centre on y
  // Also pass through the two keys used to control 'up' and 'down' respectively
  // NOTE: On a mac you can run into trouble if you use keys that create that popup of
  // different accented characters in text editors (so avoid those if you're changing this)
  leftPaddle = new Paddle(PADDLE_INSET, height/2, '1', 'q');
  rightPaddle = new Paddle(width - PADDLE_INSET, height/2, '0', 'p');
  rightBlock = new Block(8, height/2);
  leftBlock = new Block(width-8, height/2);
  //text = new Text();

  // Create the ball at the centre of the screen
  ball = new Ball(width/2, height/2);
}

// draw()
//
// Handles all the magic of making the paddles and ball move, checking
// if the ball has hit a paddle, and displaying everything.

void draw() {
  // Fill the background each frame so we have animation

  background(backgroundColor);
  
  //scorebaord display
  //scorebaord title
  //text.display();
  
  

  //demonstrating the values of the collisons
 //ball.drawVar();

  // Update the paddles and ball by calling their update methods
  leftPaddle.update();
  rightPaddle.update();
  ball.update();
  leftBlock.update();
  rightBlock.update();

  // Check if the ball has collided with either paddle
  ball.collide(leftPaddle);
  ball.collide(rightPaddle);
  ball.collide(rightBlock);                                  //calls the collide function
  ball.collide(leftBlock);
  leftBlock.endGame();
  rightBlock.endGame();                                     //put an if statement to see if it will work?

/*if (ball.collide(rightBlock)){
  text.changePlayer2();
}*/

/*if (ball.collide(leftBlock)){
  text.changePlayer1();
}
  /* Check if the ball has gone off the screen
  if (ball.isOffScreen()) {
    // If it has, reset the ball
    ball.reset();
  }*/

  // Display the paddles and the ball
  leftPaddle.display();
  rightPaddle.display();
  ball.display();
  rightBlock.display();
  leftBlock.display();
}

// keyPressed()
//
// The paddles need to know if they should move based on a keypress
// so when the keypress is detected in the main program we need to
// tell the paddles

void keyPressed() {
  // Just call both paddles' own keyPressed methods
  leftPaddle.keyPressed();
  rightPaddle.keyPressed();
}

// keyReleased()
//
// As for keyPressed, except for released!

void keyReleased() {
  // Call both paddles' keyReleased methods
  leftPaddle.keyReleased();
  rightPaddle.keyReleased();
}