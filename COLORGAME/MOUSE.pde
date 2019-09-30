void mouseReleased() {

s = timer;
    

  if (mode == 1) {
    if (mouseX>353 && mouseX<470 && mouseY>546 && mouseY<560) {
      mode = 2;
    }
    //} else if (mode == 3) { //
   // mode = 1; //
  } else if (mode == 2) {
    if (mouseX<400) {
      //human answered true
      if (randomcolors == randomwords) {
        score = score + 1;
        //timer = 60; //
        s = 0;
      } else {
        mode = 3;
      }
    } else { 
      if (randomcolors != randomwords) {
        //human answered false
        score = score + 1;
        //timer = 60;
        s = 0;
      } else {
        mode = 3;
      }
        
    }


    randomizer = (int) random(0, 100);
    if (randomizer < 50) {
      randomcolors = int(random(0, 5));
      randomwords =  randomcolors;
    } else {
      randomcolors = int(random(0, 5));
      randomwords =  int(random(0, 5));
    }
  } else if (mode == 3) {
    mode = 1;
    //things for mode 3
  }
  }
