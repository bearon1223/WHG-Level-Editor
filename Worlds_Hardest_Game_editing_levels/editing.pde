float currentSpacing = 0;

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  currentSpacing += constrain(e, -1, 1);
}

class editor {
  float blockType = 0;
  int clickedR = 0, clickedC = 0, clickedE = 0, clickedB = 0, clickedRC = 0, clickedRE = 0;
  int clickedEN = 0, clickedENI = 0, clickedENU = 0, clickedENIU = 0;
  int clickCheck = 0;
  boolean pressed = false, pressedC = false, setup = false;
  editor() {
  }

  void rectG(float x, float y, float w, float h) {
    rect(floor(x) * 25, floor(y) * 25, w * 25, h * 25);
  }

  void render() {
    setup = false;
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
    for (int i = 0; i <= clickedENU; i++) {
      fill(0, 0, 255);
      ellipse(enemyxu[i] * 25, enemyyu[i] * 25, 15, 15);
      stroke(0);
      line(enemyxu[i] * 25, enemyyu2[i] * 25, enemyxu[i] * 25, enemyyu2[i] * 25);
    }
    for (int i = 0; i <= clickedENIU; i++) {
      fill(0, 0, 255);
      ellipse(enemyxui[i] * 25, enemyyui[i] * 25, 15, 15);
      stroke(0);
      line(enemyxui[i] * 25, enemyyui2[i] * 25, enemyxui[i] * 25, enemyyui2[i] * 25);
    }

    for (int i = 0; i <= clickedRE; i++) {
      translate(enemyrx[i] * 25, enemyry[i] * 25);
      for (int e = 0; e <= enemyry2[i] - enemyry[i]; e++) {
        ellipse(enemyrsp[i] * e, 0, 15, 15);
        ellipse(-enemyrsp[i] * e, 0, 15, 15);
        ellipse(0, enemyrsp[i] * e, 15, 15);
        ellipse(0, -enemyrsp[i] * e, 15, 15);
      } 
      translate(-(enemyrx[i] * 25), -(enemyry[i] * 25));
    }
    noStroke();
    fill(0, 187, 255);
    rect(0, 0, 25, 25);
    stroke(121, 0, 0);
    fill(255, 0, 0);
    rect(px * 25, py * 25, 15, 15);
    fill(0);
    if (blockType == 0) {
      text("Remove Square", 10, 10);
    } else if (blockType == 1) {
      text("Checkpoint", 10, 10);
    } else if (blockType == 2) {
      text("End", 10, 10);
    } else if (blockType == 3) {
      text("Border", 10, 10);
    } else if (blockType == 4) {
      text("remove Square 2 Click", 10, 10);
    } else if (blockType == 5) {
      text("Enemy to the right", 10, 10);
    } else if (blockType == 6) {
      text("Player Start", 10, 10);
    } else if (blockType == 7) {
      text("Enemy to the left", 10, 10);
    } else if (blockType == 8) {
      text("Enemy going Down", 10, 10);
    } else if (blockType == 9) {
      text("Enemy going Up", 10, 10);
    } else if (blockType == 10) {
      text("Pathed Enemy", 10, 10);
    } else {
      text("Error Type not found Type Chosen: " + blockType, 10, 10);
    }
  }

