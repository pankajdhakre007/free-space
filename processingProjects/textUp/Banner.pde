class Banner {

  float x;
  float y;
  String text;
  float border;
  float size;
  boolean grow;

  Banner(String text) {
    x = width / 2;
    y = height / 2;
    this.text = text.toUpperCase();
    this.border = 4;
    size = 20;
    grow = true;
  }

  void draw() {
    fill(255);
    textSize(size);
    textAlign(CENTER, CENTER);
    //text(text, x-border, y-border);
    //text(text, x+border, y-border);
    //text(text, x-border, y+border);
    text(text, x+border, y+border);
    fill(#45679A);
    text(text, x, y);
    grow();
  }

  void grow() {
    float w = textWidth(text);
    if (w > width - 30) {
      grow = false;
    } else if (size == 20) {
      grow = true;
    }
    size += grow ? 1 : -1;
    
  }
}
