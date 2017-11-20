//Bi-Erasure Space Invaders

//Your wordlview and sexuality are at risk of becoming extinct! A group of aliens have come to try and
//steal your lifeforce and erase you from the face of the earth! Now only you, a brave and determined little
//bisexual, can stop them from destroying your way of life. Are you gonna let those binary conforming aliens
//tell who you can and can't like?

Hero hero;
ArrayList <Blast> allBlast = new ArrayList<Blast>();
Blast heroBlast;


void setup() {

  //size and colour of the background
  size(1000, 600);
  background(255);

  hero = new Hero(width/2, 550, 'a', 'l');
  heroBlast = new Blast(hero.x, hero.y, 'f');
}

void draw() {
  //redraw the background within each frame
  background(255);
  
  //text demo
  fill(255, 0, 0);
  textSize(45); // Font size
  textAlign(CENTER, CENTER); // Center align both horizontally and vertically
  textLeading(64); // Line height for text
  text("It's just a phase!.", width/2, height/2); // Note that \n means "new line"

  //update/display the action of the hero 
  hero.update();
  hero.display();


  //check the list of dots and update thei movement and display their form
  for (int i = 0; i < allBlast.size(); i++) { 
    allBlast.get(i).update();
    if (allBlast.get(i).keyClicked()) {

      allBlast.get(i).display();
    }
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