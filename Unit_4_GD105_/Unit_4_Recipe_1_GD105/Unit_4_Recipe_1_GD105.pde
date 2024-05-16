// Declared the Array Lists to hold TextObject and Word objects
ArrayList<TextObject> texts;
ArrayList<Word> wordBank;

PFont PoppinsSemiBoldItalic; // Declare a font variable

// My array of song lyrics from Kendrick Lamar - Swimming Pools (Drank)
String[][] verses = {
  {
    "Now", "I", "done", "grew", "up", "'round", "some", "people", "livin'", "their", "life", "in", "bottles,",
    "Granddaddy", "had", "the", "golden", "flask,",
    "Backstroke", "every", "day", "in", "Chicago,",
    "Some", "people", "like", "the", "way", "it", "feels,",
    "Some", "people", "wanna", "kill", "their", "sorrows,",
    "Some", "people", "wanna", "fit", "in", "with", "the", "popular,", "that", "was", "my", "problem."
  },
  {
    "I", "was", "in", "the", "dark", "room,", "loud", "tunes,", "lookin'", "to", "make", "a", "vow", "soon,",
    "That", "I'ma", "get", "fucked", "up,", "fillin'", "up", "my", "cup,", "I", "see", "the", "crowd", "mood",
    "Changin'", "by", "the", "minute", "and", "the", "record", "on", "repeat,",
    "Took", "a", "sip,", "then", "another", "sip,", "then", "somebody", "said", "to", "me,"
  },
  {
    "N****", "why", "you", "babysittin'", "only", "two", "or", "three", "shots?",
    "I'ma", "show", "you", "how", "to", "turn", "it", "up", "a", "notch,",
    "First", "you", "get", "a", "swimming", "pool", "full", "of", "liquor", "then", "you", "dive", "in", "it,",
    "Pool", "full", "of", "liquor", "then", "you", "dive", "in", "it."
  },
  {
    "I", "wave", "a", "few", "bottles,", "then", "I", "watch", "'em", "all", "flock,",
    "All", "the", "girls", "wanna", "play", "Baywatch,",
    "I", "got", "a", "swimming", "pool", "full", "of", "liquor", "and", "they", "dive", "in", "it,",
    "Po-pool", "full", "of", "liquor", "I'ma", "dive", "in", "it."
  }
};

// Select a random verse
String[] lyrics = verses[int(random(verses.length))];

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

  // Load the custom font
  PoppinsSemiBoldItalic = createFont("Poppins-SemiBoldItalic.ttf", 16); // Make sure the font file is in the "data" folder

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

  // Creating a new instance for every lyric in lyrics with random positions
  for (int i = 0; i < lyrics.length; i++) {
    float randomX = random(bankX + 30, bankX + bankWidth - 30 - boxWidth);
    float randomY = random(bankY + 10, bankY + bankHeight - 10 - boxHeight);
    wordBank.add(new Word(lyrics[i], randomX, randomY));
  }
}

// Draw function - background and custom font added with text
void draw() {
  background(0);

  textFont(PoppinsSemiBoldItalic); // Set the custom font
  textSize(30); // Setting text size
  textAlign(CENTER, TOP); // Aligning text
  fill(255); // Setting fill color to white
  text("K-Dot aka Kendrick Lamar - Swimming Pools (Drank)", width / 2, 50); // Displaying title

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
    // Only allow dragging if the word is not already placed correctly
    if (!word.placedCorrectly && word.contains(mouseX, mouseY)) {
      word.dragging = true;
      word.offsetX = mouseX - word.x;
      word.offsetY = mouseY - word.y;
      wordClicked = true;
      break;
    }
  }

  if (!wordClicked) {
    for (Word word : wordBank) {
      word.dragging = false;
    }
  }
}

void mouseReleased() {
  for (Word word : wordBank) {
    if (word.dragging) {
      // Check if the word is placed correctly
      for (TextObject text : texts) {
        if (dist(mouseX, mouseY, text.x + text.w / 2, text.y + text.h / 2) < text.w / 2 && text.text.equalsIgnoreCase(word.word)) {
          word.x = text.x + text.w / 2;
          word.y = text.y + text.h / 2;
          word.placedCorrectly = true; // Mark the word as placed correctly
          break;
        }
      }
      word.dragging = false;
    }
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
// Modify the Word class to include a boolean indicating whether the word is correctly placed
class Word {
  String word;
  float x, y;
  boolean dragging;
  boolean placedCorrectly; // New variable to track if the word is placed correctly
  float offsetX, offsetY;

  Word(String word, float x, float y) {
    this.word = word;
    this.x = x;
    this.y = y;
    this.dragging = false;
    this.placedCorrectly = false; // Initially, the word is not placed correctly
  }

  void display() {
    textFont(PoppinsSemiBoldItalic);
    textAlign(CENTER, CENTER);
    textSize(16);
    if (placedCorrectly) {
      fill(0, 255, 0); // If placed correctly, change color to green
    } else {
      fill(255); // Otherwise, keep it white
    }
    text(word, x, y);
  }

  boolean contains(float px, float py) {
    float d = dist(px, py, x, y);
    return (d < 15);
  }
}
