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
Text text;


// The distance from the edge of the window a paddle should be

int PADDLE_INSET = 50;

// The colour of the balls during the game
color blueBallColor = color(13, 229, 255);  //patriarchy side
color pinkBallColor = color(255, 13, 231);  //feminism side

//the colour of the blocks during the game
color leftBlockColor = color(70, 70, 255);    //patriarchy side
color rightBlockColor = color(200, 70, 100);    //feminism side

//Initializing the background image
PImage bg;
int y;

//Seting up the boolean that tracks when the game starts and wehn it ends
boolean gameIsOver = false;


// setup()
//
// Sets the size and creates the paddles and ball

void setup() {
  // Set the size and background
  size(600, 400);
  bg = loadImage("https://littlegayblog.com/wp-content/uploads/2017/04/Gay-Rights-Feminsim.png");



  // Create the paddles on either side of the screen. 
  // Use PADDLE_INSET to to position them on x, position them both at centre on y
  // Also pass through the two keys used to control 'up' and 'down' respectively
  // NOTE: On a mac you can run into trouble if you use keys that create that popup of
  // different accented characters in text editors (so avoid those if you're changing this)
  //the commands for the each paddle are across the keyboard, so when you play with an opponent, it's extra hard (like trying to navigate these two ideologies)
  leftPaddle = new Paddle(PADDLE_INSET, height/2, 'q', 'l');                            
  rightPaddle = new Paddle(width - PADDLE_INSET, height/2, 'p', 'a');               
  rightBlock = new Block(width-8, height/2, rightBlockColor);
  leftBlock = new Block(8, height/2, leftBlockColor);
  text = new Text();



  // Create the ball at the centre of the screen
  pinkBall = new Ball(height/2, width/2, pinkBallColor);
  blueBall = new Ball(width/2, height/2, blueBallColor);
}

// draw()
//
// Handles all the magic of making the paddles and ball move, checking
// if the ball has hit a paddle, and displaying everything.

void draw() {

  //demonstrating the position of the balls (x position) and the blocks (y position)
  //blueBall.drawPos();
  //pinkBall.drawPos();
  rightBlock.drawPos();
  leftBlock.drawPos();

  // Fill the background each frame so we have animation
  //Fill the background with the predefined image
  background(bg);
  y++;
  if (y > height) {
    y = 0;
  }

  //Patriarchy section label
  textSize(26);
  fill(255);
  text("PATRIARCHY", 80, 30);

  //Feminism section label
  textSize(26);
  fill(255);
  text("FEMINISM", 380, 30);


  //demonstrating the values of the collisons
  //blueBall.drawVar();
  //blueBall.drawPos();

  // Update the paddles and ball by calling their update methods
  leftPaddle.update();
  rightPaddle.update();
  blueBall.update();
  pinkBall.update();
  leftBlock.update();
  rightBlock.update();


  //triggering the change of text with the collisons
  if (pinkBall.collide(leftBlock)) {
    text.changePlayer2();
  }

  if (blueBall.collide(rightBlock)) {
    text.changePlayer1();
  }



  // Check if the ball has collided with either paddle
  //calls the collide functions
  blueBall.collide(leftPaddle);
  blueBall.collide(rightPaddle);                              
  pinkBall.collide(leftPaddle);
  pinkBall.collide(rightPaddle);
  pinkBall.collide(leftBlock);             //can only collide with the left/blue block
  blueBall.collide(rightBlock);            //can only collide with the right/pink block


  //winner display (I tried to erase the scoreboard it didn't really work
  if (gameIsOver == true) { 
    text.endPlayer1();
    text.endPlayer2();
  }

  //triggering the endgame and displaying the winning team
  if (blueBall.HITright > 16) {
    textAlign(CENTER);
    textSize(26);
    fill(255);
    text("PATRIARCHY WINS!", width/2, 100);
    noLoop();
    gameIsOver = true;
  }

  if (pinkBall.HITleft > 16) {
    textAlign(CENTER);
    textSize(26);
    fill(255);
    text("FEMINISM WINS!", width/2, 100);
    noLoop();
    gameIsOver = true;
  }


  // Display the paddles, the blocks and the balls
  leftPaddle.display();
  rightPaddle.display();
  blueBall.display();
  pinkBall.display();
  rightBlock.display();
  leftBlock.display();
  text.display();
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