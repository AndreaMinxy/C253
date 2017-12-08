class Enemy {

  // An array of Letters to represent the string on screen
  Letter[] letters;

  // Starting position on the screen for displaying the string
  float x;
  float y;

  //color
  color enemyColor;

  // Font
  PFont font = createFont("PressStart2P.ttf",20);
  //PFont font = createFont("Courrier", 32);

  //size
  int fontSize;

  //the lives of the strings
  


  Enemy(float _x, float _y, String prodString, color _enemyColor, int _fontSize) {

    x= _x;
    y= _y;
    enemyColor= _enemyColor;
    fontSize = _fontSize;

    //Create an array to store individual Letter objects
    // for each character in our string
    letters = new Letter[prodString.length()];

    // Now go through each character in the string and 
    // store a new Letter object for it.
    // Set its x such that it will be nicely kerned
    // based on the width of the character in the current font.
    pushStyle();
    textSize(32);
    textFont(font);
    for (int i = 0; i < prodString.length(); i++) {
      letters[i] = new Letter(prodString.charAt(i));
      letters[i].setPosition(x, y);
      // Here we calculate the width of the current character
      // and update x so the next character will be drawn
      // after it!
      x += textWidth(prodString.charAt(i));
    }
    popStyle();
  }

  void update() {
    for (int i = 0; i < letters.length; i++) {
      pushStyle();
      textMode(CENTER);
      textSize(32);
      textFont(font);
      fill(enemyColor); //the fill doesn't work? The font doesn't work?
      letters[i].update();
      //letters[i].display();
      if (letters[i].x < 0 || letters[i].x > width) {
        for (int j = 0; j < letters.length; j++) {
          letters[j].vx = -letters[j].vx;
          letters[j].y += 20;
        }
      }
      popStyle();
    }
  }

  //if the sentences touch the shields, the aliens win and the game is over
  void alienInvasion() {
    if (y <= 450) {
      textAlign(CENTER);
      textSize(100);
      fill(255);
      text("ALIENS WIN!", width/2, 100);
      noLoop();
      gameIsOver = true;
    }
  }
}