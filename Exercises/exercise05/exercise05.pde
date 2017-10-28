//you see specific visuals based on the size of the screen
//you have to find specific random pets using noise and t based on the size of the screen
//when you click on the pet, you get a point


//Global Variables for the ball and the screens
Ball ball;


int x;
int y;

void setup() {
  size(500,500);
  ball= new Ball( x = width/2, y = height/2);
 
}
void draw() {
  background(0);
 ball.update();
 ball.display();
  
  // Check for wrapping?
}