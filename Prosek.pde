float rowSpacing = 50;
float fishBaseSize = 10;
float fishScaleMin = 3;
float fishScaleRange = 10;
float tailLengthFactor = 1.5;

void setup() {
  int canvasWidth = 2000;
  int canvasColor = 200;
  
  int groupHeight = 150;
  int gap = 50;
  
  size(2000, 600);
  background(canvasColor);
  createGroup(canvasWidth, groupHeight, gap, color(255, 0, 0), color(255, 255, 0));
  createGroup(canvasWidth, groupHeight, 2 * gap + groupHeight, color(255, 255, 0), color(0, 255, 0));
  createGroup(canvasWidth, groupHeight, 3 * gap + 2 * groupHeight, color(0, 255, 0), color(0, 0, 255));
}

void createGroup(float groupWidth, float groupHeight, float yStart, color startColor, color endColor) {
 
  for (float y = yStart; y < yStart + groupHeight; y += rowSpacing){
    float x = 0;
    while (x < groupWidth) {
      float scale = random(fishScaleRange) + fishScaleMin;
      float fishWidth = fishBaseSize * scale;
      float fishHeight = fishWidth / 2;
      
      float t = x / groupWidth;
      color fishColor = lerpColor(startColor, endColor, t); 
      
      createFish(x, y, fishWidth, fishHeight, fishColor);
      
      x += tailLengthFactor * fishWidth; // moves to the next fish
    }      
  }
}


void createFish(float x, float y, float fishWidth, float fishHeight, color fishColor) {
  ellipseMode(CENTER);
  float centerX = x + fishWidth / 2;
  float centerY = y;
  
  //body
  noStroke();
  fill(fishColor);
  ellipse(centerX, centerY, fishWidth, fishHeight);
  
  //tail
  float tailStart = x + fishWidth;
  float tailWidth = fishWidth * 0.5;
  triangle(tailStart, centerY, tailStart + tailWidth, centerY - fishHeight / 2, tailStart + tailWidth, y + fishHeight / 2);
  
}
