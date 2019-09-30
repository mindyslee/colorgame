int hue;
void intro() {

  score = 0;
  s = 0;
  timer = s; //
  
  colorMode(HSB);
  fill(hue, 255, 255);
    if (i > 28) {
    i=0;
  }
  image(pictures[i], 0, 0, 800, 600); {    
    i = i + 1;
  }
  //background(0);
  noStroke();
  fill(red);
  ellipse(50,300,180,180);
  fill(green);
  ellipse(750,50,300,300);
  fill(yellow);
  ellipse(500,450,230,230);
  fill(255);
  textAlign(CENTER,CENTER);
  textSize(40);
  text("COLOUR GAME",400,250);
  textSize(20);
  //textSize(60);
  //text("CoLoR tHeOrY", 400, 300);
  fill(255);
  text("Start", 400, 550);

//

  hue = hue + 1;  
  if (hue > 255) {
    hue = 0;
  }
}
