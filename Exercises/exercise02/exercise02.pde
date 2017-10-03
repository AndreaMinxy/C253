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
 //frameRate(50);
  //background(backgroundColor);   
  changeColor();
  drawStatic(); 

  updatePaddle();
  updateBall();

  drawPaddle();
  drawBall();
}


void drawStatic() {
  
  for (int i = 0; i < numStatic; i++) { 
   float x = random(0,width);  //choose a random postion between 0 and 640
   float y = random(0,height); //choose a random position between 0 and 480
   float staticSize = random(staticSizeMin,staticSizeMax); 
   fill(staticColor);
   rect(x,y,staticSize,staticSize);
  }
}

//CHANGE   
void changeColor(){                                        //I gave the background a flashing background using random colours

for (int i =0; i < 255; i++){
  background((random(0,255)),(random(0,100)), (random(0, 200))) ;
 
}
}


void updatePaddle() {
  paddleX += paddleVX;  
  paddleX = constrain(paddleX,0+paddleWidth/2,width-paddleWidth/2);
}


void updateBall() {
  ballX += ballVX;
  ballY += ballVY;
  
  handleBallHitPaddle();       
  handleBallHitWall();
  handleBallOffBottom();
}


void drawPaddle() {
  for (int i =0; i < 255; i++){
  rectMode(CENTER);
  noStroke();
  fill(paddleColor);
  rect(paddleX, paddleY, paddleWidth, paddleHeight);}
  
 
}


void drawBall() {
  rectMode(CENTER);
  noStroke();
  fill(ballColor);
  rect(ballX, ballY, ballSize, ballSize);
}


void handleBallHitPaddle() {
  if (ballOverlapsPaddle()) {
    ballY = paddleY - paddleHeight/2 - ballSize/2;
    ballVY = -ballVY;
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