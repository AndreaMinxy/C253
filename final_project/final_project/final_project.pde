//Bi-Erasure Space Invaders

//Your wordlview and sexuality are at risk of becoming extinct! A group of aliens have come to try and
//steal your lifeforce and erase you from the face of the earth! Now only you, a brave and determined little
//bisexual, can stop them from destroying your way of life. Are you gonna let those binary conforming aliens
//tell who you can and can't like?

Hero hero;

void setup() {

  //size and colour of the background
  size(1000, 600);
  background(255);

  hero = new Hero(width/2, 550, 'a', 'l');
}

void draw() {
  //redraw the background within each frame
  background(255);

  hero.update();
  hero.display();
}

void keyPressed() {
  // Call the hero's keyPressed methods
  hero.keyPressed();
}

void keyReleased() {
  // Call the hero's keyReleased methods
  hero.keyReleased();
}