int squareSize = 35;
int squareWidth = 400;

void setup(){
  size(400,400);
}

void draw(){
  rowLR(0, 400 - (squareSize*2), squareSize);
  columnTB(squareSize, 400 - (squareSize*2), 400 - (squareSize*2));
  rowRL(400 - (squareSize*2), squareSize, 400 - (squareSize*2));
  columnBT(400 - (squareSize*2), squareSize*3, squareSize);
  rowLR(squareSize, 400 - (squareSize*4), squareSize*3);
  columnTB(squareSize*3, 400 - (squareSize*4), 400 - (squareSize*4));
  rowRL(400 - (squareSize*4), squareSize*3, 400 - (squareSize*4));
  columnBT(400 - (squareSize*4), squareSize*5, squareSize*3);
  rowLR(squareSize*3, 400 - (squareSize*6), squareSize*5);
}

void rowLR(int start, int end, int y){
  for (int x = start; x <= end; x += squareSize){
    rect(x, y, squareSize, squareSize);
  }
}

void rowRL(int start, int end, int y){
  for (int x = start; x >= end; x -= squareSize){
    rect(x, y, squareSize, squareSize);
  }
}

void columnTB(int start, int end, int x){
  for (int y = start; y <= end; y += squareSize){
    rect(x, y, squareSize, squareSize);
  }
}

void columnBT(int start, int end, int x){
  for (int y = start; y >= end; y -= squareSize){
    rect(x, y, squareSize, squareSize);
  }
}
