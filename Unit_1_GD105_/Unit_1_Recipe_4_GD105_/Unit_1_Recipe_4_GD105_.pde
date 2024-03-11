//a simple dot map that shows the "4 train" stops i use to get to school and back home
void setup() {
  size(1075, 500);
  background(255);
  drawMap();
}

void drawMap() {
  // Draw background
  background(255);

  // Draw stations
  drawStation(50, 300, "Kingsbridge Rd");
  drawStation(150, 300, "Fordham Rd");
  drawStation(250, 300, "183rd St");
  drawStation(350, 300, "Burnside Ave");
  drawStation(450, 300, "176th St");
  drawStation(550, 300, "Mt Eden Ave");
  drawStation(650, 300, "170th St");
  drawStation(750, 300, "167th St");
  drawStation(850, 300, "161st St - Yankee Stadium");
  drawStation(1000, 300, "149th St - Grand Concourse");


  // Draw line
  stroke(0);
  strokeWeight(5);
  line(50, 300, 2850, 300);
}

void drawStation(int x, int y, String name) {
  // Draw station circle
  fill(255);
  stroke(0);
  ellipse(x, y, 20, 20);

  // Draw station name
  textAlign(CENTER);
  textSize(12);
  fill(0);
  text(name, x, y + 25);

  // save the image
  if (frameCount == 1) {
    save("output.png");
  }
}
