// My Highest rounds on all the Black Ops 3 Zombies maps
String[] maps = {
  "Der Eisendrache", "Revelations", "Kino Der Toten", "The Giant",
  "Shadows of Evil", "Origins", "Gorod Krovi", "Nacht Der Untoten",
  "Verruckt", "Zetsubou no Shima", "Shangri-La", "Shi no Numa",
  "Moon", "Ascension"
};
int[] rounds = {95, 79, 55, 38, 26, 24, 22, 21, 20, 17, 17, 15, 14, 12};

BarChart chart;

void setup() {
  size(800, 600);
  chart = new BarChart(maps, rounds);
  chart.setMargin(50, 50, 50, 150); // Adjusted bottom margin for rotated labels
  chart.setBarColor(color(255, 165, 0));
  chart.setTextColor(color(255));
}

void draw() {
  background(0);
  textSize(24);
  fill(255);
  textAlign(CENTER, CENTER);
  text("My Highest Rounds on All the Black Ops 3 Maps", width / 2, 30);
  chart.display();
}

class BarChart {
  String[] labels;
  int[] values;
  int marginTop, marginBottom, marginLeft, marginRight;
  int barColor, textColor;
  float maxValue;
  
  BarChart(String[] labels, int[] values) {
    this.labels = labels;
    this.values = values;
    this.maxValue = max(values);
    this.marginTop = this.marginBottom = this.marginLeft = this.marginRight = 20;
    this.barColor = color(0);
    this.textColor = color(0);
  }
  
  void setMargin(int top, int bottom, int left, int right) {
    this.marginTop = top;
    this.marginBottom = bottom;
    this.marginLeft = left;
    this.marginRight = right;
  }
  
  void setBarColor(int c) {
    this.barColor = c;
  }
  
  void setTextColor(int c) {
    this.textColor = c;
  }
  
  void display() {
    int chartWidth = width - marginLeft - marginRight;
    int chartHeight = height - marginTop - marginBottom;
    float barWidth = chartWidth / (float) labels.length;
    
    // Draw grid lines
    stroke(200);
    for (int i = 0; i <= 10; i++) {
      float y = marginTop + i * (chartHeight / 10.0);
      line(marginLeft, y, width - marginRight, y);
      fill(textColor);
      textAlign(RIGHT, CENTER);
      text(int(maxValue * (1 - i / 10.0)), marginLeft - 10, y);
    }
    noStroke();
    
    textSize(12);
    fill(textColor);
    textAlign(CENTER, CENTER);
    
    for (int i = 0; i < labels.length; i++) {
      float x = marginLeft + i * barWidth;
      float y = marginTop + chartHeight;
      float barHeight = map(values[i], 0, maxValue, 0, chartHeight);
      
      // Highlight bar on hover
      if (mouseX > x && mouseX < x + barWidth * 0.8 && mouseY < y && mouseY > y - barHeight) {
        fill(255, 0, 0);
        textSize(14);
        text(values[i], x + barWidth * 0.4, y - barHeight - 15);
      } else {
        fill(barColor);
      }
      
      rect(x, y - barHeight, barWidth * 0.8, barHeight);
      
      fill(textColor);
      pushMatrix();
      translate(x + barWidth * 0.4, y + -30);
      rotate(PI / 2); // Rotate text by 45 degrees
      text(labels[i], 0, 0);
      popMatrix();
    }
    
    // Axis labels
    textAlign(CENTER);
    text("Maps", width / 2, height - 10);
    pushMatrix();
    translate(10, height / 2);
    rotate(-PI / 2);
    text("Highest Rounds", 0, 0);
    popMatrix();
  }
}
