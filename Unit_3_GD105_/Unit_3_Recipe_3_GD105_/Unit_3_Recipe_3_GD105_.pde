int numLines = 100;
float[] offsets = new float[numLines];

void setup() {
  size(800, 600);
  background(255);
  smooth();
  for (int i = 0; i < numLines; i++) {
    offsets[i] = random(-50, 50);
  }
}

void draw() {
  background(255);
  drawMoiré();
  drawLightning();
}

void drawMoiré() {
  float spacing = width / (numLines - 1);
  stroke(0, 50);
  for (int i = 0; i < numLines; i++) {
    float x = i * spacing;
    line(x + offsets[i], 0, x - offsets[i], height);
  }
}

void drawLightning() {
  int startX = int(random(width));
  int startY = 0;
  int endX = startX;
  int endY = height;
  int segments = int(random(10, 30));
  strokeWeight(random(1, 3));
  stroke(random(150, 255), random(150, 255), random(255));
  for (int i = 0; i < segments; i++) {
    int midX = (startX + endX) / 2;
    int midY = (startY + endY) / 2;
    midX += int(random(-50, 50));
    midY += int(random(-10, 10));
    line(startX, startY, midX, midY);
    startX = midX;
    startY = midY;
  }
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    for (int i = 0; i < numLines; i++) {
      offsets[i] = random(-50, 50);
    }
  }
}
