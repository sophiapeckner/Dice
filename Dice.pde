Die myDie;

void setup(){
  noLoop();
  size(320,320);
}

void draw(){
  for (int i = 20; i <= 280; i += 40){
    myDie = new Die(i,150);
    myDie.show();
    myDie.roll();
  }
}

void mousePressed(){
  redraw();
}

class Die{
    //member variable declarations here
    int mySize, myX, myY, myValue;
    
    Die(int x, int y){   //constructor   
        //variable initializations here
        mySize = 30;
        myX = x;
        myY = y;
    }
    
    void roll(){
      //your code here
      int num = (int) (Math.random() * 6) + 1;
      System.out.println(num);
      for (int i = 1; i <= num; i++){
        switch (num) {
            case 1:
              ellipse(myX + (0.5 * mySize), myY + (0.5 * mySize), 5, 5);
               break;
        }
        fill(0);
        ellipse(myX+5*i,myY,5,5);
      }
      
    }
    
    void show(){
      //your code here
      stroke(0);
      fill(255);
      rect(myX, myY, mySize, mySize);
    }
}
