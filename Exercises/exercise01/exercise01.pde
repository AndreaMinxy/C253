//all of these integers and colors cannot be changed/altered later within the code
//in order to do that you'd have to remove the "final" element from the line of code

final color NO_CLICK_FILL_COLOR = color(250, 100, 100); //define a fixed colour  (pink 1)                      
final color CLICK_FILL_COLOR = color(100, 100, 250);    //define a fixed colour  (blue)
final color BACKGROUND_COLOR = color(250, 150, 150);    //define a fixed colour  (pink 2)
final color STROKE_COLOR = color(250, 150, 150);        //define a fixed colour  (pink 2)
final int CIRCLE_SIZE = 50;                             //define a circle size 
final int CIRCLE_SPEED = 7;                             //define a cirlce "speed" (once we apply logic, this will come into play)

int circleX;            //initializing an integer/variable called circleX
int circleY;            //initializing an integer/variable called circleY
int circleVX;           //initializing an integer/variable called circleVX
int circleVY;           //initializing an integer/variable called circleVY

void setup() {
  size(640, 480);                     //intializing the width and the height of the screen
  circleX = width/2;                  //the variable has the initial value of the screens width in half (ie 320 px)
  circleY = height/2;                 //the variable has the initial value of the screens height in half (ie 240 px)
  circleVX = CIRCLE_SPEED;            //set the intial value of this variable to CIRCLE_SPEED (ie 7)
  circleVY = CIRCLE_SPEED;            //set the inital value of this variable to CIRCLE_SPEED (ie 7)
  stroke(STROKE_COLOR);               //set the initial colour of the background's border (pink 2)
  fill(NO_CLICK_FILL_COLOR);           //set the inital colour of the circle (pink 1)
  background(BACKGROUND_COLOR);      //set the intial colour of the background (pink 2)
}

void draw() {
    if (dist(mouseX, mouseY, circleX, circleY) < CIRCLE_SIZE/2) {  //If the distance between your mouse cursor's x,y point and 
    fill(CLICK_FILL_COLOR);                                        //the circle's position (circleX, circleY) is less than half of the circle size, then 
  }                                                                // fill the circle with a blue colour (CLICK_FILL_COLOR).
  else {                                                           //If that condition isn't true (ie the distance is bigger than half the circle size),
    fill(NO_CLICK_FILL_COLOR);                                     // fill the circle with it's initial pink colour (NO_CLICK_FILL_COLOR).
  }
  ellipse(circleX, circleY, CIRCLE_SIZE, CIRCLE_SIZE);          //draw the ellipse with the set values (320, 240, 50, 50)
  circleX += circleVX;                                      //add the ammount of circleVx to the value of circleX (the x position) and replace the ammount of circleX with the new value ((width/2)+= (CIRCLE_SPEED)) or (320 += 7), this will gradually move the circle to a new position horizentally
  circleY += circleVY;                                     //add the ammount of circleVy to the value of circleY and replace the ammount of circleY with the new value ((height/2)+= (CIRCLE_SPEED)) or (240 += 7), same as above but vertically
  if (circleX + CIRCLE_SIZE/2 > width || circleX - CIRCLE_SIZE/2 < 0) { //If half of the former ammount (or the x position of the elipse visually) is bigger than the screens width OR smaller than 0,
    circleVX = -circleVX;                                               //then replace the value of circleVX with the negative version of that value (thus changing it's direction).
  }
  if (circleY + CIRCLE_SIZE/2 > height || circleY - CIRCLE_SIZE/2 < 0) { //If half of the latter ammount(or the y position of the elipse visually) is bigger than the screens height OR smaller than 0,
    circleVY = -circleVY;                                                //then replace the value of circleVY with the negative version of that value (thus changing its direction).
  }
  }


void mousePressed() {    //if you press the mouse,
  background(BACKGROUND_COLOR);  //the background will resume to its default fill (the code in Void draw doesn't reset which is why the circle "appears" at the last place it was drawn right beofr you click
}