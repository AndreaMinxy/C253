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

  hero = new Hero(width/2, 550, 'a', 'l', 'f');

}

void draw() {
  //redraw the background within each frame
  background(255);
  
  //text demo
  fill(255, 0, 0);
  textSize(35); // Font size
  textAlign(CENTER, CENTER); // Center align both horizontally and vertically
  textLeading(40); // Line height for text
  text("IT'S JUST A PHASE!\nYOU'RE JUST EXPERIMENTING!", width/2, height/4); // Note that \n means "new line"
  

  //update/display the action of the hero 
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