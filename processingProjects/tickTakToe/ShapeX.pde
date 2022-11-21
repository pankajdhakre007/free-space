class ShapeX implements Shape {
  int size;
  int posX;
  int posY;

  ShapeX(int row, int col) {
    int colPos = padding + row * blockWidth;
    int rowPos = padding + col * blockHeight;
    this.posX = rowPos + blockHeight / 2;
    this.posY = colPos + blockWidth / 2;
    this.size = blockWidth/4 - 10;
  }

  int getPosX() {
    return posX;
  }

  int getPosY() {
    return posY;
  }

  void drawShape() {
    stroke(#837b66);
    strokeWeight(13);
    line(posX - size + shadow, posY - size + shadow, posX + size + shadow, posY + size + shadow);
    line(posX + size + shadow, posY - size + shadow, posX - size + shadow, posY + size + shadow);

    stroke(#8ad612);
    strokeWeight(13);
    line(posX - size, posY - size, posX + size, posY + size);
    line(posX + size, posY - size, posX - size, posY + size);
  }
  
  String toString() {
    return "X"; 
  }
}
