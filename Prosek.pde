void setup(){
size(1200, 500);
background(200);
createGroup1(1200, 200);
}


void createGroup1(float x, float y){
  for (int i = 0; i < 100; i++){
    createFish(random(x), random(y), random(30), random(30));
  }
   
    
}



void createFish(float x, float y, float w, float h){
  noFill();
  ellipseMode(RADIUS);
  ellipse(x, y, w, h);
 triangle(x + w, y, x + 1.5 * w, y + h , x + 1.5 * w, y - h);
}
