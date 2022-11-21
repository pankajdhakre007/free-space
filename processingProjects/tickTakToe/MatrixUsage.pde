import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public class MatrixUsage {

  Set<Matrix> matrixSet;
  Shape[][] grid;

  MatrixUsage(Shape[][] grid) {
    matrixSet = new HashSet<Matrix>();
    this.grid = grid;
    addUsage();
  }

  Set<Matrix> getMatrixSet() {
    return matrixSet;
  }
  
  Set<Matrix> getRequestedSet(int emptyCount, int oCount, int xCount) {
    Iterator<Matrix> itr = matrixSet.iterator();
    Set<Matrix> subSet = new HashSet<Matrix>();
    while (itr.hasNext()) {
      Matrix m = itr.next();
      if (m.emptyCount == emptyCount && m.oCount == oCount && m.xCount == xCount) {
        itr.remove();
        subSet.add(m);
      }
    }
    return subSet;
  }

  void addUsage() {
    for (int row = 0; row < grid.length; row++) {
      for (int col = 0; col < grid[0].length; col++) {
        if (isEmpty(row, col)) {
          addRowUsage(row, col);
          addColUsage(row, col);
          addL2RDiagonalUsage(row, col);
          addR2LDiagonalUsage(row, col);
        }
      }
    }
  }

  private void addRowUsage(int row, int col) {
    Matrix m = new Matrix(row, col);
    for (int i = 0; i < grid.length; i++) {
      if (i != col) {
        m.updateCount(grid[row][i]);
      }
    }
    matrixSet.add(m);
  }

  private void addColUsage(int row, int col) {
    Matrix m = new Matrix(row, col);
    for (int i = 0; i < grid.length; i++) {
      if (i != row) {
        m.updateCount(grid[i][col]);
      }
    }
    matrixSet.add(m);
  }

  private void addL2RDiagonalUsage(int row, int col) {
    if (row == col) {
      Matrix m = new Matrix(row, col);
      for (int i = 0; i < grid.length; i++) {
        if (i != row) {
          m.updateCount(grid[i][i]);
        }
      }
      matrixSet.add(m);
    }
  }

  private void addR2LDiagonalUsage(int row, int col) {
    if (row == grid.length - 1 - col) {
      Matrix m = new Matrix(row, col);
      for (int i = 0; i < grid.length; i++) {
        if (i != grid.length - 1 - col) {
          m.updateCount(grid[i][grid.length - 1 - col]);
        }
      }
      matrixSet.add(m);
    }
  }

  private boolean isEmpty(int row, int col) {
    return grid[row][col] == null;
  }

}
