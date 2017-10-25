// Griddies
// by Pippin Barr
// MODIFIED BY: 
//
// A simple artificial life system on a grid. The "griddies" are squares that move
// around randomly, using energy to do so. They gain energy by overlapping with
// other griddies. If a griddie loses all its energy it dies.

// The size of a single grid element
int gridSize = 20;

//NEW: Rollie size
int rollSize = 25;
// An array storing all the griddies
Griddie[] griddies = new Griddie[100];
//NEW: An array storing all the rollies
Rollie[] rollies = new Rollie[10];

// setup()
//
// Set up the window and the griddies

void setup() {
  // Set up the window size and framerate (lower so we can watch easier)
  size(640, 480);
  frameRate(10);

  // QUESTION: What does this for loop do?
  /*it checks the size of the array (griddies.length), which is 100 and
   check if i is smaller than it. If it is, then proceed with the code that follows 
   (choose a random x and y position, and create a new griddie that alos uses the for loop to check the same circumstances))*/
  for (int i = 0; i < griddies.length; i++) {
    int x = floor(random(0, width/gridSize));
    int y = floor(random(0, height/gridSize));
    griddies[i] = new Griddie(x * gridSize, y * gridSize, gridSize);
  }

  //NEW:Rollie for loop
  for (int a = 0; a < rollies.length; a++) {
    int x = floor(random(0, width/gridSize));
    int y = floor(random(0, height/gridSize));
    rollies[a] = new Rollie(x * rollSize, y * rollSize, rollSize);
  }
}

// draw()
//
// Update all the griddies, check for collisions between them, display them.

void draw() {
  background(50);


  // We need to loop through all the griddies one by one
  for (int i = 0; i < griddies.length; i++) {

    // Update the griddies
    griddies[i].update();

    // Now go through all the griddies a second time...
    for (int j = 0; j < griddies.length; j++) {
      // QUESTION: What is this if-statement for?
      //if j is not equal to i
      if (j != i) {
        // QUESTION: What does this line check?
        //check if the i griddies and the j griddies collide
        griddies[i].collide(griddies[j]);
      }
    }

    // Display the griddies
    griddies[i].display();
    
  }
  
  //NEW: Check the array of rollies
   for (int i = 0; i < rollies.length; i++) {

    // Update the rollies
    rollies[i].update();

    // Now go through all the rollies a second time...
    for (int j = 0; j < griddies.length; j++) {
      // QUESTION: What is this if-statement for?
      //if j is not equal to i
      if (j != i) {
        // QUESTION: What does this line check?
        //check if the i griddies and the j griddies collide
        rollies[i].collide(griddies[j]);
      }
    }

    // Display the rollies
    rollies[i].display();
    
  }


 
}