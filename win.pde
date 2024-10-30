void win(){
  background(0);
  image(court, 400, 300, 800, 600);
  if(greenScore == 3){
    text("PLAYER 2 WINS", 400, 300);
  }
    if(whiteScore == 3){
    text("PLAYER 1 WINS", 400, 300);
  }
}
