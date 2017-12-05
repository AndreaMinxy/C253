//Bi-Erasure Space Invaders

//Your wordlview and sexuality are at risk of becoming extinct! A group of aliens have come to try and
//steal your lifeforce and erase you from the face of the earth! Now only you, a brave and determined little
//bisexual, can stop them from destroying your way of life. Are you gonna let those binary conforming aliens
//tell who you can and can't like?

Hero hero;
Shield leftShield;
Shield middleShield;
Shield rightShield;

//defining the array list for the bullets/blasts
ArrayList <Blast> allBlast = new ArrayList<Blast>();

//setting up the interactive text
// Font
PFont font;
// The string to work with
String prodString1 = "ITS JUST A PHASE";


// An array of Letters to represent the string on screen
Letter[] letters;

void setup() {

  //size and colour of the background
  size(1000, 600);
  background(255);

  //define the class objects
  hero = new Hero(width/2, 550, 'a', 'l', 'f');
  leftShield = new Shield(200, 500, color(#FFB2F1));
  middleShield = new Shield(475, 500, color(#FFB2F1));
  rightShield = new Shield(750, 500, color(#FFB2F1));

  // Set up font
  font = createFont("Helvetica", 32, true);
  textMode(CENTER);
  textFont(font);


  // Create an array to store individual Letter objects
  // for each character in our string
  letters = new Letter[prodString1.length()];



  // Starting position on the screen for displaying the string
  int x = width/2;
  int y = 200;

  // Now go through each character in the string and 
  // store a new Letter object for it.
  // Set its x such that it will be nicely kerned
  // based on the width of the character in the current font.
  for (int i = 0; i < prodString1.length(); i++) {
    letters[i] = new Letter(prodString1.charAt(i));
    letters[i].setPosition(x, y);
    // Here we calculate the width of the current character
    // and update x so the next character will be drawn
    // after it!
    x += textWidth(prodString1.charAt(i));
  }
}



void draw() {
  //redraw the background within each frame
  background(255);

  // Go through all the Letters and use update()
  // to change their positions based on the mouse
  // and display() to draw them on the screen
  /*for (int i = 0; i < letters.length; i++) {
   letters[i].update();
   letters[i].display();
   
   }*/

  for (int i = 0; i < letters.length; i++) {
    letters[i].update();
    //letters[i].display();
    if (letters[i].x < 0 || letters[i].x > width) {
      for (int j = 0; j < letters.length; j++) {
        letters[j].vx = -letters[j].vx;
        letters[j].y += 20;
      }
    }
  }

  //update/display the action of the hero 
  hero.update();
  hero.display();

  //update/display the shields
  leftShield.update();
  leftShield.display();
  middleShield.update();
  middleShield.display();
  rightShield.update();
  rightShield.display();

  //update/display the string of letters
}

void keyPressed() {
  // Call the hero's keyPressed methods
  hero.keyPressed();
}

void keyReleased() {
  // Call the hero's keyReleased methods
  hero.keyReleased();
}