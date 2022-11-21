class CalculatedMove {
 
  Shape[][] grid;
  
  CalculatedMove(Shape[][] grid) {
    this.grid = grid;
  }
  
  int[] nextMove() {
    MatrixUsage mu = new MatrixUsage(grid);
    Set<Matrix> possibleMoves = mu.getRequestedSet(0, gridSize - 1, 0);
    if (possibleMoves.isEmpty()) {
      
      possibleMoves = mu.getRequestedSet(0, 0, gridSize - 1);
      if (possibleMoves.isEmpty()) {
        
        possibleMoves = mu.getRequestedSet(1, gridSize - 2, 0);
        if (possibleMoves.isEmpty()) {
          
          possibleMoves = mu.getMatrixSet();
        }
      }
    }
    return getRandomMove(possibleMoves);
  }
  
  int[] getRandomMove(Set<Matrix> possibleMoves) {
    int totalMoves = possibleMoves.size();
    int randomItr = floor(random(1, totalMoves + 1));
    Iterator<Matrix> itr = possibleMoves.iterator();
    while(randomItr - 1 > 0) {
      itr.next();
      randomItr--;
    }
    Matrix m = itr.next();
    return new int[]{m.row, m.col};
  }
  
}
