int size;
Hail[] h;
Banner b;

void setup() {
  size(900, 600);
  size = 20;
  h = new Hail[size];
  for(int i = 0; i < size; i++) {
    h[i] = new Hail();
  }
  b = new Banner("Yo what's up babes");
}

void draw() {
  background(#abcdef);
  for(int i = 0; i < size; i++) {
    h[i].draw();
  }
  b.draw();
}
