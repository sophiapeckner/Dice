Die myDie;

void setup(){
  noLoop();
  size(300,300);
}

void draw(){
  for (int i = 20; i <= 280; i += 40){
    myDie = new Die(i,150);
    myDie.show();
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
    }
    
    void show(){
      //your code here
      fill(0);
      rect(myX, myY, mySize, mySize);
    }
}
