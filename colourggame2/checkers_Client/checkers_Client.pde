import processing.net.*;
Client myClient;
String outgoing;
String incoming;
PImage red, black, white;
boolean turn = false;
boolean click = false;
boolean selected = false;
boolean shade = false;
boolean kill = false;

int checkerX, checkerY, checkerX2, checkerY2, rectX, rectY, enemyY, enemyX;

int[][]grid = {
  //{0, 1, 0, 1, 0, 1, 0, 1}, 
  //{1, 0, 1, 0, 1, 0, 1, 0}, 
  //{0, 1, 0, 1, 0, 1, 0, 1}, 
  //{1, 0, 1, 0, 1, 0, 1, 0}, 
  //{0, 1, 0, 1, 0, 1, 0, 1}, 
  //{1, 0, 1, 0, 1, 0, 1, 0}, 
  //{0, 1, 0, 1, 0, 1, 0, 1}, 
  //{1, 0, 1, 0, 1, 0, 1, 0}, 

  {4, 1, 4, 1, 4, 1, 4, 1}, 
  {1, 4, 1, 4, 1, 4, 1, 4}, 
  {4, 1, 4, 1, 4, 1, 4, 1}, 
  {3, 4, 3, 4, 3, 4, 3, 4}, 
  {4, 3, 4, 3, 4, 3, 4, 3}, 
  {2, 4, 2, 4, 2, 4, 2, 4}, 
  {4, 2, 4, 2, 4, 2, 4, 2}, 
  {2, 4, 2, 4, 2, 4, 2, 4}, 
};

void setup() {
  myClient = new Client(this, "127.0.0.1", 1234);

  red = loadImage("red.png");
  black = loadImage("black1.png");
  white = loadImage("white.png");
  black.resize(50, 50);
  red.resize(50, 50);
  white.resize(50, 50);
  //grid = new int[8][8];
  size(800, 800);
  outgoing = "";
  incoming = "";
}

void draw() {
  int y = 0;
  int x = 0;

  while ( y < 800) {
    if (shade == false) {
      fill(255);
      rect(x, y, 100, 100);

      shade = true;
    } else if (shade == true) {
      fill(0);
      rect(x, y, 100, 100);

      shade = false;
    }
    x = x + 100;
    if ( x > 800) {
      x = 0;
      y = y + 100;
    }
  }

  if (selected == true) {
    fill(125, 125, 0);
    rect(rectX*100, rectY*100, 100, 100);
  }

  int row = 0;
  int col = 0;
  while (row <8) {
    if (grid[row][col] ==1) image(black, col*100+25, row*100+25, 50, 50);
    if (grid[row][col] ==2) image(red, col*100+25, row*100+25, 50, 50);

    col++;
    if (col == 8) {
      col = 0;
      row++;
    }
  }
  //if (col < 3) {
  //  grid[row][col] = 1;
  //  row = row + 1;
  //} else  if (col > 5) {
  //  grid[row][col] = 2;
  //  row = row + 1;
  //}

  if (myClient.available() > 0) {
    incoming = myClient.readString();

    String CheckerXcolstring = incoming.substring(0, 1);
    String CheckerYrowstring = incoming.substring(2, 3);
    String Checker2Xcolstring = incoming.substring(4, 5);
    String Checker2Yrowstring = incoming.substring(6, 7);
    int CheckerY = int(CheckerYrowstring);
    int CheckerX = int(CheckerXcolstring);
    int Checker2Y = int(Checker2Yrowstring);
    int Checker2X = int(Checker2Xcolstring);
    grid[CheckerY][CheckerX] = 3;
    grid[Checker2Y][Checker2X] = 2;

    int EnemeY, EnemeX;
    println("trying to kill...");
    if (Checker2Y - CheckerY == 2 || Checker2Y - CheckerY == -2) {

      EnemeY = (CheckerY + Checker2Y)/2;
      EnemeX = (CheckerX + Checker2X)/2;
      println(grid[EnemeY][EnemeX]);
      if (grid[EnemeY][EnemeX] == 1) {
        grid[EnemeY][EnemeX] = 3;
        println("BRUH");
      }
    }
    turn = true;
  }
}

void mousePressed() {
  if (turn == true) {
    int col = mouseX/100;
    int row = mouseY/100; 
    if (grid[row][col] < 4 ) {
      if (!click) {
        if (grid[row][col] == 1) {
          checkerX = col;
          checkerY = row;
          rectX = col;
          rectY = row;
          click = true;
          selected = true;
        }
      } else if (click) {
        checkerX2 = col;
        checkerY2 = row;
        grid[checkerY][checkerX] = 3;
        grid[checkerY2][checkerX2] = 1;
        selected = false;
        click = false;
        turn = false;
        outgoing = checkerX +"," + checkerY + "," + checkerX2 + "," + checkerY2;
        myClient.write(outgoing);
      } else if (grid[row][col] == 4) {
      }
    }
    if (checkerY2 - checkerY == 2 || checkerY2 - checkerY == -2) {
      kill = true;
    }
    if (kill) {
      enemyY = (checkerY + checkerY2)/2;
      enemyX = (checkerX + checkerX2)/2;
      if (grid[enemyY][enemyX] == 2) {
        grid[enemyY][enemyX] =3;
      }
      turn = true;
    }
  }
}
