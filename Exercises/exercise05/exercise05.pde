//INVISIBLE TAG
//There are certain light parts and dark parts of the screen
//You can only see the pet on the light parts
//when you click on the pet, you get a point


//Global Variables for the ball and the screens
Ball ball;
Screen screenOne;
Screen screenTwo;
Screen screenThree;


int x;
int y;

void setup() {
  size(500, 500);
  ball= new Ball( x = width/2, y = height/2, 20, 20);
  screenOne = new Screen (300, height/2, 300, 75, 5); //Middle Screen
  screenTwo = new Screen(150, 400, 200, 40, 3);    //Bottom
  screenThree= new Screen(400, 50, 100, 30, 8);    //top Screen
}
void draw() {
  background(0);
  ball.update();
  ball.checkBoundary();
  ball.display();

  screenOne.display();
  screenTwo.display();
  screenThree.display();

  screenOne.update();
  screenTwo.update();
  screenThree.update();
}