int mode;

int points;
int highscore;

color red = #EA4040;
color orange = #FFA908;
color yellow = #FFF80A;       
color green = #9CFF0A;
color blue = #0AFFDC;
color purple = #C90AFF;

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
