Bird b;
int pipeCount = 6;
Pipe p1, p2;
Pipe p[];
PImage bkImg;
PImage birdImg;
PImage pipeImg;
PImage pipe2Img;
PImage crashImg;

void setup() {
  size(900, 600);
  bkImg = loadImage("./images/background.png");
  bkImg.resize(width, height);
  birdImg = loadImage("./images/flappy.png");
  birdImg.resize(80, 80);
  pipeImg = loadImage("./images/pipe.png");
  pipeImg.resize(60, 225);
  pipe2Img = loadImage("./images/pipe2.png");
  pipe2Img.resize(60, 225);
  crashImg = loadImage("./images/crash.png");
  crashImg.resize(200, 170);
  newGame();
}

void draw() {
  if (!b.crash()) {
    image(bkImg, 0, 0);
    for (int i = 0; i < pipeCount; i++) {
      p[i].draw();
    }
    b.draw();
  }
}

void keyPressed() {
  if(b.crash() && key == ' ') {
    newGame();
  }
}

void newGame() {
  p = new Pipe[pipeCount];
  for (int i = 0; i < pipeCount; i++) {
    p[i] = new Pipe(i * 160);
  }
  b = new Bird(p);
}
