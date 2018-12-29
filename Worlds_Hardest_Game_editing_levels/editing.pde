int arraySize = 1000;
float[] removecubex  = new float[arraySize];
float[] removecubey  = new float[arraySize];

float[] checkpointx  = new float[arraySize];
float[] checkpointy  = new float[arraySize];
float[] checkpointx2 = new float[arraySize];
float[] checkpointy2 = new float[arraySize];

float[] endx  = new float[arraySize];
float[] endy  = new float[arraySize];
float[] endx2 = new float[arraySize];
float[] endy2 = new float[arraySize];

float[] linex  = new float[arraySize];
float[] liney  = new float[arraySize];
float[] linex2 = new float[arraySize];
float[] liney2 = new float[arraySize];

float[] removecube2x  = new float[arraySize];
float[] removecube2y  = new float[arraySize];
float[] removecube2x2 = new float[arraySize];
float[] removecube2y2 = new float[arraySize];

float[] enemyx  = new float[19];
float[] enemyy  = new float[19];
float[] enemyx2 = new float[19];

float[] enemyxi  = new float[19];
float[] enemyyi  = new float[19];
float[] enemyxi2 = new float[19];

class editor {
  float blockType = 0;
  int clickedR = 0, clickedC = 0, clickedE = 0, clickedB = 0, clickedRC = 0, clickedEN = 0, clickedENI = 0;
  int clickCheck = 0;
  boolean pressed = false, pressedC = false, setup = false;
  editor() {
  }

  void rectG(float x, float y, float w, float h) {
    rect(floor(x) * 25, floor(y) * 25, w * 25, h * 25);
  }

  void render() {
    for (int i = 0; i <= clickedRC; i++) {
      fill(0, 187, 255);
      rectG(removecube2x[i], removecube2y[i], removecube2x2[i], removecube2y2[i]);
    }

    for (int i = 0; i <= clickedC; i++) {
      checkpoint(checkpointx[i], checkpointy[i], checkpointx2[i], checkpointy2[i]);
    }

    for (int i = 0; i <= clickedE; i++) {
      end(endx[i], endy[i], endx2[i], endy2[i]);
    }

    for (int i = 0; i <= clickedR; i++) {
      fill(0, 187, 255);
      rectG(removecubex[i], removecubey[i], 1, 1);
    }

    for (int i = 0; i <= clickedB; i++) {
      fill(0, 187, 255);
      lineG(linex[i], liney[i], linex2[i], liney2[i]);
    }

    for (int i = 0; i <= clickedEN; i++) {
      fill(0, 0, 255);
      ellipse(enemyx[i] * 25, enemyy[i] * 25, 15, 15);
      stroke(0);
      line(enemyx2[i] * 25, enemyy[i] * 25, enemyx2[i] * 25, enemyy[i] * 25);
    }
    for (int i = 0; i <= clickedENI; i++) {
      fill(0, 0, 255);
      ellipse(enemyxi[i] * 25, enemyyi[i] * 25, 15, 15);
      stroke(0);
      line(enemyxi2[i] * 25, enemyyi[i] * 25, enemyxi2[i] * 25, enemyyi[i] * 25);
    }
    stroke(121, 0, 0);
    fill(255, 0, 0);
    rect(px * 25, py * 25, 15, 15);
    fill(0);
    text(blockType, 10, 10);
  }

