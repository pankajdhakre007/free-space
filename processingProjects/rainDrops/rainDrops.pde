Drop[] d;
int dCount;
color bgColor;
color dropColor;
boolean clicked = true;

void setup() {
  size(800, 600, P2D);
  dCount = 200;
  bgColor = color(245, 246, 250);

  d = new Drop[dCount];
  for (int i=0; i< dCount; i++) {
    d[i] = new Drop(color(random(100, 256), random(100, 256), random(100, 256)));
  }
}

void draw() {
  if (clicked) {
    background(bgColor);
    for (int i=0; i< dCount; i++) {
      d[i].fall();
      d[i].show();
    }
  }
}

void mouseClicked() {
  clicked = !clicked;
}
