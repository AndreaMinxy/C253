//INVISIBLE TAG
//There are certain light parts and dark parts of the screen
//You can only see the ball on the light parts
//when you click on the ball, you get a point


//Global Variables for the ball and the screens
Ball playBall;
Screen screenOne;
Screen screenTwo;
Screen screenThree;


//define the scorebaord
int scoreVis;


void setup() {
  size(500, 500);
  playBall= new Ball(width/2, height/2, 50, 50);
  screenOne = new Screen (300, height/2, 300, 75, 5); //Middle Screen
  screenTwo = new Screen(150, 450, 200, 40, 3);    //Bottom
  screenThree= new Screen(400, 50, 100, 30, 8);    //top Screen
}
void draw() {
  background(0);
  
  screenOne.update();
  screenTwo.update();
  screenThree.update();

  screenOne.display();
  screenTwo.display();
  screenThree.display(); 
  
  playBall.update();
  playBall.checkBoundary();
  playBall.display();


 

  scoreDisplay();
}


//display the score on the screen
void scoreDisplay() {
  fill(255);
  text(scoreVis, 250, 50);
  textSize(50);
  textAlign(CENTER, CENTER);
  
}


 void mousePressed(){
   playBall.mousePressed();
 }
 