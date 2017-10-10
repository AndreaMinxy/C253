//Exercise 03 Code
//This code is written to make a sort of generative on-screen art piece.
//There is a small level of interactivty when you hover your mouse over the artwork while it is being produced.


/*sets up the default background color and 
 defines the two types of bouncer objects within
 the bouncer class*/
color backgroundColor = color(200, 150, 150);
Bouncer bouncer;
Bouncer bouncer2;

/* sets up the size of the screen, the background color and the arguments for the two different bouncer objects.
 This is all set up before the "draw" actions so it only happens once when we reset everything*/
void setup() {
  size(640, 480);
  background(backgroundColor);
  //CHANGED: I changed the colors of the objects
  bouncer = new Bouncer(width/2, height/2, 2, 2, 50, color(150, 0, 200, 50), color(255, 0, 0, 50));
  bouncer2 = new Bouncer(width/2, height/2, -2, 2, 50, color(0, 100, 150, 50), color(0, 0, 255, 50));
}

//CHANGED: Added some functions
/*calls the object's actions/pre-defined functions from the class file (Bouncer file)*/
void draw() {
  bouncer.update();
  bouncer2.update();
  bouncer.draw();
  bouncer2.draw();
  bouncer.mouseClicked();   
  bouncer2.mouseClicked();
}