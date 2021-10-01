//http://learningprocessing.com/examples/chp18/example-18-01-userinput

import g4p_controls.*;
Die myDie;

PFont f;
char typing;

void setup() {
  f = createFont("Arial",16);
  size(320, 320);
  //noLoop();
}

void draw() {
  textFont(f);
  text(typing,240,170);
}

void keyPressed() {
  // If the return key is pressed, save the String and clear it
  if (key == '\n') {
    
    // A String can be cleared by setting it equal to ""
    //typing = ""; 
  } else {
    // Otherwise, concatenate the String
    // Each character typed by the user is added to the end of the String variable.
    typing = key; 
  }
}

void mousePressed() {
  for (int i = 20; i <= 210; i += 80) {
    myDie = new Die(i, 150);
    myDie.show();
    myDie.roll();
  }
}

class Die {
  //member variable declarations here
  int mySize, myX, myY, myValue;

  Die(int x, int y) {   //constructor   
    //variable initializations here
    mySize = 30;
    myX = x;
    myY = y;
  }

  void roll() {
    //your code here
    int num = (int) (Math.random() * 6) + 1;
    System.out.println(num);
    fill(0);
    for (int i = 1; i <= num; i++) {
      switch (num) {
      case 1:
        ellipse(myX + (0.5 * mySize), myY + (0.5 * mySize), 5, 5);
        break;
      case 2:
        showTwo();
        break;
      case 3:
        showTwo();
        ellipse(myX + (0.5 * mySize), myY + (0.5 * mySize), 5, 5); 
        break;
      case 4:
        showTwo();
        ellipse(myX + (mySize - (int)(mySize/5)), myY + (int)(mySize/5), 5, 5);
        ellipse(myX + (int)(mySize/5), myY + (mySize - (int)(mySize/5)), 5, 5);
        break;
      case 5:
        showTwo();
        ellipse(myX + (mySize - (int)(mySize/5)), myY + (int)(mySize/5), 5, 5);
        ellipse(myX + (int)(mySize/5), myY + (mySize - (int)(mySize/5)), 5, 5);
        ellipse(myX + (0.5 * mySize), myY + (0.5 * mySize), 5, 5);
        break;
      case 6:
        showTwo();
        ellipse(myX + (mySize - (int)(mySize/5)), myY + (int)(mySize/5), 5, 5);
        ellipse(myX + (int)(mySize/5), myY + (mySize - (int)(mySize/5)), 5, 5);
        ellipse(myX + (int)(mySize/5), myY + (0.5 * mySize), 5, 5);
        ellipse(myX + (mySize - (int)(mySize/5)), myY + (0.5 * mySize), 5, 5);
        break;
      }
    }
  }

  void show() {
    //your code here
    stroke(0);
    fill(255);
    rect(myX, myY, mySize, mySize, 5);
  }
  
  void showTwo() {
    ellipse(myX + (int)(mySize/5), myY + (int)(mySize/5), 5, 5);
    ellipse(myX + (mySize - (int)(mySize/5)), myY + (mySize - (int)(mySize/5)), 5, 5);
  }
}
