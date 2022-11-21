int padding = 20;
int buffer = 30;
int shadow = 4;
int boardHeight = 600;
int boardWidth = 600;

Board b;
Mode m;
int gridSize;
int moves;
int maxMoves;

int blockWidth;
int blockHeight;
int maxPlayableWidth;
int maxPlayableHeight;

Player player;
boolean finished;
boolean foundWinner;

void setup() {
  size(600, 600);
  newGame(3, Mode.CPU);
  frameRate(4);
}

void draw() {
  autoRun();
  if (!finished) {
    b.drawBoard();
    if (foundWinner) {
      finished = true;
      banner("Player " + player.getCurrentPlayerName() + " Wins !!");
    } else if (moves == maxMoves) {
      finished = true;
      banner("Game Over !!");
    }
  }
}

void mouseClicked() {
  if (m == Mode.VS || m == Mode.CPU) {
    playMoves();
  }
}

void autoRun() {
  if (m == Mode.AUTO || (m == Mode.CPU && player.getCurrentPlayer() == Player.PlayerO && foundWinner == false)) {
    playMoves();
  }
}

void playMoves() {
  if (moves < maxMoves && !finished) {
    Move move = new Move().getMove();
    int row = move.getRow();
    int col = move.getCol();
    if (b.isValidPosition(row, col) && !b.isOccupied(row, col)) {
      Shape s = player.getCurrentPlayer() == Player.PlayerO ? new ShapeO(row, col) : new ShapeX(row, col);
      b.placeMark(row, col, s);
      if (b.checkWinner(row, col)) {
        foundWinner = true;
      } else {
        player = player.getNextPlayer();
        moves++;
      }
    }
  } else {
    newGame(gridSize, m);
  }
}
