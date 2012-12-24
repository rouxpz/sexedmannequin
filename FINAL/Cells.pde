class Cells {
  PImage cells;
  float x;
  float y;
  
  Cells(String filename, float tempX, float tempY) {
    cells = loadImage(filename);
    x = tempX;
    y = tempY;
  }
  
  void display() {
    image (cells,x,y);
  }
}
    
