int totalFrames = 98;
int counter = 0;

void setup() {
 size(1000,700);
  
}

void render(float percent) {
  background(0);
  fill(255);
  
  float angle = percent * TWO_PI;
  translate(width/2, height/2);
  noFill();
  
  stroke(255);
  strokeWeight(5);
  rotate(angle);
  circle(0, 293, 6);
  
  stroke(255);
  strokeWeight(5);
  rotate(angle);
  circle(0, 290, 10);
  
  stroke(255,0,0);
  strokeWeight(5);
  rotate(angle);
  circle(0, 265, 60);
  
  stroke(255, 0, 255);
  strokeWeight(5);
  rotate(angle);
  circle(0, 240, 110);
 
  stroke(255,255,0);
  strokeWeight(5);
  rotate(angle);
  circle(0, 195, 200);
  
  stroke(0,0,255);
  strokeWeight(5);
  rotate(angle);
  circle(0, 145, 300);
  
  stroke(0,255,0);
  strokeWeight(5);
  rotate(angle);
  circle(0, 95, 400);
  
  stroke(0,255,255);
  strokeWeight(5);
  rotate(angle);
  circle(0, 45, 500);
  
  stroke(255,165,0);
  strokeWeight(5);
  rotate(angle);
  circle(0, 0, 600);
  
}

void draw() {
 
  float percent = float(counter) / totalFrames;
  render(percent);
  saveFrame("output/gif-"+nf(counter,4)+".png");
  counter++;
   if (counter == totalFrames) {
    exit();
  }
}
