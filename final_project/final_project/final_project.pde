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
Life life1;
Life life2;
Life life3;

//defining the array list for the bullets/blasts
ArrayList <Blast> allBlast = new ArrayList<Blast>();

//setting up the interactive text
  // Font
  //PFont myNiceFont= loadFont("comicsans.vlw");
PFont font;

//setting up the Score
int SCORE =0;
//boolean that dtermines when the game is over
boolean gameIsOver = false;

void setup() {

  //size and colour of the background
  size(1000, 600);
  background(255);

  //define the class objects
  hero = new Hero(width/2, 550, 'a', 'l', 'f');
  leftShield = new Shield(200, 450, color(#FFB2F1, 255));
  middleShield = new Shield(475, 450, color(#FFB2F1, 255));
  rightShield = new Shield(750, 450, color(#FFB2F1, 255));
  life1 = new Life(900, 20);
  life2 = new Life(925, 20);
  life3 = new Life(950, 20);

  // Set up font
  
  //fill(0, 0, 0);
  //textFont(myNiceFont);
  textMode(CENTER);
  textSize(32);

  //define the enemy class objects
  enemy1 = new Enemy(width/2, 50, "IT IS JUST A PHASE");
  enemy2 = new Enemy(width/2, 150, "YOU ARE JUST EXPERIMENTING");
  enemy3 = new Enemy(width/2, 250, "BISEXUALITY IS NOT REAL");
}



void draw() {
  //redraw the background within each frame
  background(255);

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
  life1.display();
  life2.display();
  life3.display();
  
  //triggering the endgame and displaying the winning team
  if (hero.playerGetsHit >= 3) {
    textAlign(CENTER);
    textSize(100);
    fill(255);
    text("ALIENS WIN!", width/2, 100);
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