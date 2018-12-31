float currentSpacing = 0;

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  currentSpacing += constrain(e, -1, 1);
}

class editor {
  float blockType = 0;
  int clickedR = 0, clickedC = 0, clickedE = 0, clickedB = 0, clickedRC = 0, clickedRE = 0;
  int clickedEN = 0, clickedENI = 0, clickedENU = 0, clickedENIU = 0, clickedEP = 0;
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
    for (int i = 0; i <= clickedEP; i++) {
      fill(0, 0, 255);
      ellipse(enemypx[i] * 25, enemypy[i] * 25, 15, 15);
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
    } else if (!pressedC && mousePressed && blockType == 10) {
      clickedEP++;
      enemypx[clickedEP] = float(mouseX / 25) + 0.5;
      enemypy[clickedEP] = float(mouseY / 25) + 0.5;
      pressedC = true;
    } else if (!mousePressed && pressedC) {
      pressedC = false;
    }
  }

  void playLevel() {
    if (!setup) {
      p = new player(px, py, 1);
      e  = new enemys(enemyx[0], enemyy[0], enemyx2[0], false);
      e1 = new enemys(enemyx[1], enemyy[1], enemyx2[1], false);
      e2 = new enemys(enemyx[2], enemyy[2], enemyx2[2], false);
      e3 = new enemys(enemyx[3], enemyy[3], enemyx2[3], false);
      e4 = new enemys(enemyx[4], enemyy[4], enemyx2[4], false);
      e5 = new enemys(enemyx[5], enemyy[5], enemyx2[5], false);
      e6 = new enemys(enemyx[6], enemyy[6], enemyx2[6], false);
      e7 = new enemys(enemyx[7], enemyy[7], enemyx2[7], false);
      e8 = new enemys(enemyx[8], enemyy[8], enemyx2[8], false);
      e9 = new enemys(enemyx[9], enemyy[9], enemyx2[9], false);
      e10 = new enemys(enemyx[10], enemyy[10], enemyx2[10], false);
      e11 = new enemys(enemyx[11], enemyy[11], enemyx2[11], false);
      e12 = new enemys(enemyx[12], enemyy[12], enemyx2[12], false);
      e13 = new enemys(enemyx[13], enemyy[13], enemyx2[13], false);
      e14 = new enemys(enemyx[14], enemyy[14], enemyx2[14], false);
      e15 = new enemys(enemyx[15], enemyy[15], enemyx2[15], false);
      e16 = new enemys(enemyx[16], enemyy[16], enemyx2[16], false);
      e17 = new enemys(enemyx[17], enemyy[17], enemyx2[17], false);
      e18 = new enemys(enemyx[18], enemyy[18], enemyx2[18], false);
      e19 = new enemys(enemyx[19], enemyy[19], enemyx2[19], false);
      e20 = new enemys(enemyx[20], enemyy[20], enemyx2[20], false);
      e21 = new enemys(enemyx[21], enemyy[21], enemyx2[21], false);
      e22 = new enemys(enemyx[22], enemyy[22], enemyx2[22], false);
      e23 = new enemys(enemyx[23], enemyy[23], enemyx2[23], false);
      e24 = new enemys(enemyx[24], enemyy[24], enemyx2[24], false);
      e25 = new enemys(enemyx[25], enemyy[25], enemyx2[25], false);
      e26 = new enemys(enemyx[26], enemyy[26], enemyx2[26], false);
      e27 = new enemys(enemyx[27], enemyy[27], enemyx2[27], false);
      e28 = new enemys(enemyx[28], enemyy[28], enemyx2[28], false);
      e29 = new enemys(enemyx[29], enemyy[29], enemyx2[29], false);
      e30 = new enemys(enemyx[30], enemyy[30], enemyx2[30], false);
      e31 = new enemys(enemyx[31], enemyy[31], enemyx2[31], false);
      e32 = new enemys(enemyx[32], enemyy[32], enemyx2[32], false);
      e33 = new enemys(enemyx[33], enemyy[33], enemyx2[33], false);
      e34 = new enemys(enemyx[34], enemyy[34], enemyx2[34], false);
      e35 = new enemys(enemyx[35], enemyy[35], enemyx2[35], false);
      e36 = new enemys(enemyx[36], enemyy[36], enemyx2[36], false);
      e37 = new enemys(enemyx[37], enemyy[37], enemyx2[37], false);
      e38 = new enemys(enemyx[38], enemyy[38], enemyx2[38], false);
      e39 = new enemys(enemyx[39], enemyy[39], enemyx2[39], false);
      e40 = new enemys(enemyx[40], enemyy[40], enemyx2[40], false);
      e41 = new enemys(enemyx[41], enemyy[41], enemyx2[41], false);
      e42 = new enemys(enemyx[42], enemyy[42], enemyx2[42], false);
      e43 = new enemys(enemyx[43], enemyy[43], enemyx2[43], false);
      e44 = new enemys(enemyx[44], enemyy[44], enemyx2[44], false);
      e45 = new enemys(enemyx[45], enemyy[45], enemyx2[45], false);
      e46 = new enemys(enemyx[46], enemyy[46], enemyx2[46], false);
      e47 = new enemys(enemyx[47], enemyy[47], enemyx2[47], false);
      e48 = new enemys(enemyx[48], enemyy[48], enemyx2[48], false);
      e49 = new enemys(enemyx[49], enemyy[49], enemyx2[49], false);
      e50 = new enemys(enemyx[50], enemyy[50], enemyx2[50], false);

      ei   = new enemys(enemyxi[0], enemyyi[0], enemyxi2[0], true);
      ei1 = new enemys(enemyxi[1], enemyyi[1], enemyxi2[1], true);
      ei2 = new enemys(enemyxi[2], enemyyi[2], enemyxi2[2], true);
      ei3 = new enemys(enemyxi[3], enemyyi[3], enemyxi2[3], true);
      ei4 = new enemys(enemyxi[4], enemyyi[4], enemyxi2[4], true);
      ei5 = new enemys(enemyxi[5], enemyyi[5], enemyxi2[5], true);
      ei6 = new enemys(enemyxi[6], enemyyi[6], enemyxi2[6], true);
      ei7 = new enemys(enemyxi[7], enemyyi[7], enemyxi2[7], true);
      ei8 = new enemys(enemyxi[8], enemyyi[8], enemyxi2[8], true);
      ei9 = new enemys(enemyxi[9], enemyyi[9], enemyxi2[9], true);
      ei10 = new enemys(enemyxi[10], enemyyi[10], enemyxi2[10], true);
      ei11 = new enemys(enemyxi[11], enemyyi[11], enemyxi2[11], true);
      ei12 = new enemys(enemyxi[12], enemyyi[12], enemyxi2[12], true);
      ei13 = new enemys(enemyxi[13], enemyyi[13], enemyxi2[13], true);
      ei14 = new enemys(enemyxi[14], enemyyi[14], enemyxi2[14], true);
      ei15 = new enemys(enemyxi[15], enemyyi[15], enemyxi2[15], true);
      ei16 = new enemys(enemyxi[16], enemyyi[16], enemyxi2[16], true);
      ei17 = new enemys(enemyxi[17], enemyyi[17], enemyxi2[17], true);
      ei18 = new enemys(enemyxi[18], enemyyi[18], enemyxi2[18], true);
      ei19 = new enemys(enemyxi[19], enemyyi[19], enemyxi2[19], true);
      ei20 = new enemys(enemyxi[20], enemyyi[20], enemyxi2[20], true);
      ei21 = new enemys(enemyxi[21], enemyyi[21], enemyxi2[21], true);
      ei22 = new enemys(enemyxi[22], enemyyi[22], enemyxi2[22], true);
      ei23 = new enemys(enemyxi[23], enemyyi[23], enemyxi2[23], true);
      ei24 = new enemys(enemyxi[24], enemyyi[24], enemyxi2[24], true);
      ei25 = new enemys(enemyxi[25], enemyyi[25], enemyxi2[25], true);
      ei26 = new enemys(enemyxi[26], enemyyi[26], enemyxi2[26], true);
      ei27 = new enemys(enemyxi[27], enemyyi[27], enemyxi2[27], true);
      ei28 = new enemys(enemyxi[28], enemyyi[28], enemyxi2[28], true);
      ei29 = new enemys(enemyxi[29], enemyyi[29], enemyxi2[29], true);
      ei30 = new enemys(enemyxi[30], enemyyi[30], enemyxi2[30], true);
      ei31 = new enemys(enemyxi[31], enemyyi[31], enemyxi2[31], true);
      ei32 = new enemys(enemyxi[32], enemyyi[32], enemyxi2[32], true);
      ei33 = new enemys(enemyxi[33], enemyyi[33], enemyxi2[33], true);
      ei34 = new enemys(enemyxi[34], enemyyi[34], enemyxi2[34], true);
      ei35 = new enemys(enemyxi[35], enemyyi[35], enemyxi2[35], true);
      ei36 = new enemys(enemyxi[36], enemyyi[36], enemyxi2[36], true);
      ei37 = new enemys(enemyxi[37], enemyyi[37], enemyxi2[37], true);
      ei38 = new enemys(enemyxi[38], enemyyi[38], enemyxi2[38], true);
      ei39 = new enemys(enemyxi[39], enemyyi[39], enemyxi2[39], true);
      ei40 = new enemys(enemyxi[40], enemyyi[40], enemyxi2[40], true);
      ei41 = new enemys(enemyxi[41], enemyyi[41], enemyxi2[41], true);
      ei42 = new enemys(enemyxi[42], enemyyi[42], enemyxi2[42], true);
      ei43 = new enemys(enemyxi[43], enemyyi[43], enemyxi2[43], true);
      ei44 = new enemys(enemyxi[44], enemyyi[44], enemyxi2[44], true);
      ei45 = new enemys(enemyxi[45], enemyyi[45], enemyxi2[45], true);
      ei46 = new enemys(enemyxi[46], enemyyi[46], enemyxi2[46], true);
      ei47 = new enemys(enemyxi[47], enemyyi[47], enemyxi2[47], true);
      ei48 = new enemys(enemyxi[48], enemyyi[48], enemyxi2[48], true);
      ei49 = new enemys(enemyxi[49], enemyyi[49], enemyxi2[49], true);
      ei50 = new enemys(enemyxi[50], enemyyi[50], enemyxi2[50], true);

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
      eu19 = new enemyu(enemyxu[19], enemyyu[19], enemyyu2[19], false);
      eu20 = new enemyu(enemyxu[20], enemyyu[20], enemyyu2[20], false);
      eu21 = new enemyu(enemyxu[21], enemyyu[21], enemyyu2[21], false);
      eu22 = new enemyu(enemyxu[22], enemyyu[22], enemyyu2[22], false);
      eu23 = new enemyu(enemyxu[23], enemyyu[23], enemyyu2[23], false);
      eu24 = new enemyu(enemyxu[24], enemyyu[24], enemyyu2[24], false);
      eu25 = new enemyu(enemyxu[25], enemyyu[25], enemyyu2[25], false);
      eu26 = new enemyu(enemyxu[26], enemyyu[26], enemyyu2[26], false);
      eu27 = new enemyu(enemyxu[27], enemyyu[27], enemyyu2[27], false);
      eu28 = new enemyu(enemyxu[28], enemyyu[28], enemyyu2[28], false);
      eu29 = new enemyu(enemyxu[29], enemyyu[29], enemyyu2[29], false);
      eu30 = new enemyu(enemyxu[30], enemyyu[30], enemyyu2[30], false);
      eu31 = new enemyu(enemyxu[31], enemyyu[31], enemyyu2[31], false);
      eu32 = new enemyu(enemyxu[32], enemyyu[32], enemyyu2[32], false);
      eu33 = new enemyu(enemyxu[33], enemyyu[33], enemyyu2[33], false);
      eu34 = new enemyu(enemyxu[34], enemyyu[34], enemyyu2[34], false);
      eu35 = new enemyu(enemyxu[35], enemyyu[35], enemyyu2[35], false);
      eu36 = new enemyu(enemyxu[36], enemyyu[36], enemyyu2[36], false);
      eu37 = new enemyu(enemyxu[37], enemyyu[37], enemyyu2[37], false);
      eu38 = new enemyu(enemyxu[38], enemyyu[38], enemyyu2[38], false);
      eu39 = new enemyu(enemyxu[39], enemyyu[39], enemyyu2[39], false);
      eu40 = new enemyu(enemyxu[40], enemyyu[40], enemyyu2[40], false);
      eu41 = new enemyu(enemyxu[41], enemyyu[41], enemyyu2[41], false);
      eu42 = new enemyu(enemyxu[42], enemyyu[42], enemyyu2[42], false);
      eu43 = new enemyu(enemyxu[43], enemyyu[43], enemyyu2[43], false);
      eu44 = new enemyu(enemyxu[44], enemyyu[44], enemyyu2[44], false);
      eu45 = new enemyu(enemyxu[45], enemyyu[45], enemyyu2[45], false);
      eu46 = new enemyu(enemyxu[46], enemyyu[46], enemyyu2[46], false);
      eu47 = new enemyu(enemyxu[47], enemyyu[47], enemyyu2[47], false);
      eu48 = new enemyu(enemyxu[48], enemyyu[48], enemyyu2[48], false);
      eu49 = new enemyu(enemyxu[49], enemyyu[49], enemyyu2[49], false);
      eu50 = new enemyu(enemyxu[50], enemyyu[50], enemyyu2[50], false);

      eui = new enemyu(enemyxui[0], enemyyui[0], enemyyui2[0], true);
      eui = new enemyu(enemyxui[0], enemyyui[0], enemyyui2[0], false);
      eui1 = new enemyu(enemyxui[1], enemyyui[1], enemyyui2[1], false);
      eui2 = new enemyu(enemyxui[2], enemyyui[2], enemyyui2[2], false);
      eui3 = new enemyu(enemyxui[3], enemyyui[3], enemyyui2[3], false);
      eui4 = new enemyu(enemyxui[4], enemyyui[4], enemyyui2[4], false);
      eui5 = new enemyu(enemyxui[5], enemyyui[5], enemyyui2[5], false);
      eui6 = new enemyu(enemyxui[6], enemyyui[6], enemyyui2[6], false);
      eui7 = new enemyu(enemyxui[7], enemyyui[7], enemyyui2[7], false);
      eui8 = new enemyu(enemyxui[8], enemyyui[8], enemyyui2[8], false);
      eui9 = new enemyu(enemyxui[9], enemyyui[9], enemyyui2[9], false);
      eui10 = new enemyu(enemyxui[10], enemyyui[10], enemyyui2[10], false);
      eui11 = new enemyu(enemyxui[11], enemyyui[11], enemyyui2[11], false);
      eui12 = new enemyu(enemyxui[12], enemyyui[12], enemyyui2[12], false);
      eui13 = new enemyu(enemyxui[13], enemyyui[13], enemyyui2[13], false);
      eui14 = new enemyu(enemyxui[14], enemyyui[14], enemyyui2[14], false);
      eui15 = new enemyu(enemyxui[15], enemyyui[15], enemyyui2[15], false);
      eui16 = new enemyu(enemyxui[16], enemyyui[16], enemyyui2[16], false);
      eui17 = new enemyu(enemyxui[17], enemyyui[17], enemyyui2[17], false);
      eui18 = new enemyu(enemyxui[18], enemyyui[18], enemyyui2[18], false);
      eui19 = new enemyu(enemyxui[19], enemyyui[19], enemyyui2[19], false);
      eui20 = new enemyu(enemyxui[20], enemyyui[20], enemyyui2[20], false);
      eui21 = new enemyu(enemyxui[21], enemyyui[21], enemyyui2[21], false);
      eui22 = new enemyu(enemyxui[22], enemyyui[22], enemyyui2[22], false);
      eui23 = new enemyu(enemyxui[23], enemyyui[23], enemyyui2[23], false);
      eui24 = new enemyu(enemyxui[24], enemyyui[24], enemyyui2[24], false);
      eui25 = new enemyu(enemyxui[25], enemyyui[25], enemyyui2[25], false);
      eui26 = new enemyu(enemyxui[26], enemyyui[26], enemyyui2[26], false);
      eui27 = new enemyu(enemyxui[27], enemyyui[27], enemyyui2[27], false);
      eui28 = new enemyu(enemyxui[28], enemyyui[28], enemyyui2[28], false);
      eui29 = new enemyu(enemyxui[29], enemyyui[29], enemyyui2[29], false);
      eui30 = new enemyu(enemyxui[30], enemyyui[30], enemyyui2[30], false);
      eui31 = new enemyu(enemyxui[31], enemyyui[31], enemyyui2[31], false);
      eui32 = new enemyu(enemyxui[32], enemyyui[32], enemyyui2[32], false);
      eui33 = new enemyu(enemyxui[33], enemyyui[33], enemyyui2[33], false);
      eui34 = new enemyu(enemyxui[34], enemyyui[34], enemyyui2[34], false);
      eui35 = new enemyu(enemyxui[35], enemyyui[35], enemyyui2[35], false);
      eui36 = new enemyu(enemyxui[36], enemyyui[36], enemyyui2[36], false);
      eui37 = new enemyu(enemyxui[37], enemyyui[37], enemyyui2[37], false);
      eui38 = new enemyu(enemyxui[38], enemyyui[38], enemyyui2[38], false);
      eui39 = new enemyu(enemyxui[39], enemyyui[39], enemyyui2[39], false);
      eui40 = new enemyu(enemyxui[40], enemyyui[40], enemyyui2[40], false);
      eui41 = new enemyu(enemyxui[41], enemyyui[41], enemyyui2[41], false);
      eui42 = new enemyu(enemyxui[42], enemyyui[42], enemyyui2[42], false);
      eui43 = new enemyu(enemyxui[43], enemyyui[43], enemyyui2[43], false);
      eui44 = new enemyu(enemyxui[44], enemyyui[44], enemyyui2[44], false);
      eui45 = new enemyu(enemyxui[45], enemyyui[45], enemyyui2[45], false);
      eui46 = new enemyu(enemyxui[46], enemyyui[46], enemyyui2[46], false);
      eui47 = new enemyu(enemyxui[47], enemyyui[47], enemyyui2[47], false);
      eui48 = new enemyu(enemyxui[48], enemyyui[48], enemyyui2[48], false);
      eui49 = new enemyu(enemyxui[49], enemyyui[49], enemyyui2[49], false);
      eui50 = new enemyu(enemyxui[50], enemyyui[50], enemyyui2[50], false);
      
      er  = new rectenemy(enemypx[0], enemypy[0]);
      er1 = new rectenemy(enemypx[1], enemypy[1]);
      er2 = new rectenemy(enemypx[2], enemypy[2]);
      er3 = new rectenemy(enemypx[3], enemypy[3]);
      er4 = new rectenemy(enemypx[4], enemypy[4]);
      er5 = new rectenemy(enemypx[5], enemypy[5]);
      er6 = new rectenemy(enemypx[6], enemypy[6]);
      er7 = new rectenemy(enemypx[7], enemypy[7]);
      er8 = new rectenemy(enemypx[8], enemypy[8]);
      er9 = new rectenemy(enemypx[9], enemypy[9]);
      er10 = new rectenemy(enemypx[10], enemypy[10]);
      er11 = new rectenemy(enemypx[11], enemypy[11]);
      er12 = new rectenemy(enemypx[12], enemypy[12]);
      er13 = new rectenemy(enemypx[13], enemypy[13]);
      er14 = new rectenemy(enemypx[14], enemypy[14]);
      er15 = new rectenemy(enemypx[15], enemypy[15]);
      er16 = new rectenemy(enemypx[16], enemypy[16]);
      er17 = new rectenemy(enemypx[17], enemypy[17]);
      er18 = new rectenemy(enemypx[18], enemypy[18]);
      er19 = new rectenemy(enemypx[19], enemypy[19]);
      er20 = new rectenemy(enemypx[20], enemypy[20]);
      er21 = new rectenemy(enemypx[21], enemypy[21]);
      er22 = new rectenemy(enemypx[22], enemypy[22]);
      er23 = new rectenemy(enemypx[23], enemypy[23]);
      er24 = new rectenemy(enemypx[24], enemypy[24]);
      er25 = new rectenemy(enemypx[25], enemypy[25]);
      er26 = new rectenemy(enemypx[26], enemypy[26]);
      er27 = new rectenemy(enemypx[27], enemypy[27]);
      er28 = new rectenemy(enemypx[28], enemypy[28]);
      er29 = new rectenemy(enemypx[29], enemypy[29]);
      er30 = new rectenemy(enemypx[30], enemypy[30]);
      er31 = new rectenemy(enemypx[31], enemypy[31]);
      er32 = new rectenemy(enemypx[32], enemypy[32]);
      er33 = new rectenemy(enemypx[33], enemypy[33]);
      er34 = new rectenemy(enemypx[34], enemypy[34]);
      er35 = new rectenemy(enemypx[35], enemypy[35]);
      er36 = new rectenemy(enemypx[36], enemypy[36]);
      er37 = new rectenemy(enemypx[37], enemypy[37]);
      er38 = new rectenemy(enemypx[38], enemypy[38]);
      er39 = new rectenemy(enemypx[39], enemypy[39]);
      er40 = new rectenemy(enemypx[40], enemypy[40]);
      er41 = new rectenemy(enemypx[41], enemypy[41]);
      er42 = new rectenemy(enemypx[42], enemypy[42]);
      er43 = new rectenemy(enemypx[43], enemypy[43]);
      er44 = new rectenemy(enemypx[44], enemypy[44]);
      er45 = new rectenemy(enemypx[45], enemypy[45]);
      er46 = new rectenemy(enemypx[46], enemypy[46]);
      er47 = new rectenemy(enemypx[47], enemypy[47]);
      er48 = new rectenemy(enemypx[48], enemypy[48]);
      er49 = new rectenemy(enemypx[49], enemypy[49]);
      er50 = new rectenemy(enemypx[50], enemypy[50]);



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
      e20.move();
      e20.render();
      e21.move();
      e21.render();
      e22.move();
      e22.render();
      e23.move();
      e23.render();
      e24.move();
      e24.render();
      e25.move();
      e25.render();
      e26.move();
      e26.render();
      e27.move();
      e27.render();
      e28.move();
      e28.render();
      e29.move();
      e29.render();
      e30.move();
      e30.render();
      e31.move();
      e31.render();
      e32.move();
      e32.render();
      e33.move();
      e33.render();
      e34.move();
      e34.render();
      e35.move();
      e35.render();
      e36.move();
      e36.render();
      e37.move();
      e37.render();
      e38.move();
      e38.render();
      e39.move();
      e39.render();
      e40.move();
      e40.render();
      e41.move();
      e41.render();
      e42.move();
      e42.render();
      e43.move();
      e43.render();
      e44.move();
      e44.render();
      e45.move();
      e45.render();
      e46.move();
      e46.render();
      e47.move();
      e47.render();
      e48.move();
      e48.render();
      e49.move();
      e49.render();
      e50.move();
      e50.render();

      ei.move();
      ei.render();
      ei1.move();
      ei1.render();
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
      ei20.move();
      ei20.render();
      ei21.move();
      ei21.render();
      ei22.move();
      ei22.render();
      ei23.move();
      ei23.render();
      ei24.move();
      ei24.render();
      ei25.move();
      ei25.render();
      ei26.move();
      ei26.render();
      ei27.move();
      ei27.render();
      ei28.move();
      ei28.render();
      ei29.move();
      ei29.render();
      ei30.move();
      ei30.render();
      ei31.move();
      ei31.render();
      ei32.move();
      ei32.render();
      ei33.move();
      ei33.render();
      ei34.move();
      ei34.render();
      ei35.move();
      ei35.render();
      ei36.move();
      ei36.render();
      ei37.move();
      ei37.render();
      ei38.move();
      ei38.render();
      ei39.move();
      ei39.render();
      ei40.move();
      ei40.render();
      ei41.move();
      ei41.render();
      ei42.move();
      ei42.render();
      ei43.move();
      ei43.render();
      ei44.move();
      ei44.render();
      ei45.move();
      ei45.render();
      ei46.move();
      ei46.render();
      ei47.move();
      ei47.render();
      ei48.move();
      ei48.render();
      ei49.move();
      ei49.render();
      ei50.move();
      ei50.render();

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
      eu20.move();
      eu20.render();
      eu21.move();
      eu21.render();
      eu22.move();
      eu22.render();
      eu23.move();
      eu23.render();
      eu24.move();
      eu24.render();
      eu25.move();
      eu25.render();
      eu26.move();
      eu26.render();
      eu27.move();
      eu27.render();
      eu28.move();
      eu28.render();
      eu29.move();
      eu29.render();
      eu30.move();
      eu30.render();
      eu31.move();
      eu31.render();
      eu32.move();
      eu32.render();
      eu33.move();
      eu33.render();
      eu34.move();
      eu34.render();
      eu35.move();
      eu35.render();
      eu36.move();
      eu36.render();
      eu37.move();
      eu37.render();
      eu38.move();
      eu38.render();
      eu39.move();
      eu39.render();
      eu40.move();
      eu40.render();
      eu41.move();
      eu41.render();
      eu42.move();
      eu42.render();
      eu43.move();
      eu43.render();
      eu44.move();
      eu44.render();
      eu45.move();
      eu45.render();
      eu46.move();
      eu46.render();
      eu47.move();
      eu47.render();
      eu48.move();
      eu48.render();
      eu49.move();
      eu49.render();
      eu50.move();
      eu50.render();

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
      eui20.move();
      eui20.render();
      eui21.move();
      eui21.render();
      eui22.move();
      eui22.render();
      eui23.move();
      eui23.render();
      eui24.move();
      eui24.render();
      eui25.move();
      eui25.render();
      eui26.move();
      eui26.render();
      eui27.move();
      eui27.render();
      eui28.move();
      eui28.render();
      eui29.move();
      eui29.render();
      eui30.move();
      eui30.render();
      eui31.move();
      eui31.render();
      eui32.move();
      eui32.render();
      eui33.move();
      eui33.render();
      eui34.move();
      eui34.render();
      eui35.move();
      eui35.render();
      eui36.move();
      eui36.render();
      eui37.move();
      eui37.render();
      eui38.move();
      eui38.render();
      eui39.move();
      eui39.render();
      eui40.move();
      eui40.render();
      eui41.move();
      eui41.render();
      eui42.move();
      eui42.render();
      eui43.move();
      eui43.render();
      eui44.move();
      eui44.render();
      eui45.move();
      eui45.render();
      eui46.move();
      eui46.render();
      eui47.move();
      eui47.render();
      eui48.move();
      eui48.render();
      eui49.move();
      eui49.render();
      eui50.move();
      eui50.render();

      er1.movement();
      er1.render();
      er2.movement();
      er2.render();
      er3.movement();
      er3.render();
      er4.movement();
      er4.render();
      er5.movement();
      er5.render();
      er6.movement();
      er6.render();
      er7.movement();
      er7.render();
      er8.movement();
      er8.render();
      er9.movement();
      er9.render();
      er10.movement();
      er10.render();
      er11.movement();
      er11.render();
      er12.movement();
      er12.render();
      er13.movement();
      er13.render();
      er14.movement();
      er14.render();
      er15.movement();
      er15.render();
      er16.movement();
      er16.render();
      er17.movement();
      er17.render();
      er18.movement();
      er18.render();
      er19.movement();
      er19.render();
      er20.movement();
      er20.render();
      er21.movement();
      er21.render();
      er22.movement();
      er22.render();
      er23.movement();
      er23.render();
      er24.movement();
      er24.render();
      er25.movement();
      er25.render();
      er26.movement();
      er26.render();
      er27.movement();
      er27.render();
      er28.movement();
      er28.render();
      er29.movement();
      er29.render();
      er30.movement();
      er30.render();
      er31.movement();
      er31.render();
      er32.movement();
      er32.render();
      er33.movement();
      er33.render();
      er34.movement();
      er34.render();
      er35.movement();
      er35.render();
      er36.movement();
      er36.render();
      er37.movement();
      er37.render();
      er38.movement();
      er38.render();
      er39.movement();
      er39.render();
      er40.movement();
      er40.render();
      er41.movement();
      er41.render();
      er42.movement();
      er42.render();
      er43.movement();
      er43.render();
      er44.movement();
      er44.render();
      er45.movement();
      er45.render();
      er46.movement();
      er46.render();
      er47.movement();
      er47.render();
      er48.movement();
      er48.render();
      er49.movement();
      er49.render();
      er50.movement();
      er50.render();

      noStroke();
      fill(0, 187, 255);
      rect(0, 0, 25, 25);

      p.movement();
      p.collision();
      p.render();
    }
  }
}
