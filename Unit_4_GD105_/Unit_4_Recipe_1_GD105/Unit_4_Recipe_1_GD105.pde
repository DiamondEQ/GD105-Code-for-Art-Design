// Declared the Array Lists to hold TextObject and Word objects
ArrayList<TextObject> texts; 
ArrayList<Word> wordBank; 

// My array of song lyrics from KENDRICK LAMAR - ALRIGHT, word by word
String[] lyrics = {
  "Alls", "my", "life", "I", "has", "to", "fight", "n****",
  "Alls", "my", "life", "I", "Hard", "times", "like", "yah",
  "Bad", "trips", "like", "yah", "Nazareth",
  "I'm", "f****d", "up,", "homie", "you", "f****d", "up",
  "But", "if", "God", "got", "us", "then", "we", "gon'", "be", "alright"
};

// Arranging columns and rows for the text boxes on the page
int cols = 10; 
int boxWidth = 80; 
int boxHeight = 30;
int spacingX = 10; 
int spacingY = 30; 

// Setup function - set canvas size, upload fonts, and init. the array of text and word 
void setup() {
  size(1200, 1000); 
  texts = new ArrayList<TextObject>(); 
  wordBank = new ArrayList<Word>();
  
  // Using math to calculate the width of the objects
  int totalWidth = cols * (boxWidth + spacingX) + spacingX;
  
  int xOffset = (width - totalWidth) / 2;
  int yOffset = spacingY + 100; 
  
  // Looping through the lyrics to get every word in the lyric to have its own box with the word up top
  for (String lyric : lyrics) {
    texts.add(new TextObject(lyric, xOffset, yOffset, boxWidth, boxHeight));
    xOffset += boxWidth + spacingX;
    // Making it go to the next row when this one is filled
    if (xOffset + boxWidth > width - spacingX) {
      xOffset = (width - totalWidth) / 2;
      yOffset += boxHeight + spacingY;
    }
  }
  
  // Making border for wordbank
  int bankWidth = totalWidth + 40; 
  int bankHeight = 150; 
  int bankX = (width - bankWidth) / 2;
  int bankY = height / 2 - bankHeight / 2 + 100; 
  
  // Creating a new instance for every lyric in lyrics
  for (int i = 0; i < lyrics.length; i++) {
    wordBank.add(new Word(lyrics[i], bankX + 30 + (i % cols) * (boxWidth + spacingX), bankY + 10 + (i / cols) * (boxHeight + spacingY)));
  }
}

// Draw function - background and custom font added with text
void draw() {  
  background(0);

  textSize(30); // Setting text size
  textAlign(CENTER, TOP); // Aligning text
  fill(255); // Setting fill color to white
  text("K-Dot AKA Kendrick Lamar - Alright", width/2, 50); // Displaying title
  
  // Loop through to display all text and word bank objects
  for (TextObject text : texts) {
    text.display();
  }
  
  for (Word word : wordBank) {
    word.display();
  }
  
  // Making the boundary box
  stroke(255); 
  noFill();
  rect(115, 500, 1000, 450); 
}

// Using mousePressed to check if a word is clicked in the word bank 
// and to move them in the word bank
void mousePressed() {
  boolean wordClicked = false; 
  for (Word word : wordBank) {
    if (word.contains(mouseX, mouseY)) {
      word.dragging = true; 
      word.offsetX = mouseX - word.x;
      word.offsetY = mouseY - word.y;
      wordClicked = true; 
      break; // Exit the loop after a word is clicked
    }
  }
 
  if (!wordClicked) {
    for (Word word : wordBank) {
      word.dragging = false; // Setting dragging to false for all words if no word is clicked
    }
  }
}

void mouseReleased() {
  // Reset the drag to false for all words after the mouse is released
  for (Word word : wordBank) {
    word.dragging = false;
  }
}

void mouseDragged() {
  // Updating positions of words if the word is being dragged
  for (Word word : wordBank) {
    if (word.dragging) {
      word.x = mouseX - word.offsetX; 
      word.y = mouseY - word.offsetY; 
    }
  }
}

// TextObject class creation
class TextObject {
  String text;
  float x, y;
  int w, h;
  
  // Constructor to initialize TextObject
  TextObject(String text, float x, float y, int w, int h) {
    this.text = text;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  // Method to display text object
  void display() {
    noFill(); // No fill for the rectangle
    stroke(255); // Setting stroke color to white
    strokeWeight(2); // Setting stroke weight
    
    // Drawing rectangle around text
    rect(x, y, w, h); 
    
    // Displaying text inside the rectangle
    textAlign(CENTER, BOTTOM); // Aligning text
    textSize(16); // Setting text size
    fill(255); // Setting fill color to white
    text(text, x + w / 2, y - 5); // Displaying regular text
  }
}

// Class for interactive word objects
class Word {
  String word;
  float x, y;
  boolean dragging;
  float offsetX, offsetY;
  
  // Constructor to initialize Word
  Word(String word, float x, float y) {
    this.word = word;
    this.x = x;
    this.y = y;
    this.dragging = false;
  }
  
  // Function to display word object
  void display() {
    textAlign(CENTER, CENTER);
    textSize(16); 
    fill(255); 
    text(word, x, y); 
  }
  
  // Method to see if a point is within the word's boundary box
  boolean contains(float px, float py) {
    float d = dist(px, py, x, y); 
    return (d < 15);
  }
}
