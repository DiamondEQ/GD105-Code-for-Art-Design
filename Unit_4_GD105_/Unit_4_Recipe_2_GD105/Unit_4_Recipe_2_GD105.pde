PImage kobeImage;

class KobeStats {
  float ppg;
  float apg;
  float rpg;
  float fgPercentage;
  float ftPercentage;

  KobeStats(float ppg, float apg, float rpg, float fgPercentage, float ftPercentage) {
    this.ppg = ppg;
    this.apg = apg;
    this.rpg = rpg;
    this.fgPercentage = fgPercentage;
    this.ftPercentage = ftPercentage;
  }

  void display() {
    fill(253, 185, 39);
    textSize(20);
    textAlign(CENTER);
    text("Kobe Bryant 2005-2006 Season Stats", width/2, 30);

    textSize(16);
    textAlign(LEFT);
    text("Points per game (PPG): " + ppg, 50, 70);
    text("Assists per game (APG): " + apg, 50, 100);
    text("Rebounds per game (RPG): " + rpg, 50, 130);
    text("Field Goal Percentage (FG%): " + nf(fgPercentage, 0, 2) + "%", 50, 160);
    text("Free Throw Percentage (FT%): " + nf(ftPercentage, 0, 2) + "%", 50, 190);
  }

  void drawBarGraph() {
    float[] stats = {ppg, apg, rpg, fgPercentage, ftPercentage};
    String[] labels = {"PPG", "APG", "RPG", "FG%", "FT%"};
    float maxStat = max(stats);
    float barWidth = width / (stats.length * 2);
    float graphHeight = 100;

    for (int i = 0; i < stats.length; i++) {
      float barHeight = map(stats[i], 0, maxStat, 0, graphHeight);
      fill(253, 185, 39);
      rect((i * 2 + .5) * barWidth, height - barHeight - 20, barWidth, barHeight);

      fill(0);
      textAlign(CENTER);
      textSize(12);
      text(labels[i], (i * 2 + .5) * barWidth + barWidth / 2, height - 5);

      // Display the stats value on the bar
      textSize(14);
      text(nf(stats[i], 0, 2), (i * 2 + .5) * barWidth + barWidth / 2, height - barHeight - 25);
    }
  }
}

KobeStats kobeStats;

void setup() {
  size(550, 400);
  // Initialize Kobe's stats
  kobeStats = new KobeStats(35.4, 4.5, 5.3, 45.0, 85.0);
  kobeImage = loadImage("Kobe Bryant.jpg");
  kobeImage.resize(200, 200);
}

void draw() {
  background(85, 37, 130);
  image(kobeImage, 322, 43);
  kobeStats.display();
  kobeStats.drawBarGraph();
}
