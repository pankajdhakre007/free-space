class Board {
  int size;
  boolean[][] occupied;
  Shape[][] grid;

  Board(int size) {
    this.size = size;
    this.occupied = new boolean[size][size];
    this.grid = new Shape[size][size];
  }

  void placeMark(int row, int col, Shape s) {
    if (!isOccupied(row, col)) {
      grid[row][col] = s;
      occupied[row][col] = true;
      drawBoard();
    }
  }

  void drawBoard() {
    for (int i = 0; i < size; i++) {
      for (int j = 0; j < size; j++) {
        if (isOccupied(i, j)) {
          grid[i][j].drawShape();
        }
      }
    }
  }

  String getItemName(int row, int col) {
    if (isOccupied(row, col)) {
      return grid[row][col].getClass().getName();
    }
    return null;
  }

  boolean drawStreak(boolean foundStreak, Shape s1, Shape s2) {
    if (foundStreak) {
      stroke(#837b66);
      strokeWeight(12);
      line(s1.getPosX(), s1.getPosY(), s2.getPosX(), s2.getPosY());
    }
    return foundStreak;
  }

  boolean isOccupied(int row, int col) {
    return occupied[row][col];
  }

  boolean isValidPosition(int row, int col) {
    return 0 <= row && row < gridSize && 0 <= col && col < gridSize;
  }

  boolean checkWinner(int row, int col) {
    return checkRow(row) || checkCol(col) || checkLeftDiagonal(row, col) || checkRightDiagonal(row, col);
  }

  boolean checkRow(int row) {
    boolean foundStreak = false;
    if (isOccupied(row, 0)) {
      foundStreak = true;
      for (int i = 0; i < size; i++) {
        if (!isOccupied(row, i) || grid[row][i].getClass().getName() != grid[row][0].getClass().getName()) {
          foundStreak = false;
          break;
        }
      }
    }
    return drawStreak(foundStreak, grid[row][0], grid[row][size - 1]);
  }

  boolean checkCol(int col) {
    boolean foundStreak = false;
    if (isOccupied(0, col)) {
      foundStreak = true;
      for (int i = 0; i < size; i++) {
        if (!isOccupied(i, col)  || grid[i][col].getClass().getName() != grid[0][col].getClass().getName()) {
          foundStreak = false;
          break;
        }
      }
    }
    return drawStreak(foundStreak, grid[0][col], grid[size - 1][col]);
  }

  boolean checkLeftDiagonal(int row, int col) {
    boolean foundStreak = false;
    if (row == col) {
      foundStreak = true;
      for (int i = 0; i < size; i++) {
        if (!isOccupied(i, i) || !isOccupied(0, 0) || grid[i][i].getClass().getName() != grid[0][0].getClass().getName()) {
          foundStreak = false;
          break;
        }
      }
    }
    return drawStreak(foundStreak, grid[0][0], grid[size - 1][size - 1]);
  }

  boolean checkRightDiagonal(int row, int col) {
    boolean foundStreak = false;
    if (size - 1 - row == col) {
      foundStreak = true;
      for (int i = 0; i < size; i++) {
        if (!isOccupied(i, size - 1 - i) || !isOccupied(0, size - 1) || grid[i][size - 1 - i].getClass().getName() != grid[0][size - 1].getClass().getName()) {
          foundStreak = false;
          break;
        }
      }
    }
    return drawStreak(foundStreak, grid[0][size - 1], grid[size - 1][0]);
  }
}
