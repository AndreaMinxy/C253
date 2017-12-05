class Enemy {

  // An array of Letters to represent the string on screen
  Letter[] letters;

  // Starting position on the screen for displaying the string
  float x;
  float y;

  Enemy(float _x, float _y, String prodString) {

    x= _x;
    y= _y;

    //Create an array to store individual Letter objects
    // for each character in our string
    letters = new Letter[prodString.length()];

    // Now go through each character in the string and 
    // store a new Letter object for it.
    // Set its x such that it will be nicely kerned
    // based on the width of the character in the current font.
    for (int i = 0; i < prodString.length(); i++) {
      letters[i] = new Letter(prodString.charAt(i));
      letters[i].setPosition(x, y);
      // Here we calculate the width of the current character
      // and update x so the next character will be drawn
      // after it!
      x += textWidth(prodString.charAt(i));
    }
  }

  void update() {
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
  }
}