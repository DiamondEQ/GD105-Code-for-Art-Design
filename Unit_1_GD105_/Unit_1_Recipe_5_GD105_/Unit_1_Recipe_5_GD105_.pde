int numStars = 500; // Number of stars
Star[] stars = new Star[numStars];

void setup() {
  size(800, 800);

  // Initialize stars
  for (int i = 0; i < numStars; i++) {
    stars[i] = new Star(random(width), random(height));
  }
}

void draw() {
  background(0);

  // Update and display stars
  for (int i = 0; i < numStars; i++) {
    stars[i].update();
    stars[i].display();
  }

  // Draw piano keys
  drawPiano(width / 2, height / 2);
}

void drawPiano(float x, float y) {
  float keyWidth = 30;
  float keyHeight = 200;
  float blackKeyWidth = 20;
  float blackKeyHeight = 120;
  int numKeys = 7; // Number of keys

  // Draw white keys
  for (int i = 0; i < numKeys; i++) {
    fill(255);
    rect(x - (numKeys / 2 - i) * keyWidth, y, keyWidth, keyHeight);
  }

  // Draw black keys
  for (int i = 0; i < numKeys - 1; i++) {
    if (i != 2) { // Skip black key after the third white key
      fill(0);
      rect(x - (numKeys / 2 - i - 0.5) * keyWidth, y, blackKeyWidth, blackKeyHeight);
    }
  }
}

class Star {
  float x, y;
  float speed;

  Star(float x, float y) {
    this.x = x;
    this.y = y;
    speed = random(1, 3);
  }

  void update() {
    y += speed;
    if (y > height) {
      y = 0;
      x = random(width);
    }
  }

  void display() {
    noStroke();
    fill(255);
    ellipse(x, y, 2, 2);

    if (frameCount == 0) {
      save("output.png");
    }
  }
}
