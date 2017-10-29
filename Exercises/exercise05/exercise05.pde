//INVISIBLE TAG
//There are certain light parts and dark parts of the screen
//You can only see the pet on the light parts
//when you click on the pet, you get a point


//Global Variables for the ball and the screens
Ball ball;


int x;
int y;

void setup() {
  size(500,500);
  ball= new Ball( x = width/2, y = height/2, 20, 20);
 
}
void draw() {
  background(0);
 ball.update();
 ball.checkBoundary();
 ball.display();
  
  // Check for wrapping?
}