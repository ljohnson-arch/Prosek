void setup(){
size(1200, 500);
background(200);
createFish(200, 200, 100, 50); 
}

void createFish(int x, int y, int w, int h){
  noFill();
  ellipseMode(RADIUS);
  ellipse(x, y, w, h);
 triangle(x + w, y, x + 1.5 * w, y + h , x + 1.5 * w, y - h);
}
