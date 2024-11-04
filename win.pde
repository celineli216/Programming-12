void win() {
  image(court, 400, 300, 800, 600);
  if (greenScore == 3) {
  
    fill(255);
    text("PLAYER 2 WINS", 400, 300);
  }

  if (whiteScore == 3) {
   
    fill(255);
    text("PLAYER 1 WINS", 400, 300);
  }
}
