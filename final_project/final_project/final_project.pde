//Bi-Erasure Space Invaders

//Your wordlview and sexuality are at risk of becoming extinct! A group of aliens have come to try and
//steal your lifeforce and erase you from the face of the earth! Now only you, a brave and determined little
//bisexual, can stop them from destroying your way of life. Are you gonna let those binary conforming aliens
//tell who you can and can't like?

Hero hero;
Shield leftShield;
Shield middleShield;
Shield rightShield;
Enemy enemy1;
Enemy enemy2;
Enemy enemy3;
Lives lives;

//defining the array list for the bullets/blasts
ArrayList <Blast> allBlast = new ArrayList<Blast>();

//setting up the interactive text


//setting up the Score
int SCORE =0;

//boolean that dtermines when the game is over
boolean gameIsOver = false;

void setup() {

  //size of the background
  size(1000, 600);


  //define the class objects
  hero = new Hero(width/2, 550, 'a', 'l', 'f');
  leftShield = new Shield(200, 450, color(#FFB2F1, 255));
  middleShield = new Shield(475, 450, color(#FFB2F1, 255));
  rightShield = new Shield(750, 450, color(#FFB2F1, 255));
  lives = new Lives(950, 20);

// Set up font
  //textFont(myNiceFont);

  //define the enemy class objects
  enemy1 = new Enemy(width/2, 50, "IT IS JUST A PHASE", color(#5872FF),32);
  enemy2 = new Enemy(width/2, 150, "YOU ARE JUST EXPERIMENTING", color(#5872FF),32);
  enemy3 = new Enemy(width/2, 250, "BISEXUALITY IS NOT REAL", color(#5872FF),32);
}



void draw() {
  //redraw the background within each frame (black background)
 background(0, 0, 0);;
 

  //draw score
  text(SCORE, 20, 30);

  //update enemy
  enemy1.update();
  enemy2.update();
  enemy3.update();

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

  //update Life
  lives.display();
  

  //triggering the endgame and displaying the winning team
  if (hero.lives == 0) {
    textAlign(CENTER);
    textSize(100);
    fill(255);
    text("BI-ERASURE WINS!", width/2, 100);
    noLoop();
    gameIsOver = true;
  }
}

void keyPressed() {
  // Call the hero's keyPressed methods
  hero.keyPressed();
}

void keyReleased() {
  // Call the hero's keyReleased methods
  hero.keyReleased();
}