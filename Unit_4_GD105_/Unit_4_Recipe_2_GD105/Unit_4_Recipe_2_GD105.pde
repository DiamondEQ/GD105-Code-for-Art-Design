// Array that stores team names, seasons, and Kobe's stats
String[] teams;
String[] seasons;
int[] pointsPerGame;
int[] reboundsPerGame;
int[] assistsPerGame;

// Variables that store max and min stats by Kobe
int maxPPG, minPPG;
int maxRPG, minRPG;
int maxAPG, minAPG;

// Setting up other graph values
int rectWidth;
int xOffset = 150;
int yOffset = 150;
int graphWidth = 700;
int graphHeight = 700;


// For my image of Kobe Bryant at the top of the screen
PImage kobeImage;

// Init table to hold data
Table table;

int hoveredIndex = -1;

// Setting up function with setting up canvas size, 
// loading the image of Kobe
void setup() {
  size(1000, 1000); 
  kobeImage = loadImage("Kobe Bryant.jpg"); 
  kobeImage.resize(150, 150); // Resizing image to fit screen
  
  table = loadTable("Kobe's Stats.csv", "header"); // Loading Kobe's CSV data from my CSV file
  // Getting the values from my CSV file to use and init.'ing arrays for the data 
  int rowCount = table.getRowCount(); 
  teams = new String[rowCount]; 
  seasons = new String[rowCount]; 
  pointsPerGame = new int[rowCount]; 
  reboundsPerGame = new int[rowCount]; 
  assistsPerGame = new int[rowCount]; 
  
  // Putting the data from my table onto the arrays
  for (int i = 0; i < rowCount; i++) {
    TableRow row = table.getRow(i);
    teams[i] = row.getString("Tm");
    seasons[i] = row.getString("Season");
    pointsPerGame[i] = int(row.getFloat("PTS"));
    reboundsPerGame[i] = int(row.getFloat("TRB"));
    assistsPerGame[i] = int(row.getFloat("AST"));
  }
  
  maxPPG = max(pointsPerGame);
  minPPG = min(pointsPerGame);
  maxRPG = max(reboundsPerGame);
  minRPG = min(reboundsPerGame);
  maxAPG = max(assistsPerGame);
  minAPG = min(assistsPerGame);
  rectWidth = graphWidth / pointsPerGame.length; // Calculating width of each rectangle in the graph
}

// Drawing the background, displaying the graph, text, and image of Kobe
void draw() {
  background(255); 
  
  image(kobeImage, width/2 - kobeImage.width/2, yOffset - kobeImage.height - 12);
  
  Graph graph = new Graph(teams, seasons, pointsPerGame, reboundsPerGame, assistsPerGame);
  graph.drawGraph();
  
  handleHoverEffect();
  
  strokeWeight(2);
  stroke(0);
  line(xOffset - 10, height - yOffset, xOffset + graphWidth + 10, height - yOffset); // X-axis
  line(xOffset, height - yOffset + 10, xOffset, height - yOffset - graphHeight - 10); // Y-axis
  
  textAlign(CENTER, TOP);
  fill(0);
  textSize(11);
  text("KOBE BRYANT'S CAREER STATS", width / 3, yOffset / 3 + 30);
}

// Custom hover effect function that checks what bar it is hovered over and displays the data
void handleHoverEffect() {
  for (int i = 0; i < pointsPerGame.length; i++) {
    float x = map(i, 0, pointsPerGame.length - 1, xOffset, xOffset + graphWidth);
    float hPPG = map(pointsPerGame[i], minPPG, maxPPG, 0, graphHeight);
    float hRPG = map(reboundsPerGame[i], minRPG, maxRPG, 0, graphHeight);
    float hAPG = map(assistsPerGame[i], minAPG, maxAPG, 0, graphHeight);
    
    if (mouseX > x && mouseX < x + rectWidth && 
        mouseY > height - yOffset - hPPG && mouseY < height - yOffset) {
      hoveredIndex = i; 
      displayHoverInfo(i); 
      return;
    } else if (mouseX > x + rectWidth / 3 && mouseX < x + 2 * rectWidth / 3 &&
               mouseY > height - yOffset - hRPG && mouseY < height - yOffset) {
      hoveredIndex = i;
      displayHoverInfo(i);
      return;
    } else if (mouseX > x + 2 * rectWidth / 3 && mouseX < x + rectWidth &&
               mouseY > height - yOffset - hAPG && mouseY < height - yOffset) {
      hoveredIndex = i;
      displayHoverInfo(i);
      return;
    }
  }
  
  hoveredIndex = -1; 
}

