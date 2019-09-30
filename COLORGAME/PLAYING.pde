void playing() {
timer = s;
  background(255);

  colorMode(RGB);
  noStroke();
  fill(0);
  rect(400, 0, 400, 600);
  textSize(30);
  
  fill (#434343);
  strokeWeight (15);
  line(400,0,400,600);
  image (checkmark,120,400);
  image (xmark,520,415);
  fill(0);
  textSize(40);
  text ("TRUE", 190,50);
  fill (255);
  text ("FALSE", 600,49);
  fill(255);
  stroke(#E5E3E3);
  strokeWeight(5);
  rect(200,150,400,200);
  //fill(255);
  //text("False", 500, 100);
  //fill(0);
  //text("True", 100, 100);
  fill(#E5E3E3);
  rect(360,90,80,60);
  fill(255);
  textSize(15);
  text("Points: " + score, 400, 135);
  text("Timer: " + timer/2,400,100);

  if (score>=10) {
    s = s + 2;
  }

  if (score>=30) {
    mode = 3;
  }



  textSize(s);
  s = s + 1;
  if (s>=120) 
    mode = 3;

  fill(colors[randomcolors]);
  text(words[randomwords], 400, 235);
}
