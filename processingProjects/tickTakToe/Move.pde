class Move { //<>//

  int row;
  int col;
  Board board;
  Mode mode;

  Move() {
    row  = -1;
    col = -1;
    this.board = b;
    this.mode = m;
  }

  int getRow() {
    return row;
  }

  int getCol() {
    return col;
  }

  Move getMove() {
    switch(mode) {
    case AUTO:
      return getAutoMove();
    case VS:
      return getPlayerMove();
    case CPU:
      return getCpuMove();
    default:
      return getAutoMove();
    }
  }

  Move getAutoMove() {
    do {
      int pick = floor(random(0, gridSize * gridSize));
      row = pick / gridSize;
      col = pick % gridSize;
    } while (board.isOccupied(row, col));
    return this;
  }

  Move getPlayerMove() {
    int mousePosX = pmouseX;
    int mousePosY = pmouseY;
    if (padding < mousePosX && mousePosX < maxPlayableHeight && padding < mousePosY && mousePosY < maxPlayableWidth) { 
      row = (mousePosY - padding) / blockWidth;
      col = (mousePosX - padding) / blockHeight;
    } else {
      row = -1;
      col = -1;
    }
    return this;
  }

  Move getCpuMove() {
    return player.getCurrentPlayer() == Player.PlayerX ? getPlayerMove() : getNextCpuMove();
  }
  
  Move getNextCpuMove() {
    int[] m = new CalculatedMove(board.grid).nextMove();
    row = m[0];
    col = m[1];
    return this;
  }
  
}
