void game(){
    background(blue);
   world.draw();
  world.step();
  handlePlayerInput();
  handlePlayerInput2();
  checkIfGrounded();
  checkIfGrounded2();
  handleBallBounce();

  handleGreenScoring();
  handleWhiteScoring();
  fill(255);
  textSize(50);
  text(whiteScore, 200, 100);
  fill(green);
  text(greenScore, 600, 100);
  text(ballBounce, 400, 100);
  text((int)ball.getY(), 400, 300);
  text((int)ball.getX(), 500, 300);
}
