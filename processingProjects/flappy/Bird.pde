class Bird {

  float x;
  float y;
  int size;
  float gravity;
  float acceleration;
  float upward;
  Pipe p[];
  boolean crashed;
  int score;

  Bird(Pipe []p) {
    x = width / 4;
    y = height / 2;
    gravity = 1;
    acceleration = 2;
    upward = 15;
    size = 80;
    this.p = p;
    score = 0;
  }  

  void draw() {
    score += pipeCrossed() ? 1 : 0; 
    strokeWeight(7);
    textSize(20);
    textAlign(CENTER, CENTER);
    String text = "SCORE: " + score;

    noFill();
    stroke(0);
    rect(750, 20, 130, 50, 5);
    stroke(255);
    rect(750 - 1, 20 - 1, 130, 50, 5);

    fill(0);
    text(text, 815, 45);
    fill(255);
    text(text, 815 - 1, 45 - 1);

    image(birdImg, x - size/2, y - size/2);
    drop();
    upward();
  }

  void printScore() {
    textSize(80);
    String text = "You Scored " + score;
    fill(0);
    text(text, width / 2, height / 2);
    fill(255);
    text(text, width / 2 - 2, height / 2 - 2);
  }

  boolean pipeCrossed() {
    for (int i = 0; i < p.length; i++) {
      if (b.x == p[i].pipePosition + p[i].pipeWidth)
        return true;
    }
    return false;
  }

  boolean crash() {
    boolean wc = wallCrash();
    boolean pc = pipeCrash();
    crashed = wc || pc;
    if (crashed) {
      image(crashImg, x, y - 70);
      printScore();
    }
    return crashed;
  }

  boolean wallCrash() {
    return y - size / 2 < 0  || y + size / 2 > height;
  }

  boolean pipeCrash() {
    for (int i = 0; i < p.length; i++) {
      boolean faceCrash = x + size / 2 > p[i].pipePosition;
      boolean tailCrash = x - size / 2 < p[i].pipePosition + p[i].pipeWidth;
      boolean headCrash = p[i].fromTop && y - size / 2 < p[i].pipeHeight;
      boolean feetCrash = !p[i].fromTop && y + size / 2 > height - p[i].pipeHeight;
      if (faceCrash && tailCrash && (headCrash || feetCrash)) {
        //System.out.printf("Pipe %d -> [%d,%d] - [%d,%d]\n", i, int(x), int(y), int(p[i].pipePosition), int(p[i].pipeHeight));
        return true;
      }
    }
    return false;
  }

  void drop() {
    y += gravity + acceleration;
    acceleration += 0.2;
  }

  void upward() {
    if (keyPressed && key == ' ') {
      y -= upward;
      acceleration = 2;
    }
  }
}
