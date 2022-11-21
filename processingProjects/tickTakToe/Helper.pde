void drawGrid(int gridSize, int shadow) {
  for (int i = padding; i < blockWidth * (gridSize - 1); i += blockWidth) {
    stroke(#837b66);
    strokeWeight(13);
    line(i + blockWidth + shadow, padding + buffer + shadow, i + blockWidth + shadow, maxPlayableWidth - buffer + shadow);
    line(padding + buffer + shadow, i + blockHeight + shadow, maxPlayableHeight - buffer + shadow, i + blockHeight + shadow);

    stroke(#b1a25d);
    strokeWeight(10);
    line(i + blockWidth, padding + buffer, i + blockWidth, maxPlayableWidth - buffer);
    line(padding + buffer, i + blockHeight, maxPlayableHeight - buffer, i + blockHeight);
  }
}

void banner(String msg) {
  textSize(80);
  textAlign(CENTER, CENTER);
  fill(#837b66);
  text(msg, boardWidth / 2 + shadow, boardHeight / 2 - 20 + shadow);
  fill(#1255FA);
  text(msg, boardWidth / 2, boardHeight / 2 - 20);
}

void animate() {
  if (gridSize >= 3 && gridSize <= 6) {
    background(#e6e4d2);
    for (int i = 0; i < gridSize; i++) {
      for (int j = 0; j < gridSize; j++) {
        Shape s = ((i + j) % 2 == 0) ? new ShapeO(i, j) : new ShapeX(i, j);
        s.drawShape();
      }
    }
  }
}

void newGame(int boardSize, Mode mode) {
  gridSize = boardSize;
  moves = 0;
  maxMoves = boardSize * boardSize;

  blockWidth = round(float(boardWidth - 2 * (padding)) / gridSize);
  blockHeight = round(float(boardHeight - 2 * (padding)) / gridSize);
  maxPlayableWidth = padding + blockWidth * gridSize;
  maxPlayableHeight = padding + blockHeight * gridSize;

  m = mode;
  player = Player.getRandomPlayer();
  finished = false;
  foundWinner = false;

  b = new Board(boardSize);
  background(#f5f4d2);
  drawGrid(gridSize, shadow);
}
