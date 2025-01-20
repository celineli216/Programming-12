class FBridge extends FGameObject {
  //bridge doesn't reset for hte bottom lava
  float bridgeOriginalX, bridgeOriginalY;
  FBridge(float x, float y) {
    super(gridSize, gridSize);
    setPosition(x, y);
    bridgeOriginalX = x;
    bridgeOriginalY = y;
    setName("bridge");
    setFillColor(bridgeBrown);
    setStatic(true);
  }

  void act() {
    if (isTouching("player")  ) {

      setStatic(false);
      setSensor(true);
    }
  }
  void resetToOriginal() {
    setPosition(bridgeOriginalX, bridgeOriginalY);
    setStatic(true);      // Make it static again
    setSensor(false);     // Make it solid again
  }
}
