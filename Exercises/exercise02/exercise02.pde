color backgroundColor = color(0); 


int numStatic = 1000;
int staticSizeMin = 1;
int staticSizeMax = 3;
color staticColor = color(200);  

int colorChange = 255;


int paddleX;
int paddleY;
int paddleVX;
int paddleSpeed = 10;
int paddleWidth = 128;
int paddleHeight = 16;
color paddleColor = color(255);


int ballX;
int ballY;
int ballVX;
int ballVY;
int ballSpeed = 5;
int ballSize = 16;
color ballColor = color(255);

//CHANGES
int collisions = 0;          //added an integer that keeps track of the collisions

void setup() {
  size(640, 480);  
  setupPaddle();  
  setupBall();
}


void setupPaddle() {
  paddleX = width/2;  
  paddleY = height - paddleHeight;
  paddleVX = 0;
}


void setupBall() {
  ballX = width/2;
  ballY = height/2;
  ballVX = ballSpeed;
  ballVY = ballSpeed;
}

void draw() {

  println(collisions);


  background(backgroundColor);   
  drawStatic(); 

  updatePaddle();
  updateBall();

  drawPaddle();
  drawBall();
  updateBackgroundFlash();                       //CHANGE: I added a function to hoist
}


void drawStatic() {

  for (int i = 0; i < numStatic; i++) { 
    float x = random(0, width);  
    float y = random(0, height); 
    float staticSize = random(staticSizeMin, staticSizeMax); 
    fill(staticColor);
    rect(x, y, staticSize, staticSize);
  }
}




void updatePaddle() {                                                
  paddleX += paddleVX;  
  paddleX = constrain(paddleX, 0+paddleWidth/2, width-paddleWidth/2);
}


void updateBall() {
  ballX += ballVX;
  ballY += ballVY;

  handleBallHitPaddle();       
  handleBallHitWall();
  handleBallOffBottom();
}


void drawPaddle() {
  for (int i =0; i < 255; i++) {
    rectMode(CENTER);
    noStroke();
    fill(paddleColor);
    rect(paddleX, paddleY, paddleWidth, paddleHeight);
  }
}


void drawBall() {
  rectMode(CENTER);
  noStroke();
  fill(ballColor);
  rect(ballX, ballY, ballSize, ballSize);
}


//CHANGED: when you reach a certain ammount of hits, the background changes, and once you hit the floor the new background goes away and the old one resumes

void updateBackgroundFlash() {


  if (collisionCount()) {
    background(random(100, 255), 100, 200);
  } else { 
    frameRate(40);
    background(backgroundColor);   
    drawStatic();
  }

  updatePaddle();
  updateBall();

  drawPaddle();
  drawBall();
}

//CHANGED: I added a boolean to correspond with my new function

boolean collisionCount() {

  return(collisions == 3);
}




void handleBallHitPaddle() {
  if (ballOverlapsPaddle()) {
    ballY = paddleY - paddleHeight/2 - ballSize/2;
    ballVY = -ballVY;
    collisions ++;
  }
}

boolean ballOverlapsPaddle() {
  if (ballX - ballSize/2 > paddleX - paddleWidth/2 && ballX + ballSize/2 < paddleX + paddleWidth/2) {
    if (ballY > paddleY - paddleHeight/2) {
      return true;
    }
  }
  return false;
}


void handleBallOffBottom() {
  if (ballOffBottom()) {
    ballX = width/2;
    ballY = height/2;
    collisions =0;                 //CHANGE: resets the number of collisions to zero
  }
}

boolean ballOffBottom() {
  return (ballY - ballSize/2 > height);
}


void handleBallHitWall() {
  if (ballX - ballSize/2 < 0) {
    ballX = 0 + ballSize/2;
    ballVX = -ballVX;
  } else if (ballX + ballSize/2 > width) {
    ballX = width - ballSize/2;
    ballVX = -ballVX;
  }

  if (ballY - ballSize/2 < 0) {
    ballY = 0 + ballSize/2;
    ballVY = -ballVY;
    fill(ballColor);
  }
}


void keyPressed() {
  if (keyCode == LEFT) {
    paddleVX = -paddleSpeed;
  } else if (keyCode == RIGHT) {
    paddleVX = paddleSpeed;
  }
}


void keyReleased() {
  if (keyCode == LEFT && paddleVX < 0) {
    paddleVX = 0;
  } else if (keyCode == RIGHT && paddleVX > 0) {
    paddleVX = 0;
  }
}