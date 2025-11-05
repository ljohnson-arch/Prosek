void setup() {
  int canvasWidth = 1530;
  int canvasColor = 200;
  int groupHeight = 150;
  int gap = 25;
  size(1530, 500);
  background(canvasColor);
  createGroup(canvasWidth, groupHeight, gap, color(255, 0, 0), color(255, 255, 0));
  createGroup(canvasWidth, groupHeight, 2 * gap + groupHeight, color(0, 255, 0), color(255, 255, 0));
  createGroup(canvasWidth, groupHeight, 3 * gap + 2 *  groupHeight, color(0, 0, 255), color(0, 0, 0));
}

void createGroup(float groupWidth, float groupHeight, float y, color startColor, color endColor) {
  float x = 0;
  float y2 = y + groupHeight;
  while (y < y2) {
    while (x < groupWidth) {
      float scale = random(10) + 3;
      float fishWidth = 10 * scale;
      float fishHeight = fishWidth / 2;
      
      float t = x / groupWidth;
      
      color fishColor = lerpColor(startColor, endColor, t);
      
      createFish(x, y, fishWidth, fishHeight, fishColor);
      x += 1.5 * fishWidth;
    }      
    y += 50;
    x = 0;
    
    
  }
}

void createFish(float x, float y, float fishWidth, float fishHeight, color fishColor) {
  fill(fishColor);
  float fishX = x + fishWidth / 2;
  float fishY = y;
  ellipseMode(CENTER);
  ellipse(fishX, fishY, fishWidth, fishHeight);
  triangle(x + fishWidth, fishY, x + 1.5 * fishWidth, y - fishHeight / 2, x + 1.5 * fishWidth, y + fishHeight / 2);
}
