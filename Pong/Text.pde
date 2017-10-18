class Text {

  int hitMinimum = 0;

  //player 1 (on the left) 
  String[] playerLeftBlock = new String[21]; 
  //player's 2 awckawrd love text when they score a ponit.
  String[] playerRightBlock = new String[21];        

  int textNumberForP1;
  int textNumberForP2;

  Text() {
    playerLeftBlock[0] = "...";
    playerLeftBlock[1] = "Priviledge doesn't exist";
    playerLeftBlock[2] = "White people have problems too";
    playerLeftBlock[3] = "Man up!";
    playerLeftBlock[4] = "Racism doesn't exist";
    playerLeftBlock[5] = "Rape culture isn't real";
    playerLeftBlock[6] = "Feminists can't wear lipstick";
    playerLeftBlock[7] = "Be yourself, but not like that";
    playerLeftBlock[8] = "Women are complicated";
    playerLeftBlock[9] = "Men don't cry";
    playerLeftBlock[10] = "Homophobia doesn't exist";
    playerLeftBlock[11] = "You should smile more";
    playerLeftBlock[12] = "Freaking Feminazis";
    playerLeftBlock[13] = "It's just locker-room talk";
    playerLeftBlock[14] = "What a cute project";
    playerLeftBlock[15] = "Buying stuff makes the pain go away";
    playerLeftBlock[16] = "Dressed for attention are you?";
    playerLeftBlock[17] = "Aging is bad";
    playerLeftBlock[18] = "Who's the man in the relationship?";
    playerLeftBlock[19] = "Bras are necessary";
    playerLeftBlock[20] = "Sensitivity is a weakness";


    playerRightBlock[0] = "...";
    playerRightBlock[1] = "#YesAllWomen!";
    playerRightBlock[2] = "TransRightsAreHumanRights";
    playerRightBlock[3] = "Breasts are not sexual";
    playerRightBlock[4] = "My genitals aren't your business";
    playerRightBlock[5] = "Everyone should use the bathroom peacefully";
    playerRightBlock[6] = "Safe, Sane, Consensual";
    playerRightBlock[7] = "Consent is mandatory";
    playerRightBlock[8] = "Donna Haraway is queen!";
    playerRightBlock[9] = "Fenty makeup is awesome";
    playerRightBlock[10] = "Online spaces are not male";
    playerRightBlock[11] = "Close that wage gap!";
    playerRightBlock[12] = "Question feminity";
    playerRightBlock[13] = "gotta protest gotta protest";
    playerRightBlock[14] = "men can be vulnerable";
    playerRightBlock[15] = "just wanna have fundemental rights";
    playerRightBlock[16] = "no, I won't smile";
    playerRightBlock[17] = "dick pics are gross";
    playerRightBlock[18] = "polyamory exists";
    playerRightBlock[19] = "BDSM isn't anti-feminist";
    playerRightBlock[20] = "moms are amazing";
  }

  void display()
  {
    textSize(15);
    fill(50, 50, 250);
    text(playerLeftBlock[textNumberForP1], 50, 200);
    fill(214, 26, 120);
    text(playerRightBlock[textNumberForP2], 330, 200);
  }

  void changePlayer1() {    //The Patriarchy text changes (blue side)

   
    textNumberForP1 =floor(random(1, 20));
  }

  void endPlayer1() {

   textSize(0);
    exit();
  }

  void changePlayer2() {      //the Feminsim text changes

   
    textNumberForP2 = floor(random(1, 20));
  }

  void endPlayer2() {

    textSize(0);
    exit();
  }
}