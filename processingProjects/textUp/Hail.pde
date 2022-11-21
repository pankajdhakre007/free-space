class Hail {

  float x;
  float y;
  float size;
  float speed;
  float angle;
  float weight;
  color c;

  Hail() {
    angle = 50;
    randomize();
  }
  
  void randomize() {
    speed = random(7, 14);
    weight = map(speed, 7, 14, 3, 8);
    c = color(random(100, 256), random(100, 256), random(100, 256));
    size = map(speed, 7, 14, 50, 200);
    x = random(-width, width); 
    y = random(-400, -size);
  }
  
  void draw() {
    fill(c);
    stroke(c);
    
    strokeWeight(weight);
    line(x, y, x + cos(radians(angle)) * size, y + sin(radians(angle)) * size);
    circle(x + cos(radians(angle)) * size, y + sin(radians(angle)) * size, size/5);
    
    //triangle(x, y,
    //x + cos(radians(angle-2)) * size, y + sin(radians(angle-2)) * size,
    //x + cos(radians(angle+2)) * size, y + sin(radians(angle+2)) * size);
    
    drop();
  }
  
  void drop() {
    x += cos(radians(angle)) * speed;
    y += sin(radians(angle)) * speed;
    if (x > width || y > height) {
      randomize();
    }
  }
}
