public enum Player {

  PlayerX("X"), PlayerO("O");

  private String name;

  private Player(String name) {
    this.name = name;
  }

  String getCurrentPlayerName () {
    return this.name;
  }

   static Player getRandomPlayer() {
    double random = Math.random();
    return random < 0.5 ? PlayerX : PlayerO;
  }

  Player getCurrentPlayer () {
    return this;
  }

  Player getNextPlayer () {
    return PlayerX == this ? PlayerO : PlayerX;
  }

}
