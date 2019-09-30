
void gameover() {
  colorMode(HSB);
  background(red);
  noStroke();  
  fill(orange);
  ellipse(50, 300, 180, 180);
  fill(green);
  ellipse(750, 50, 300, 300);
  fill(yellow);
  ellipse(500, 450, 230, 230);
  fill(hue, 255, 255);
  textSize(60);
  text("GAME OVER", 400, 280);
  textSize(20);
  text("Points: " + score, 100, 50);
  text("High Score: " + highscore, 100, 75);

  if (highscore <= score ) {
    highscore = score;
  }
}