  void user() {
    if (keyCode == LEFT && !pressed && keyPressed && blockType > 0) {
      blockType--;
      pressed = true;
    } else if (keyCode == RIGHT && !pressed && keyPressed && blockType < 15) {
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
      px = mouseX / 25 + 0.2;
      py = mouseY / 25 + 0.2;
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
    } else if (clickCheck == 0 && !pressedC && mousePressed && blockType == 8) {
      clickedENU++;
      enemyxu[clickedENU] = float(mouseX / 25) + 0.5;
      enemyyu[clickedENU] = float(mouseY / 25) + 0.5;
      clickCheck = 1;
      pressedC = true;
    } else if (clickCheck == 1 && !pressedC && mousePressed && blockType == 8) {
      enemyyu2[clickedENU] = float(mouseY / 25) + 0.5;
      clickCheck = 0;
      pressedC = true;
    } else if (clickCheck == 0 && !pressedC && mousePressed && blockType == 9) {
      clickedENIU++;
      enemyxui[clickedENIU] = float(mouseX / 25) + 0.5;
      enemyyui[clickedENIU] = float(mouseY / 25) + 0.5;
      clickCheck = 1;
      pressedC = true;
    } else if (clickCheck == 1 && !pressedC && mousePressed && blockType == 9) {
      enemyyui2[clickedENIU] = float(mouseY / 25) + 0.5;
      clickCheck = 0;
      pressedC = true;
    }/* else if (clickCheck == 0 && !pressedC && mousePressed && blockType == 16) {
     clickedRE++;
     enemyrx[clickedRE] = float(mouseX / 25) + 0.5;
     enemyry[clickedRE] = float(mouseY / 25) + 0.5;
     clickCheck = 1;
     pressedC = true;
     } else if (clickCheck == 1 && !pressedC && mousePressed && blockType == 16) {
     enemyry2[clickedRE] = float(mouseY / 25) + 0.5;
     currentSpacing = 0;
     clickCheck = 2;
     pressedC = true;
     } else if (clickCheck == 2 && !pressedC && mousePressed && blockType == 16) {
     enemyrsp[clickedRE] = currentSpacing;
     clickCheck = 0;
     pressedC = true;
     //}*/
    else if (clickCheck == 0 && !pressedC && mousePressed && blockType == 10) {
      // clickedRC++;
      // removecube2x[clickedRC] = float(mouseX / 25);
      // removecube2y[clickedRC] = float(mouseY / 25);
      // removecube2x2[clickedRC] = 1;
      // removecube2y2[clickedRC] = 1;
      // clickCheck = 1;
      // pressedC = true;
      // } else if (clickCheck == 1 && !pressedC && mousePressed && blockType == 10) {÷
      // removecube2x2[clickedRC] = ((mouseX) / 25 - removecube2x[clickedRC]) + 1;
      // removecube2y2[clickedRC] = ((mouseY) / 25 - removecube2y[clickedRC]) + 1;
      // clickCheck = 0;
      // pressedC = true;
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

      eu = new enemyu(enemyxu[0], enemyyu[0], enemyyu2[0], false);
      eu1 = new enemyu(enemyxu[1], enemyyu[1], enemyyu2[1], false);
      eu2 = new enemyu(enemyxu[2], enemyyu[2], enemyyu2[2], false);
      eu3 = new enemyu(enemyxu[3], enemyyu[3], enemyyu2[3], false);
      eu4 = new enemyu(enemyxu[4], enemyyu[4], enemyyu2[4], false);
      eu5 = new enemyu(enemyxu[5], enemyyu[5], enemyyu2[5], false);
      eu6 = new enemyu(enemyxu[6], enemyyu[6], enemyyu2[6], false);
      eu7 = new enemyu(enemyxu[7], enemyyu[7], enemyyu2[7], false);
      eu8 = new enemyu(enemyxu[8], enemyyu[8], enemyyu2[8], false);
      eu9 = new enemyu(enemyxu[9], enemyyu[9], enemyyu2[9], false);
      eu10 = new enemyu(enemyxu[10], enemyyu[10], enemyyu2[10], false);
      eu11 = new enemyu(enemyxu[11], enemyyu[11], enemyyu2[11], false);
      eu12 = new enemyu(enemyxu[12], enemyyu[12], enemyyu2[12], false);
      eu13 = new enemyu(enemyxu[13], enemyyu[13], enemyyu2[13], false);
      eu14 = new enemyu(enemyxu[14], enemyyu[14], enemyyu2[14], false);
      eu15 = new enemyu(enemyxu[15], enemyyu[15], enemyyu2[15], false);
      eu16 = new enemyu(enemyxu[16], enemyyu[16], enemyyu2[16], false);
      eu17 = new enemyu(enemyxu[17], enemyyu[17], enemyyu2[17], false);
      eu18 = new enemyu(enemyxu[18], enemyyu[18], enemyyu2[18], false);

      eui = new enemyu(enemyxui[0], enemyyui[0], enemyyui2[0], true);
      eui1 = new enemyu(enemyxui[1], enemyyui[1], enemyyui2[1], true);
      eui2 = new enemyu(enemyxui[2], enemyyui[2], enemyyui2[2], true);
      eui3 = new enemyu(enemyxui[3], enemyyui[3], enemyyui2[3], true);
      eui4 = new enemyu(enemyxui[4], enemyyui[4], enemyyui2[4], true);
      eui5 = new enemyu(enemyxui[5], enemyyui[5], enemyyui2[5], true);
      eui6 = new enemyu(enemyxui[6], enemyyui[6], enemyyui2[6], true);
      eui7 = new enemyu(enemyxui[7], enemyyui[7], enemyyui2[7], true);
      eui8 = new enemyu(enemyxui[8], enemyyui[8], enemyyui2[8], true);
      eui9 = new enemyu(enemyxui[9], enemyyui[9], enemyyui2[9], true);
      eui10 = new enemyu(enemyxui[10], enemyyui[10], enemyyui2[10], true);
      eui11 = new enemyu(enemyxui[11], enemyyui[11], enemyyui2[11], true);
      eui12 = new enemyu(enemyxui[12], enemyyui[12], enemyyui2[12], true);
      eui13 = new enemyu(enemyxui[13], enemyyui[13], enemyyui2[13], true);
      eui14 = new enemyu(enemyxui[14], enemyyui[14], enemyyui2[14], true);
      eui15 = new enemyu(enemyxui[15], enemyyui[15], enemyyui2[15], true);
      eui16 = new enemyu(enemyxui[16], enemyyui[16], enemyyui2[16], true);
      eui17 = new enemyu(enemyxui[17], enemyyui[17], enemyyui2[17], true);
      eui18 = new enemyu(enemyxui[18], enemyyui[18], enemyyui2[18], true);

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

      eu.move();
      eu.render();
      eu1.move();
      eu1.render();
      eu2.move();
      eu2.render();
      eu3.move();
      eu3.render();
      eu4.move();
      eu4.render();
      eu5.move();
      eu5.render();
      eu6.move();
      eu6.render();
      eu7.move();
      eu7.render();
      eu8.move();
      eu8.render();
      eu9.move();
      eu9.render();
      eu10.move();
      eu10.render();
      eu11.move();
      eu11.render();
      eu12.move();
      eu12.render();
      eu13.move();
      eu13.render();
      eu14.move();
      eu14.render();
      eu15.move();
      eu15.render();
      eu16.move();
      eu16.render();
      eu17.move();
      eu17.render();
      eu18.move();
      eu18.render();
      eu19.move();
      eu19.render();

      eui.move();
      eui.render();
      eui1.move();
      eui1.render();
      eui2.move();
      eui2.render();
      eui3.move();
      eui3.render();
      eui4.move();
      eui4.render();
      eui5.move();
      eui5.render();
      eui6.move();
      eui6.render();
      eui7.move();
      eui7.render();
      eui8.move();
      eui8.render();
      eui9.move();
      eui9.render();
      eui10.move();
      eui10.render();
      eui11.move();
      eui11.render();
      eui12.move();
      eui12.render();
      eui13.move();
      eui13.render();
      eui14.move();
      eui14.render();
      eui15.move();
      eui15.render();
      eui16.move();
      eui16.render();
      eui17.move();
      eui17.render();
      eui18.move();
      eui18.render();
      eui19.move();
      eui19.render();

      er.normal();
      er1.normal();
      er2.normal();
      er3.normal();
      er4.normal();
      er5.normal();
      er6.normal();
      er7.normal();
      er8.normal();
      er9.normal();
      er10.normal();
      er11.normal();
      er12.normal();
      er13.normal();
      er14.normal();
      er15.normal();
      er16.normal();
      er17.normal();
      er18.normal();
      er19.normal();

      noStroke();
      fill(0, 187, 255);
      rect(0, 0, 25, 25);

      p.movement();
      p.collision();
      p.render();
    }
  }
}
