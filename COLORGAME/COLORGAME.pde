int mode;

int points;
int highscore;

color red = #EA4040;
color orange = #FFA908;
color yellow = #FFF80A;       
color green = #9CFF0A;
color blue = #0AFFDC;
color purple = #C90AFF;

PImage checkmark;
PImage xmark;

final int intro = 0;
final int play = 1;
final int gameover = 2;

color[]colors = {red, orange, yellow, green, blue, purple};
String[]words = {"red", "orange", "yellow", "green", "blue", "purple"};

int rng = int(random(0, 5));
int rng2 = int(random(0, 5));


void setup () {
  size (800, 600);
  mode = 0;
}
void draw() {
  if (mode == intro) {
    intro();
  } else if (mode == play) {
    play();
  } else if (mode == gameover) {
    gameover();
  } else {
    println("Mode error!");
  }
  checkmark = loadImage("checkmark.png");
  checkmark.resize(175, 175);
  xmark = loadImage ("xmark.png");
  xmark.resize(135, 135);

  if (dist(mouseX, mouseY, 207.5, 487.5 )<150&& mode == play) {
    image (checkmark, 110, 390, 200, 200);
  }
  if (dist(mouseX, mouseY, 587.5, 482.5 )<150&& mode == play) {
    image (xmark, 510, 415, 154.3, 154.3);
  }
}
void mouseReleased() {
  if (mode == intro) {
    mode = play;
  } else if (mode == play) {
    mode = gameover;
  } else if (mode == gameover) {
    mode = intro;
  } else {
    println("Mode error!");
  }
}
