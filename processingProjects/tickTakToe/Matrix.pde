import java.util.Objects;

public class Matrix {

  int row;
  int col;
  int emptyCount;
  int oCount;
  int xCount;

  Matrix(int row, int col) {
    this.row = row;
    this.col = col;
  }

  void updateCount(Shape shape) {
    if (shape == null) {
      emptyCount++;
    } else if (shape.toString().equals("X")) {
      xCount++;
    } else if (shape.toString().equals("O")) {
      oCount++;
    }
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    Matrix matrix = (Matrix) o;
    return row == matrix.row && col == matrix.col && emptyCount == matrix.emptyCount && oCount == matrix.oCount && xCount == matrix.xCount;
  }

  @Override
  public int hashCode() {
    return Objects.hash(row, col, emptyCount, oCount, xCount);
  }

  @Override
  public String toString() {
    return String.format("[%d, %d] -> Empty=%d, oCount=%d, xCount=%d", row, col, emptyCount, oCount, xCount);
  }

}
