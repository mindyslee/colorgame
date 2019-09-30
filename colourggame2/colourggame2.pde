//visible timer
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer song1;



color red = #EA4040;
color yellow = #FFF80A;    
color orange = #FFB20A; //not using
color green = #9CFF0A;
color blue = #0AFFDC;
color purple = #C90AFF;

PImage checkmark;
PImage xmark;

int i, mode, score, randomcolors, randomwords, s, randomizer, samecolor;
int highscore;
int timer = s;
PImage[] pictures;
int currentPic = 0;
String[] words;
color[] colors;
boolean reset;

void setup() {
  mode = 1;
  size(800, 600);

  minim = new Minim(this);
  song1 = minim.loadFile("ColorSwitch.mp3"); 

  i = 0;
  score = 0;
  randomizer = (int) random(0, 100);
  textAlign(CENTER);
  reset = true;
  colors = new color[5];
  words = new String[5];
  samecolor = (int) random(0, 5);
  pictures = new PImage[29];
  while (i < 29) {
    pictures[i]= loadImage("frame_"+i+"_delay-0.02s.gif");
    {
      i = i + 1;
    }
  }

  colors[0] = #EA4040;
  colors[1] = #9CFF0A;
  colors[2] = #0AFFDC;
  colors[3] = #FFF80A;
  colors[4] = #C90AFF; //cyan = purple

  words[0] = "Red";
  words[1] = "Green";
  words[2] = "Blue";
  words[3] = "Yellow";
  words[4] = "Purple";

  randomcolors = int(random(0, 5));
  randomwords  = int(random(0, 5));

  checkmark = loadImage("checkmark.png");
  checkmark.resize(175, 175);
  xmark = loadImage ("xmark.png");
  xmark.resize(135, 135);
}


void draw() {
  
   if(song1.isPlaying() == false){
    song1.play();
  }
  
  println(mouseX, mouseY);

  fill(colors[randomcolors]);
  text(words[randomwords], 400, 235);

  if (mode == 1) {
    intro();
  } else if (mode == 2) {
    playing();
  } else if (mode == 3) {
    gameover();
  } else {
    background(255, 0, 0);
  }
  if (mouseX > 0 && mouseX < 400 && mouseY> 0 && mouseY < 600 && mode == 2) {
    image (checkmark, 110, 390, 200, 200);
  }
  if (mouseX > 400 && mouseX < 800 && mouseY> 0 && mouseY < 600 && mode == 2) {
    image (xmark, 510, 415, 154.3, 154.3);
  }
}