// Function to display the info when you hover over a bar
void displayHoverInfo(int index) {
  String season = seasons[index];
  String team = teams[index];
  int ppg = pointsPerGame[index];
  int rpg = reboundsPerGame[index];
  int apg = assistsPerGame[index];
  
  fill(255, 220);
  rect(mouseX + 10, mouseY - 90, 200, 100);
  
  fill(0);
  textAlign(LEFT, TOP);
  textSize(14);
  text("Season: " + season, mouseX + 15, mouseY - 85);
  text("Team: " + team, mouseX + 15, mouseY - 65);
  text("PPG: " + ppg, mouseX + 15, mouseY - 45);
  text("RPG: " + rpg, mouseX + 15, mouseY - 25);
  text("APG: " + apg, mouseX + 15, mouseY - 5);
}

// Creating Graph class and the constructor to init the graph data 
class Graph {
  String[] teams;
  String[] seasons;
  int[] ppgData;
  int[] rpgData;
  int[] apgData;
  
  Graph(String[] teams, String[] seasons, int[] ppgData, int[] rpgData, int[] apgData) {
    this.teams = teams;
    this.seasons = seasons;
    this.ppgData = ppgData;
    this.rpgData = rpgData;
    this.apgData = apgData;
  }
  
  // Drawing the graph on screen
  void drawGraph() {
    for (int i = 0; i < ppgData.length; i++) {
      float x = map(i, 0, ppgData.length - 1, xOffset, xOffset + graphWidth);
      float hPPG = map(ppgData[i], minPPG, maxPPG, 0, graphHeight);
      float hRPG = map(rpgData[i], minRPG, maxRPG, 0, graphHeight);
      float hAPG = map(apgData[i], minAPG, maxAPG, 0, graphHeight);
      color teamColor = getColorForTeam(teams[i]);
      
      fill(teamColor);
      rect(x, height - yOffset - hPPG, rectWidth / 3, hPPG);
      fill(253, 185, 39);
      rect(x + rectWidth / 3, height - yOffset - hRPG, rectWidth / 3, hRPG);
      fill(255, 255, 255);
      rect(x + 2 * rectWidth / 3, height - yOffset - hAPG, rectWidth / 3, hAPG);
      
      textAlign(CENTER, BOTTOM);
      fill(0);
      text(ppgData[i], x + rectWidth / 6.25, height - yOffset - hPPG - 1);
      text(rpgData[i], x + rectWidth /2, height - yOffset - hRPG - 1);
      text(apgData[i], x + 5 * rectWidth / 5.75, height - yOffset - hAPG - 1);
    }
    
    // Season label (rotated)
    textAlign(CENTER, TOP);
    for (int i = 0; i < ppgData.length; i++) {
      float x = map(i, 0, ppgData.length - 1, xOffset, xOffset + graphWidth);
      pushMatrix();
      translate(x + rectWidth / 2, height - yOffset + 15);
      rotate(-HALF_PI);
      text(seasons[i], -40, 0);
      popMatrix();
    }
  }
  
  // Change the bar color based on the team Kobe was on at the time for his career
  color getColorForTeam(String team) {
    color teamColor;
    switch (team) {
      case "LAL":
        teamColor = color(85, 37, 130); // Lakers' purple
        break;
      default:
        teamColor = color(85, 37, 130);
        break;
    }
    return teamColor;
  }
}