  void user() {
    if (keyCode == LEFT && !pressed && keyPressed && blockType > 0) {
      blockType--;
      pressed = true;
    } else if (keyCode == RIGHT && !pressed && keyPressed && blockType < 10) {
      blockType++;
      pressed = true;
    } else if (!keyPressed && pressed) {
      pressed = false;
    }

    if (mousePressed && blockType == 0 && !pressedC) {
      clickedR++;
      removecubex[clickedR] = float(mouseX / 25);
      removecubey[clickedR] = float(mouseY / 25);

      pressedC = true;
    } else if (clickCheck == 0 && !pressedC && mousePressed && blockType == 1) {
      clickedC++;
      checkpointx[clickedC] = float(mouseX / 25);
      checkpointy[clickedC] = float(mouseY / 25);
      checkpointx2[clickedC] = 1;
      checkpointy2[clickedC] = 1;
      clickCheck = 1;
      pressedC = true;
    } else if (clickCheck == 1 && !pressedC && mousePressed && blockType == 1) {
      checkpointx2[clickedC] = ((mouseX / 25) - checkpointx[clickedC]) + 1;
      checkpointy2[clickedC] = ((mouseY / 25) - checkpointy[clickedC]) + 1;
      clickCheck = 0;
      pressedC = true;
    } else if (clickCheck == 0 && !pressedC && mousePressed && blockType == 2) {
      clickedE++;
      endx[clickedE] = float(mouseX / 25);
      endy[clickedE] = float(mouseY / 25);
      endx2[clickedE] = 1;
      endy2[clickedE] = 1;
      clickCheck = 1;
      pressedC = true;
    } else if (clickCheck == 1 && !pressedC && mousePressed && blockType == 2) {
      endx2[clickedE] = ((mouseX / 25) - endx[clickedE]) + 1;
      endy2[clickedE] = ((mouseY / 25) - endy[clickedE]) + 1;
      clickCheck = 0;
      pressedC = true;
    } else if (clickCheck == 0 && !pressedC && mousePressed && blockType == 3) {
      clickedB++;
      linex[clickedB] = float(mouseX / 25);
      liney[clickedB] = float(mouseY / 25);
      linex2[clickedB] = linex[clickedB];
      liney2[clickedB] = liney[clickedB];
      clickCheck = 1;
      pressedC = true;
    } else if (clickCheck == 1 && !pressedC && mousePressed && blockType == 3) {
      linex2[clickedB] = mouseX / 25;
      liney2[clickedB] = mouseY / 25;
      clickCheck = 0;
      pressedC = true;
    } else if (clickCheck == 0 && !pressedC && mousePressed && blockType == 4) {
      clickedRC++;
      removecube2x[clickedRC] = float(mouseX / 25);
      removecube2y[clickedRC] = float(mouseY / 25);
      removecube2x2[clickedRC] = 1;
      removecube2y2[clickedRC] = 1;
      clickCheck = 1;
      pressedC = true;
    } else if (clickCheck == 1 && !pressedC && mousePressed && blockType == 4) {
      removecube2x2[clickedRC] = ((mouseX) / 25 - removecube2x[clickedRC]) + 1;
      removecube2y2[clickedRC] = ((mouseY) / 25 - removecube2y[clickedRC]) + 1;
      clickCheck = 0;
      pressedC = true;
    } else if (clickCheck == 0 && !pressedC && mousePressed && blockType == 5) {
      clickedEN++;
      enemyx[clickedEN] = float(mouseX / 25) + 0.5;
      enemyy[clickedEN] = float(mouseY / 25) + 0.5;
      clickCheck = 1;
      pressedC = true;
    } else if (clickCheck == 1 && !pressedC && mousePressed && blockType == 5) {
      enemyx2[clickedEN] = float(mouseX / 25) + 0.5;
      clickCheck = 0;
      pressedC = true;
    } else if (!pressedC && mousePressed && blockType == 6) {
      px = mouseX / 25;
      py = mouseY / 25;
      pressedC = true;
    } else if (clickCheck == 0 && !pressedC && mousePressed && blockType == 7) {
      clickedENI++;
      enemyxi[clickedENI] = float(mouseX / 25) + 0.5;
      enemyyi[clickedENI] = float(mouseY / 25) + 0.5;
      clickCheck = 1;
      pressedC = true;
    } else if (clickCheck == 1 && !pressedC && mousePressed && blockType == 7) {
      enemyxi2[clickedENI] = float(mouseX / 25) + 0.5;
      clickCheck = 0;
      pressedC = true;
    } else if (!mousePressed && pressedC) {
      pressedC = false;
    }
  }

