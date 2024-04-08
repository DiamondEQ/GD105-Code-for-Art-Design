void setup() {
  size(800, 800);
  background(0); // Set initial background color to black
}

void draw() {
  // Calculate color based on mouse position
  float r = map(mouseX, 0, width, 0, 255);
  float g = map(mouseY, 0, height, 0, 255);
  float b = frameCount % 255; // Use frameCount to generate changing blue color
  
  // Set stroke color
  stroke(r, g, b);
  
  // Set stroke weight
  strokeWeight(10);
  
  // Draw a line at the mouse position
  if (mousePressed) {
    float previousX = pmouseX; // Previous mouse X position
    float previousY = pmouseY; // Previous mouse Y position
    float currentX = mouseX;   // Current mouse X position
    float currentY = mouseY;   // Current mouse Y position
    line(previousX, previousY, currentX, currentY); // Draw a line between previous and current mouse position
  }
}
