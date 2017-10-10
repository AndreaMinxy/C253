//Bouncer code
//this is a file dedicated to defining an object within a project. 
//an object is what you would normally see interacting or moving on the screen (think any video game character or prop)
//it's easier to make a seperate file so that we can define the properties in a more organized fashion instead of crushing it
//all together in one file

/*defines the name of the object's class (Bouncer) and the variables we need to use to define our parameters*/
class Bouncer {
  
 int x;
 int y;
 int vx;
 int vy;
 int size;
 color fillColor;
 color defaultColor;
 color hoverColor;
 
 /*sets up the arguments we need to associate with the different objects in our code, and associates them with the previous variables so
 that they actually mean something*/
 Bouncer(int tempX, int tempY, int tempVX, int tempVY, int tempSize, color tempDefaultColor, color tempHoverColor) {
   x = tempX;
   y = tempY;
   vx = tempVX;
   vy = tempVY;
   size = tempSize;
   defaultColor = tempDefaultColor;
   hoverColor = tempHoverColor;
   fillColor = defaultColor;
 }
 
 /* sets up the actions of the object (explains how it moves and hoists the different functions from bellow)*/
 void update() {
   x += vx;
   y += vy;
   
   handleBounce();
   handleMouse();
 }
 
 //CHANGED: when the bouncer hits the wall, it goes to the opposite end of the screen (top and bottom) at its inverse x,y position
 /*sets up the conditions for how the ball will react when it hits or passes the "walls'" positions (left, right, bottom and top of the screen)*/
 void handleBounce() {
   if (x - size/2 < 0 || x + size/2 > width) {
    vx = -vx; 
   }
   
   if (y - size/2 < 0 || y + size/2 > height) {
     vy = -vy;
     y= -y;
   }
   
   /*limits the x and y position within the screen by defining the value that needs to be contrained, the minimum limit and the maximum limit
   (so that a clean bounce is achieved instead of looking like half the object got cut off by the walls)*/
   x = constrain(x,size/2,width-size/2);
   y = constrain(y,size/2,height-size/2);
 }
 
 /* "if else" statement: if the distance between these four points (mouse X and object X, mouse Y and object Y) is smaller than half the objects size,
 the object's color will change. When this is false, it will change back to it's default color*/
 void handleMouse() {
   if (dist(mouseX,mouseY,x,y) < size/2) {
    fillColor = hoverColor; 
   }
   else {
     fillColor = defaultColor;
   }
 }
 
 /*sets up the paramters and visual traits of the object (line color, fill color, shape).*/
 void draw() {
   noStroke();
   fill(fillColor);
   ellipse(x,y,size,size);
 }
}