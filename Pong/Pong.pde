// Feminist Pong
//
// A different version of Pong using object-oriented programming.
// Allows to people to bounce a ball back and forth between
// two opposing forces that they control: Feminism and the Patriarchy. 
//Who will win? 
//


// Global variables for the paddles, the ball and the blocks
Paddle leftPaddle;
Paddle rightPaddle;
Block rightBlock;                                                    //added (both)
Block leftBlock;
Ball blueBall;
Ball pinkBall;
//Text text;

// The distance from the edge of the window a paddle should be

int PADDLE_INSET = 50;

// The background colour during play (black)
color blueBallColor = color(13, 229, 255);
color pinkBallColor = color(255, 13, 231);


//Initializing the backgrounf image
PImage bg;
int y;

//declares the scoreboard
String s = "FAT-O-METER";

// setup()
//
// Sets the size and creates the paddles and ball

void setup() {
  // Set the size
  size(600, 400);
  bg = loadImage("https://littlegayblog.com/wp-content/uploads/2017/04/Gay-Rights-Feminsim.png");



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
  pinkBall = new Ball(width/2, height/2, pinkBallColor);
  blueBall = new Ball(width/2, height/2, blueBallColor);
}

// draw()
//
// Handles all the magic of making the paddles and ball move, checking
// if the ball has hit a paddle, and displaying everything.

void draw() {
  // Fill the background each frame so we have animation
  //Fill the background with the predefined image
  background(bg);
  y++;
  if (y > height) {
    y = 0;
  }
  //scorebaord display
  //scorebaord title
  //text(s);

  //demonstrating the values of the collisons
  blueBall.drawVar();

  // Update the paddles and ball by calling their update methods
  leftPaddle.update();
  rightPaddle.update();
  blueBall.update();
  pinkBall.update();
  leftBlock.update();
  rightBlock.update();

  // Check if the ball has collided with either paddle
  blueBall.collide(leftPaddle);
  blueBall.collide(rightPaddle);
  blueBall.collide(rightBlock);                                  //calls the collide function
  blueBall.collide(leftBlock);
  leftBlock.endGame();
  rightBlock.endGame();                                     //put an if statement to see if it will work?

  if (pinkBall.HITright > 20) {
    noLoop();
    text("You Lose", width/2, 20);
    textSize(100);
  }
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
  blueBall.display();
  pinkBall.display();
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