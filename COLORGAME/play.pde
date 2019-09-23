void play () {
  background (#E5E3E3);
  color (#434343);
  strokeWeight (15);
  line(400,0,400,600);
  image (checkmark,120,400);
  image (xmark,520,415);
  fill(0);
  textSize(40);
  text ("TRUE", 190,50);
  text ("FALSE", 600,49);
  fill(255);
  strokeWeight(5);
  rect(200,150,400,200);
}
