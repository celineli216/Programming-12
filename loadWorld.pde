//make stairs appear only if player defeats an enemy (setSensor(true) before enemy defeated and set false once enemy dies)
//stair falls when player steps on it like bridge
//make stairs as fancy terrain

void loadWorld(PImage img) {
  for (int y = 0; y < img.height; y++) {

    for (int x = 0; x < img.width; x++) {
      color c = img.get(x, y); // colour of current piel
      //color s = img.get(x, y+1); //colour below current pixel
      //color w = img.get(x-1, y); //colour west of current pixel
      //color e = img.get(x+1, y); //colour east of current pixel
      ////color n = img.get(x, y-1); //colour above current pixel
      FBox b = new FBox(gridSize, gridSize);
      b.setPosition(x*gridSize, y*gridSize);
      b.setStatic(true);
      b.setNoStroke();

      if (c == grassGreen) {
        b.attachImage(grass);
        b.setFillColor(grassGreen);
        b.setFriction(4);

        b.setName("grass");
        world.add(b);
      }
      //else if (c == dirtBrown) {
      //  b.setFillColor(dirtBrown);
      //  b.attachImage(dirt);
      //  b.setName("dirt");
      //  world.add(b);
      //} else if (c == trunkBrown) {
      //  b.setFillColor(trunkBrown);
      //  b.setName("tree trunk");
      //  b.attachImage(treeTrunk);
      //  b.setSensor(true); // puts it in the background
      //  world.add(b);
      //} else if (c == leafGreen1 ) { //middle
      //  b.setFillColor(leafGreen1);
      //  b.setName("leaf1");
      //  b.attachImage(treeTopC);
      //  b.setFriction(4);
      //  world.add(b);
      //} else if (c == leafGreen2 && w != leafGreen2  && e == leafGreen1) { //end
      //  b.setFillColor(leafGreen2);
      //  b.setName("leaf2");
      //  b.attachImage(treeTopW);
      //  b.setFriction(4);
      //  world.add(b);
      //} else if (c == leafGreen2 && w == leafGreen1 && e != leafGreen2) { //end
      //  b.setFillColor(leafGreen2);
      //  b.setName("leaf2");
      //  b.attachImage(treeTopE);
      //  b.setFriction(4);
      //  world.add(b);
      //} else if (c == leafGreen3 && s == trunkBrown) { //middle piece
      //  b.setFillColor(leafGreen3);
      //  b.setFriction(4);
      //  b.attachImage(treeTopM);
      //  b.setName("leaf3");
      //  world.add(b);
      //} else if (c == iceBlue) {
      //  b.setFillColor(iceBlue);
      //  b.setFriction(0);
      //  b.attachImage(ice);
      //  b.setName("ice");
      //  world.add(b);
      //  //traps
      //} else if (c == spikeGrey) {
      //  b.setFillColor(spikeGrey);
      //  b.setFriction(4);
      //  b.attachImage(spike);
      //  b.setName("spike");
      //  world.add(b);
      //  //fancy terrain
      //} else if (c == bridgeBrown ) {
      //  FBridge bridgePiece = new FBridge(x * gridSize, y * gridSize);
      //  bridgePiece.setRotatable(false);
      //  bridges.add(bridgePiece);
      //  bridgePiece.attachImage(bridge);
      //  terrain.add(bridgePiece);
      //  world.add(bridgePiece);
      //}
      ////enemies
      //else if ( c == goombaC) {
      //  FGoomba gmb = new FGoomba(x*gridSize, y*gridSize);
      //  enemies.add(gmb);
      //  world.add(gmb);
      //} else if ( c== wallC) {
      //  b.setFillColor(wallC);
      //  b.setFriction(4);
      //  b.setName("wall");
      //  world.add(b);
      //} 
      else if (c == trampolineBlue) {
        b.setFillColor(trampolineBlue);
        b.setFriction(0);
        b.setRestitution(3);
        b.attachImage(trampoline);
        b.setName("trampoline");
        world.add(b);
      } else if (c == lavaOrange || c == lava2) {
        FLava lav = new FLava(x*gridSize, y*gridSize);
        lava.add(lav);
        world.add(lav);
      }
      //else if (c == thwompC) {
      //  FThwomp thwomp = new FThwomp(x*gridSize, y*gridSize);
      //  enemies.add(thwomp);
      //  b.setFillColor(thwompC);
      //  world.add(thwomp);
      //} else if (c == hammerBroC) {
      //  hammerBro = new FHammerBro(x * gridSize, y * gridSize); // Assign to global variable
      //  enemies.add(hammerBro); // Add it to the enemies list
      //  b.setFillColor(hammerBroC);
      //  world.add(hammerBro);
      //} else if (c == hammerWallC) {
      //  b.setFillColor(hammerWallC);
      //  b.setName("hammerWall");
      //  b.attachImage(grass);
      //  b.setFriction(4);

      //  world.add(b);
      //} 
      else if (c == cobblestoneBlue) {
        b.setFillColor(cobblestoneBlue);
        b.setName("cobblestone");
        b.setFriction(4);
        b.attachImage(blueCobble);
        world.add(b);
      } else if (c == cobblestoneBlack) {
        b.setFillColor(cobblestoneBlack);
        b.setName("cobblestone Black");
        b.attachImage(blackCobble);
        world.add(b);
      } else if (c == cobblestoneWall) {
        b.setFillColor(cobblestoneWall);
        b.setName("cobblestoneWall");
        b.setFriction(4);
        world.add(b);
      } else if (c == underDirtC) {
        b.setFillColor(underDirtC);
        b.setName("underDirt");
        b.setFriction(4);
        b.attachImage(underDirt);
        world.add(b);
      } else if (c == underGrassC) {
        b.setFillColor(underGrassC);
        b.setName("underGrass");
        b.setFriction(4);
        b.attachImage(blueCobble);
        world.add(b);
      } else if (c == skullC) {
        b.setFillColor(skullC);
        b.setName("skull");
        b.setFriction(4);
        b.attachImage(skull);
        world.add(b);
      } else if (c == gemC) {
        b.setFillColor(gemC);
        b.setName("gem");
        b.setFriction(4);
        b.attachImage(brownGem);
        world.add(b);
      } else if (c == slimeC) {
        FSlime slime = new FSlime(x*gridSize, y* gridSize);
        slime.setFillColor(slimeC);
        slime.setName("slime");
        enemies.add(slime);
        world.add(slime);
      } else if (c == redDirtC) {
        b.setFillColor(redDirtC);
        b.setName("reddirt");
        b.attachImage(redDirt);
        world.add(b);
      }else if (c == skeletonC) { //skeleton block not loaded?? check colour
      FSkeleton skeleton = new FSkeleton(x*gridSize, y*gridSize);
      enemies.add(skeleton);
      world.add(skeleton);


      }
    }//=======================================
  }//=======================================
}//=======================================
