class Drop {
  
  float x = random(width);
  float y = random(-600, -50);
  float z = random(0, 20);
  float speed = map(z, 0, 20, 1, 3);
  float len = map(z, 0, 20, 10, 25);
  float thick = map(z, 0, 20, 3, 7);
  color c = 1;

  Drop(color c) {
    this.c = c;
  }
  
  void fall() {
    y = y + speed;
    speed = speed + 0.05;
    if (y > height) {
      y =  random(-200, -50);
      x = random(width);
      z = random(0, 20);
      speed = map(z, 0, 20, 4, 8);
      len = map(z, 0, 20, 10, 25);
    }
  }

  void show() {
    noStroke();
    fill(c);
    triangle(x-thick, y, x+thick, y, x, y-4*thick);
    arc(x, y, 2*thick, 2*thick, 0, PI);
  }

}
