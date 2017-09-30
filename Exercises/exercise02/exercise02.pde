color backgroundColor = color(0); //defines the background colour

//defines the integers for the static ammount, the minimum size and the maximum size
int numStatic = 1000;
int staticSizeMin = 1;
int staticSizeMax = 3;
color staticColor = color(200);  //defines the static colour

/*defines the integers for the paddle (x position, y position, horizontal velocity,
speed, width, height and colour)*/
int paddleX;
int paddleY;
int paddleVX;
int paddleSpeed = 10;
int paddleWidth = 128;
int paddleHeight = 16;
color paddleColor = color(255);

/*defines the integers for the ball (x postion, y position, horizontal velocity,
vertical velocity, speed, size and colour)*/
int ballX;
int ballY;
int ballVX;
int ballVY;
int ballSpeed = 5;
int ballSize = 16;
color ballColor = color(255);

void setup() {
  size(640, 480);  //size of the screen
  
  setupPaddle();  //hoists the paddle and the ball function (pre-coded bellow the setup)
  setupBall();
}

//sets up the initial postion and velocity of the paddle
void setupPaddle() {
  paddleX = width/2;  
  paddleY = height - paddleHeight;
  paddleVX = 0;
}

//set ups the initial position and velocity for the ball
void setupBall() {
  ballX = width/2;
  ballY = height/2;
  ballVX = ballSpeed;
  ballVY = ballSpeed;
}

void draw() {
  background(backgroundColor);   //colour of the screen

/*hoists the different functions written bellow us (drwing the static, updating the paddle's and the ball's 
movement, and drawing the paddle and the ball*/
  drawStatic(); 

  updatePaddle();
  updateBall();

  drawPaddle();
  drawBall();
}


void drawStatic() {
  //if "i" is smaller than 1000, add 1 to "i" (1000 being the limit)
  for (int i = 0; i < numStatic; i++) { 
   float x = random(0,width);  //choose a random postion between 0 and 640
   float y = random(0,height); //choose a random position between 0 and 480
   /*choose a random size between the minimum size and maximum size, then fill 
   with the specified colour and draw the pixel/rectangle with the random positiona 
   and size*/
   float staticSize = random(staticSizeMin,staticSizeMax); 
   fill(staticColor);
   rect(x,y,staticSize,staticSize);
  }
}
/* add the ammount of the velocity to the x position and replace the position's 
value with that new value, then constrain the x postion of the paddle 
between 64 and 576*/
void updatePaddle() {
  paddleX += paddleVX;  
  paddleX = constrain(paddleX,0+paddleWidth/2,width-paddleWidth/2);
}

/* add the value of the balls velocity to the balls position and replace
its position with that new value, this causes it to move*/
void updateBall() {
  ballX += ballVX;
  ballY += ballVY;
  
  handleBallHitPaddle();         //hoist these functions
  handleBallHitWall();
  handleBallOffBottom();
}

/* change the x,y value of the paddle to the center of the screen, fill it
with the specified colour and draw the paddle with the specific values (no line around it)*/
void drawPaddle() {
  rectMode(CENTER);
  noStroke();
  fill(paddleColor);
  rect(paddleX, paddleY, paddleWidth, paddleHeight);
}

/* change the x,y value of the ball to the center of the screen, fill it
with the specified colour and draw the ball with the specific values (no line around it)*/
void drawBall() {
  rectMode(CENTER);
  noStroke();
  fill(ballColor);
  rect(ballX, ballY, ballSize, ballSize);
}

/* if the ball and the paddle overlap (see boolean statement below), change the position of the ball's
y postion and change the velocity to it's negative value*/
void handleBallHitPaddle() {
  if (ballOverlapsPaddle()) {
    ballY = paddleY - paddleHeight/2 - ballSize/2;
    ballVY = -ballVY;
  }
}
/*true or false statement: if the overlap is true, send a "true" signal to the code above,
the previous code takes affect, if it's false  send a "false" signal to the code above
and the code doesn't take affect*/
boolean ballOverlapsPaddle() {
  if (ballX - ballSize/2 > paddleX - paddleWidth/2 && ballX + ballSize/2 < paddleX + paddleWidth/2) {
    if (ballY > paddleY - paddleHeight/2) {
      return true;
    }
  }
  return false;
}

/* if the ball touches the "floor" (bottom of the screen), set its positon
to the middle of the screens height and width (320, 240)*/
void handleBallOffBottom() {
  if (ballOffBottom()) {
    ballX = width/2;
    ballY = height/2;
  }
}
/*true or false statement: if the ball touches the "floor", send a "true" signal to the code above,
the previous code takes affect, if it's false  send a "false" signal to the code above
and the code doesn't take affect*/
boolean ballOffBottom() {
  return (ballY - ballSize/2 > height);
}

/*if the x position of the ball hits the "wall" (the edge of the screen), then change 
the x position and switch the velocity's direction*/
void handleBallHitWall() {
  if (ballX - ballSize/2 < 0) {
    ballX = 0 + ballSize/2;
    ballVX = -ballVX;
  } else if (ballX + ballSize/2 > width) {
    ballX = width - ballSize/2;
    ballVX = -ballVX;
  }
  /*if the y position of the ball hits the "wall" (the edge of the screen), then change 
the y position and switch the velocity's direction*/
  if (ballY - ballSize/2 < 0) {
    ballY = 0 + ballSize/2;
    ballVY = -ballVY;
  }
}

/*if you press the left key on your keyboard, the paddle will go left. 
If you press the right key on your keyboard, your paddle will go right.*/
void keyPressed() {
  if (keyCode == LEFT) {
    paddleVX = -paddleSpeed;
  } else if (keyCode == RIGHT) {
    paddleVX = paddleSpeed;
  }
}
 /* if you release the left key, the paddle with stop (the velocity is set to zero)
   if you release the right key, the paddle with stop (the velocity is set to zero) */
void keyReleased() {
  if (keyCode == LEFT && paddleVX < 0) {
    paddleVX = 0;
  } else if (keyCode == RIGHT && paddleVX > 0) {
    paddleVX = 0;
  }
}