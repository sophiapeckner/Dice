Die myDie;
// snake's HEAD position
int snakeX = 50;
int snakeY = 150;
int len = 6;
// snake's BODY position
String direction;
// init apple's coord
int appleX, appleY;
boolean ate = false;   // checks whether apple v. snake collision occurred

void setup() {
  size(420, 420);
  noLoop();
  ate = true;
}

// ~ draws snake whenever according to keys pressed ~
void draw() {
  drawGrid();
  // create Die instance
  myDie = new Die(snakeX, snakeY, len);
  myDie.show();
  drawApple();
  boolean hit = checkCollision(appleX, appleY, 20, snakeX, snakeY, 30, 30);
  if (hit) {
    ate = true;
    drawApple();
    len++;
  }
}

// ~ draws background ~
void drawGrid() {
  noStroke();
  boolean light = true;
  for (int x = 0; x <= 420; x += 30){
    for (int y = 0; y <= 420; y += 30){
      if (light) {
        fill(210, 255, 152);  //light green
        light = false;
      } else {
        fill(200, 255, 122);  //dark green
        light = true;
      }
      rect(x, y, 30, 30);
    }
  }
}

// ~ draws a circle at a random position ~
void drawApple() {
   if (ate) {    // only draw a new apple IF the previous one was 'ate' by the snake
     appleX = (int) (Math.random() * 300);
     appleY = (int) (Math.random() * 300);
     ate = false;
   }
   fill(255,0,0);
   ellipse(appleX, appleY, 20, 20);
}

boolean checkCollision(float cx, float cy, float r, float rx, float ry, float rw, float rh) {
  // Temporary variables to set edges for testing
  float testX = cx;
  float testY = cy;

  // Which edge is closest?
  if (cx < rx)         testX = rx;      // test left edge
  else if (cx > rx+rw) testX = rx+rw;   // right edge
  if (cy < ry)         testY = ry;      // top edge
  else if (cy > ry+rh) testY = ry+rh;   // bottom edge

  // Get distance from closest edges
  float distX = cx-testX;
  float distY = cy-testY;
  float distance = sqrt( (distX*distX) + (distY*distY) );

  // If the distance is less than the radius, collision!
  if (distance <= r) {
    return true;
  }
  return false;
}

// ~ sets new direction and snake's coordinate whenever a key is pressed ~ 
void keyPressed() {
  if (keyCode == RIGHT){
    snakeX += 5;
    direction = "RIGHT";
  }
  else if (keyCode == LEFT){
    snakeX -= 5;
    direction = "LEFT";
  }
  else if (keyCode == UP){
    snakeY -= 5;
    direction = "UP";
  }
  else if (keyCode == DOWN){
    snakeY += 5;
    direction = "DOWN";
  }
  redraw();
}

// ~ draws die and its sides ~
class Die {
  //member variable declarations
  int mySize, myX, myY, myValue, mySum, snakeLength;
  Die(int x, int y, int l) {   //constructor   
    //variable initializations
    mySize = 30;
    myX = x;
    myY = y;
    snakeLength = l;
  }

  void roll(int x, int y) {
    int num = (int) (Math.random() * 6) + 1;
    mySum += num;
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
    mySum = 0;  // resets sum every time key is pressed
    stroke(0);
    for (int i = 0; i < snakeLength; i ++){
      fill(162, 210, 255);  
      if (i == 0) fill(237, 246, 249);  // snake's head
      
      if (direction == "RIGHT") {
        rect(myX-(i*30), myY, mySize, mySize, 5);
        roll(myX-(i*30), myY);
      } else if (direction == "LEFT") {
        rect(myX+(i*30), myY, mySize, mySize, 5);
        roll(myX+(i*30), myY);
      } else if (direction == "UP") {
        rect(myX, myY+(i*30), mySize, mySize, 5);
        roll(myX, myY+(i*30));
      } else if (direction == "DOWN") {
        rect(myX, myY-(i*30), mySize, mySize, 5);
        roll(myX, myY-(i*30));
      }
    }
    
    textSize(70);
    fill(140);
    text(mySum, 180,70);
    textSize(15);
    fill(0);
    text(snakeLength+" die snake", 330,400);
  }
}
