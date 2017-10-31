//INVISIBLE TAG
//There are certain light parts and dark parts of the screen
//You can only see the pet on the light parts
//when you click on the pet, you get a point


//Global Variables for the ball and the screens
Ball playBall;
Screen screenOne;
Screen screenTwo;
Screen screenThree;


//define the scorebaord
int scoreVis;


int x;
int y;

void setup() {
  size(500, 500);
  playBall= new Ball( x = width/2, y = height/2, 50, 50);
  screenOne = new Screen (300, height/2, 300, 75, 5); //Middle Screen
  screenTwo = new Screen(150, 450, 200, 40, 3);    //Bottom
  screenThree= new Screen(400, 50, 100, 30, 8);    //top Screen
}
void draw() {
  background(0);
  playBall.update();
  playBall.checkBoundary();
  playBall.display();
 



  screenOne.display();
  screenTwo.display();
  screenThree.display();

  screenOne.update();
  screenTwo.update();
  screenThree.update();

  scoreDisplay();
}


//display the score on the screen
void scoreDisplay() {
  text(scoreVis, 250, 50);
  textSize(50);
  textAlign(CENTER, CENTER);
  fill(255);
}


 void mousePressed(){
   playBall.mousePressed();
 }
 