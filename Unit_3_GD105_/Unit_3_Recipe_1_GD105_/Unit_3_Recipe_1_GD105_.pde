int year;
int month;
int day;

void setup() {
  size(400, 400);
  textAlign(CENTER, CENTER);
  textSize(32);
}

void draw() {
  background(255);
  
  // Get current date and time
  year = year();
  month = month();
  day = day();
  
  // Convert month to Morse code
  String morseMonth = convertToMorse(month);
  
  // Convert day and year to binary code
  String binaryDay = Integer.toBinaryString(day);
  String binaryYear = Integer.toBinaryString(year);
  
  // Display the calendar
 fill(0);
  text("Month: " + morseMonth, width/2, height/4);
  text("Day: " + binaryDay, width/2, height/2);
  text("Year: " + binaryYear, width/2, height*3/4);
}

// Function to convert month number to Morse code
String convertToMorse(int month) {
  String[] morseCode = {
    ".--- .- -. ..- .- .-. -.--", "..-. . -... .-. ..- .- .-. -.--", "-- .- .-. -.-. ....", ".- .--. .-. .. .-..", "-- .- -.--", ".--- ..- -. .", ".--- ..- .-.. -.--", ".- ..- --. ..- ... -", "... . .--. - . -- -... . .-.", "--- -.-. - --- -... . .-.", "-. --- ...- . -- -... . .-.", "-.. . -.-. . -- -... . .-."};
  
  // Check if month is within range
  if (month >= 1 && month <= 12) {
    return morseCode[month - 1]; // Adjust for array index
  } else {
    return "Invalid month";
  }
}
