class Pipe {

  float pipePosition;
  float pipeHeight;
  float pipeWidth;
  float mouthHeight;
  boolean fromTop;
  int speed = 5;

  Pipe(float startPosition) {
    this.pipePosition = width + startPosition;
    this.pipeHeight = random(175, 225);
    this.pipeWidth = 60;
    this.mouthHeight = 10;
    this.fromTop = random(1) < 0.51;
  }

  void move() {
    pipePosition -= speed;
    if (pipePosition == -pipeWidth) {
      pipePosition = width;
      pipeHeight = random(175, 225);
      fromTop = random(1) < 0.51;
    }
  }

  void draw() {
    if (!fromTop) {
      image(pipeImg, pipePosition, height - pipeHeight, pipeWidth, pipeHeight);
      //rect(pipePosition, height - pipeHeight, pipeWidth, pipeHeight);
      //rect(pipePosition - 5, height - pipeHeight, pipeWidth + 10, mouthHeight, 5);
    } else {
      image(pipe2Img, pipePosition, 0, pipeWidth, pipeHeight);
      //rect(pipePosition, 0, pipeWidth, pipeHeight);
      //rect(pipePosition - 5, pipeHeight - mouthHeight, pipeWidth + 10, mouthHeight, 5);
    }
    move();
  }
}
