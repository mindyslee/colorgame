void gameover() {
  background(red);
  noStroke();  
  fill(orange);
  ellipse(50, 300, 180, 180);
  fill(green);
  ellipse(750, 50, 300, 300);
  fill(yellow);
  ellipse(500, 450, 230, 230);

  strokeWeight(3);
  textSize (30);
  fill (255);
  text("GAME OVER", 400, 100);
  rect (350, 500, 100, 30);
  textSize (15);
  fill (0);
  text ("Restart game", 400, 510);
  textSize(15);  
  fill(255);

  text("Points: " + points, 400, 250);
  text("High Score: " + highscore, 400, 300);



  if (highscore <= points ) {
    highscore = points;
  }
}