  void playLevel() {
    if (!setup) {
      p = new player(px, py, 1);
      e   = new enemys(enemyx[0], enemyy[0], enemyx2[0], false);
      e2  = new enemys(enemyx[1], enemyy[1], enemyx2[1], false);
      e3  = new enemys(enemyx[2], enemyy[2], enemyx2[2], false);
      e4  = new enemys(enemyx[3], enemyy[3], enemyx2[3], false);
      e5  = new enemys(enemyx[4], enemyy[4], enemyx2[4], false);
      e6  = new enemys(enemyx[5], enemyy[5], enemyx2[5], false);
      e7  = new enemys(enemyx[6], enemyy[6], enemyx2[6], false);
      e8  = new enemys(enemyx[7], enemyy[7], enemyx2[7], false);
      e9  = new enemys(enemyx[8], enemyy[8], enemyx2[8], false);
      e10 = new enemys(enemyx[9], enemyy[9], enemyx2[9], false);
      e11 = new enemys(enemyx[10], enemyy[10], enemyx2[10], false);
      e12 = new enemys(enemyx[11], enemyy[11], enemyx2[11], false);
      e13 = new enemys(enemyx[12], enemyy[12], enemyx2[12], false);
      e14 = new enemys(enemyx[13], enemyy[13], enemyx2[13], false);
      e15 = new enemys(enemyx[14], enemyy[14], enemyx2[14], false);
      e16 = new enemys(enemyx[15], enemyy[15], enemyx2[15], false);
      e17 = new enemys(enemyx[16], enemyy[16], enemyx2[16], false);
      e18 = new enemys(enemyx[17], enemyy[17], enemyx2[17], false);
      e19 = new enemys(enemyx[18], enemyy[18], enemyx2[18], false);

      ei   = new enemys(enemyxi[0], enemyyi[0], enemyxi2[0], true);
      ei2  = new enemys(enemyxi[1], enemyyi[1], enemyxi2[1], true);
      ei3  = new enemys(enemyxi[2], enemyyi[2], enemyxi2[2], true);
      ei4  = new enemys(enemyxi[3], enemyyi[3], enemyxi2[3], true);
      ei5  = new enemys(enemyxi[4], enemyyi[4], enemyxi2[4], true);
      ei6  = new enemys(enemyxi[5], enemyyi[5], enemyxi2[5], true);
      ei7  = new enemys(enemyxi[6], enemyyi[6], enemyxi2[6], true);
      ei8  = new enemys(enemyxi[7], enemyyi[7], enemyxi2[7], true);
      ei9  = new enemys(enemyxi[8], enemyyi[8], enemyxi2[8], true);
      ei10 = new enemys(enemyxi[9], enemyyi[9], enemyxi2[9], true);
      ei11 = new enemys(enemyxi[10], enemyyi[10], enemyxi2[10], true);
      ei12 = new enemys(enemyxi[11], enemyyi[11], enemyxi2[11], true);
      ei13 = new enemys(enemyxi[12], enemyyi[12], enemyxi2[12], true);
      ei14 = new enemys(enemyxi[13], enemyyi[13], enemyxi2[13], true);
      ei15 = new enemys(enemyxi[14], enemyyi[14], enemyxi2[14], true);
      ei16 = new enemys(enemyxi[15], enemyyi[15], enemyxi2[15], true);
      ei17 = new enemys(enemyxi[16], enemyyi[16], enemyxi2[16], true);
      ei18 = new enemys(enemyxi[17], enemyyi[17], enemyxi2[17], true);
      setup = true;
    } else if (setup) {
      for (int i = 0; i <= clickedRC; i++) {
        fill(0, 187, 255);
        rectG(removecube2x[i], removecube2y[i], removecube2x2[i], removecube2y2[i]);
      }

      for (int i = 0; i <= clickedC; i++) {
        checkpoint(checkpointx[i], checkpointy[i], checkpointx2[i], checkpointy2[i]);
      }

      for (int i = 0; i <= clickedE; i++) {
        end(endx[i], endy[i], endx2[i], endy2[i]);
      }

      for (int i = 0; i <= clickedR; i++) {
        fill(0, 187, 255);
        rectG(removecubex[i], removecubey[i], 1, 1);
      }

      for (int i = 0; i <= clickedB; i++) {
        fill(0, 187, 255);
        lineG(linex[i], liney[i], linex2[i], liney2[i]);
      }

      e.move();
      e.render();
      e1.move();
      e1.render();
      e2.move();
      e2.render();
      e3.move();
      e3.render();
      e4.move();
      e4.render();
      e5.move();
      e5.render();
      e6.move();
      e6.render();
      e7.move();
      e7.render();
      e8.move();
      e8.render();
      e9.move();
      e9.render();
      e10.move();
      e10.render();
      e11.move();
      e11.render();
      e12.move();
      e12.render();
      e13.move();
      e13.render();
      e14.move();
      e14.render();
      e15.move();
      e15.render();
      e16.move();
      e16.render();
      e17.move();
      e17.render();
      e18.move();
      e18.render();
      e19.move();
      e19.render();

      ei.move();
      ei.render();
      ei2.move();
      ei2.render();
      ei3.move();
      ei3.render();
      ei4.move();
      ei4.render();
      ei5.move();
      ei5.render();
      ei6.move();
      ei6.render();
      ei7.move();
      ei7.render();
      ei8.move();
      ei8.render();
      ei9.move();
      ei9.render();
      ei10.move();
      ei10.render();
      ei11.move();
      ei11.render();
      ei12.move();
      ei12.render();
      ei13.move();
      ei13.render();
      ei14.move();
      ei14.render();
      ei15.move();
      ei15.render();
      ei16.move();
      ei16.render();
      ei17.move();
      ei17.render();
      ei18.move();
      ei18.render();
      ei19.move();
      ei19.render();

      p.movement();
      p.collision();
      p.render();
    }
  }
}
