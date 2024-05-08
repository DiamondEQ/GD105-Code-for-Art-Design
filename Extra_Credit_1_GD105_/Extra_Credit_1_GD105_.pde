import processing.svg.*;
void setup() {
  size(800, 800);
  smooth();
  
  // Start the SVG file
  beginRecord(SVG, "geometric_design.svg");
  
  // Draw the geometric design
  drawGeometricDesign();
  
  // End and save the SVG file
  endRecord();
}

void drawGeometricDesign() {
  background(255); // White background
  
  // Set stroke weight and color
  strokeWeight(2);
  stroke(0); // Black color
  
  // Draw the geometric shapes
  for (int i = 0; i < width; i += 50) {
    for (int j = 0; j < height; j += 50) {
      // Draw rectangles
      rect(i, j, 30, 30);
      
      // Draw circles
      ellipse(i + 15, j + 15, 20, 20);
      
      // Draw lines
      line(i,j , i + 130, j + 130);
      line(i + 130, j, i, j + 130);
    }
  }
}
