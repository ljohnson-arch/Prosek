float rowSpacing = 50;
float fishBaseSize = 10;
float fishScaleMin = 3;
float fishScaleRange = 10;
float tailLengthFactor = 1.5;

//fish detail 
float eyeSizeFactor = 0.12;
float pupilSizeFactor = 0.5;
float eyeOffsetXFactor = 0.25;
float eyeOffsetYFactor = 0.10;
float gillOffsetXFactor = 0.1;
float gillHeightFactor = 0.4;
float stripeLengthFactor = 0.3;
float tailWidthFactor = 0.5;

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
  
  //outline 
  stroke(0, 40);
  noFill();
  ellipse(centerX, centerY, fishWidth, fishHeight);
  
  //eye
  float eyeSize = fishWidth * eyeSizeFactor;
  float eyeX = centerX - fishWidth * eyeOffsetXFactor;
  float eyeY = centerY - fishHeight * eyeOffsetYFactor;
  
  fill(255); //white part
  noStroke();
  ellipse(eyeX, eyeY, eyeSize, eyeSize);
  
  fill(0); //pupil
  ellipse(eyeX, eyeY, eyeSize * pupilSizeFactor, eyeSize * pupilSizeFactor);
  
  //gill line
  stroke(0, 80);
  strokeWeight(1.2);
  float gillX = centerX - fishWidth * gillOffsetXFactor;
  line(gillX, centerY - fishHeight * gillHeightFactor, gillX, centerY + fishHeight * gillHeightFactor);

//stripe 
  stroke(255, 200, 200, 120);
  strokeWeight(2);
  line(centerX - fishWidth * stripeLengthFactor, centerY, centerX + fishWidth * stripeLengthFactor, centerY);  
}
