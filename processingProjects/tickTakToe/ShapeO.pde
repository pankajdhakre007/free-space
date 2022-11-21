class ShapeO implements Shape {
  int size;
  int posX;
  int posY;

  ShapeO(int row, int col) {
    int colPos = padding + row * blockWidth;
    int rowPos = padding + col * blockHeight;
    this.posX = rowPos + blockHeight / 2;
    this.posY = colPos + blockWidth / 2;
    this.size = blockWidth/2 - 10;
  }

  int getPosX() {
    return posX;
  }

  int getPosY() {
    return posY;
  }

  void drawShape() {
    noFill();

    stroke(#837b66);
    strokeWeight(13);
    circle(posX + shadow, posY + shadow, size);

    stroke(#f46464);
    strokeWeight(13);
    circle(posX, posY, size);
  }
  
  String toString() {
    return "O"; 
  }
}
