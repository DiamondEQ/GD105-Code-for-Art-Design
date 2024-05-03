int binarySize = 4; // Number of bits to represent each digit
int binarySpacing = 10; // Spacing between each binary digit
int binaryDigitWidth = 20; // Width of each binary digit
int binaryDigitHeight = 60; // Height of each binary digit
int xOffset = 20; // X offset for the clock
int yOffset = 40; // Y offset for the clock

void setup() {
  size(400, 200);
}

void draw() {
  background(255);
  drawBinaryClock();
}

void drawBinaryClock() {
  int[] binaryHours = getBinaryArray(hour(), 5); // 5 bits for hours (0-23)
  int[] binaryMinutes = getBinaryArray(minute(), 6); // 6 bits for minutes (0-59)
  int[] binarySeconds = getBinaryArray(second(), 6); // 6 bits for seconds (0-59)
  
  drawBinaryDigits(binaryHours, xOffset, yOffset);
  drawBinaryDigits(binaryMinutes, xOffset + (binarySize + binarySpacing) * 6, yOffset);
  drawBinaryDigits(binarySeconds, xOffset + (binarySize + binarySpacing) * 12, yOffset);
}

void drawBinaryDigits(int[] binaryArray, int x, int y) {
  for (int i = 0; i < binaryArray.length; i++) {
    int bit = binaryArray[i];
    fill(bit == 1 ? 0 : 255); // Fill black for 1, white for 0
    rect(x + i * (binarySize + binarySpacing), y, binarySize, binaryDigitHeight);
  }
}

int[] getBinaryArray(int value, int size) {
  int[] binaryArray = new int[size];
  for (int i = size - 1; i >= 0; i--) {
    binaryArray[i] = value % 2;
    value /= 2;
  }
  return binaryArray;
}
