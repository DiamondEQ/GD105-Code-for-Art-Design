import processing.svg.*;

int cols, rows;
int scl = 25;
int w = 1056;
int h = 816;
int margin = 48; // Margin size

boolean[][] grid;

void setup() {
  size(1056, 816);
  background(255); // White background
  noFill();
  smooth();
  cols = (w - 2 * margin) / scl; // Adjusted cols and rows considering margin
  rows = (h - 2 * margin) / scl;
  grid = new boolean[cols][rows];
  generateMaze();
  drawMazeMandala();

  // Start the SVG file
  beginRecord(SVG, "MazeMandala.svg");

  // Draw the BasketBall Mandala
  drawMazeMandala();

  // End and save the SVG file
  endRecord();
}

void generateMaze() {
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      grid[i][j] = random(1) < 0.5;
    }
  }
}

void drawMazeMandala() {
  stroke(1);
  // Draw lines first
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      float x = margin + i * scl; // Adjusted x and y coordinates considering margin
      float y = margin + j * scl;
      if (grid[i][j]) {
        // Draw a line
        line(x, y, x + scl, y + scl);
      }
    }
  }
  // Draw squares after drawing lines
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      float x = margin + i * scl; // Adjusted x and y coordinates considering margin
      float y = margin + j * scl;
      if (!grid[i][j]) {
        // Draw a random square
        float choice = random(1);
        if (choice < 0.33) {
          // Draw a square
          rect(x, y, scl, scl);
        }
      }
    }
  }
}
