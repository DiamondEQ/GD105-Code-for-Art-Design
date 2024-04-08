void setup() {
  size(800, 600);  // Set the size of the window
  noCursor();      // Hide the default mouse cursor
}

void draw() {
  background(255); // Set the background color to white
  
  // Draw the body of the mouse cursor
  fill(150);
  ellipse(mouseX, mouseY, 40, 40);
  
  // Draw the ears of the mouse cursor
  fill(100);
  ellipse(mouseX - 20, mouseY - 20, 20, 20);
  ellipse(mouseX + 20, mouseY - 20, 20, 20);
  
  // Draw the eyes of the mouse cursor
  fill(0);
  ellipse(mouseX - 10, mouseY - 5, 5, 5);
  ellipse(mouseX + 10, mouseY - 5, 5, 5);
  
  // Draw the nose of the mouse cursor
  fill(255, 0, 0);
  triangle(mouseX, mouseY + 5, mouseX - 5, mouseY + 15, mouseX + 5, mouseY + 15);
}
