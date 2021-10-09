Die myDie;
int snakeX = 50;
int snakeY = 150;
boolean horizontal = true;

void setup() {
  noLoop();
  size(320, 320);
}

void draw() {
  background(50,255,255,0.5);
  System.out.println(snakeX);
  myDie = new Die(snakeX, snakeY, horizontal);
  myDie.show();
}

void mousePressed() {
  redraw();
}

void keyPressed() {
  if (keyCode == RIGHT){
    snakeX += 5;
    horizontal = true;
    redraw();
  }
  else if (keyCode == LEFT){
    snakeX -= 5;
    horizontal = true;
    redraw();
  }
  else if (keyCode == UP){
    snakeY -= 5;
    horizontal = false;
    redraw();
  }
}

class Die {
  //member variable declarations here
  int mySize, myX, myY, myValue;
  boolean horizontal;
  Die(int x, int y, boolean h) {   //constructor   
    //variable initializations here
    mySize = 30;
    myX = x;
    myY = y;
    horizontal = h;
  }

  void roll(int x, int y) {
    //your code here
    int num = (int) (Math.random() * 6) + 1;
    fill(0);
    for (int i = 1; i <= num; i++) {
      switch (num) {
      case 1:
        ellipse(x + (0.5 * mySize), y + (0.5 * mySize), 5, 5);
        break;
      case 2:
        ellipse(x + (int)(mySize/5), y + (int)(mySize/5), 5, 5);
        ellipse(x + (mySize - (int)(mySize/5)), y + (mySize - (int)(mySize/5)), 5, 5);
        break;
      case 3:
        ellipse(x + (int)(mySize/5), y + (int)(mySize/5), 5, 5);
        ellipse(x + (mySize - (int)(mySize/5)), y + (mySize - (int)(mySize/5)), 5, 5);
        ellipse(x + (0.5 * mySize), y + (0.5 * mySize), 5, 5); 
        break;
      case 4:
        ellipse(x + (int)(mySize/5), y + (int)(mySize/5), 5, 5);
        ellipse(x + (mySize - (int)(mySize/5)), y + (mySize - (int)(mySize/5)), 5, 5);
        ellipse(x + (mySize - (int)(mySize/5)), y + (int)(mySize/5), 5, 5);
        ellipse(x + (int)(mySize/5), y + (mySize - (int)(mySize/5)), 5, 5);
        break;
      case 5:
        ellipse(x + (int)(mySize/5), y + (int)(mySize/5), 5, 5);
        ellipse(x + (mySize - (int)(mySize/5)), y + (mySize - (int)(mySize/5)), 5, 5);
        ellipse(x + (mySize - (int)(mySize/5)), y + (int)(mySize/5), 5, 5);
        ellipse(x + (int)(mySize/5), y + (mySize - (int)(mySize/5)), 5, 5);
        ellipse(x + (0.5 * mySize), y + (0.5 * mySize), 5, 5);
        break;
      case 6:
        ellipse(x + (int)(mySize/5), y + (int)(mySize/5), 5, 5);
        ellipse(x + (mySize - (int)(mySize/5)), y + (mySize - (int)(mySize/5)), 5, 5);
        ellipse(x + (mySize - (int)(mySize/5)), y + (int)(mySize/5), 5, 5);
        ellipse(x + (int)(mySize/5), y + (mySize - (int)(mySize/5)), 5, 5);
        ellipse(x + (int)(mySize/5), y + (0.5 * mySize), 5, 5);
        ellipse(x + (mySize - (int)(mySize/5)), y + (0.5 * mySize), 5, 5);
        break;
      }
    }
  }

  void show() {
    //your code here
    if (horizontal){
      stroke(0);
      
      fill(255);
      rect(myX, myY, mySize, mySize, 5);
      roll(myX, myY);
      
      fill(255);
      rect(myX+30, myY, mySize, mySize, 5);
      roll(myX+30, myY);
      
      fill(255);
      rect(myX+60, myY, mySize, mySize, 5);
      roll(myX+60, myY);
    } else {
      stroke(0);
      
      fill(255);
      rect(myX, myY, mySize, mySize, 5);
      roll(myX, myY);
      
      fill(255);
      rect(myX, myY+30, mySize, mySize, 5);
      roll(myX, myY+30);
      
      fill(255);
      rect(myX, myY+60, mySize, mySize, 5);
      roll(myX, myY+60);
    }
  }
}
