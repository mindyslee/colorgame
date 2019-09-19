void gameover() {
  background(red);
  textSize (30);
  fill (255);
  text("GAME OVER", 400, 100);
  rect (50, 500, 100, 30);
  textSize (15);
  fill (0);
  text ("Restart game", 100, 515);

  textSize(15);  
  fill(255);
   
  text("Points: " + points, 50, 50);
  text("High Score: " + highscore, 67, 75);
  
  if (highscore <= points ){
   highscore = points;
  }
}
