int arraySize = 1000;
float[] removecubex  = new float[arraySize];
float[] removecubey  = new float[arraySize];
float[] checkpointx  = new float[arraySize];
float[] checkpointy  = new float[arraySize];
float[] checkpointx2 = new float[arraySize];
float[] checkpointy2 = new float[arraySize];

class editor {
  float blockType = 0;
  int clickedR = 0, clickedC = 0;
  int clickCheck = 0;
  boolean pressed = false, pressedC = false;

  editor() {
  }

  void rectG(float x, float y, float w, float h) {
    rect(floor(x) * 25, floor(y) * 25, w, h);
  }

  void render() {
    for (int i = 0; i <= clickedR; i++) {
      fill(0, 187, 255);
      rectG(removecubex[i], removecubey[i], 25, 25);
    }
    for (int i = 0; i <= clickedC; i++) {
      checkpoint(checkpointx[i], checkpointy[i], checkpointx2[i], checkpointy2[i]);
    }
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
      clickCheck = 1;
      pressedC = true;
    } else if (clickCheck == 1 && !pressedC && mousePressed && blockType == 1) {
      checkpointx2[clickedC] = ((mouseX / 25) - checkpointx[clickedC]) + 1;
      checkpointy2[clickedC] = ((mouseY / 25) - checkpointy[clickedC]) + 1;
      clickCheck = 0;
      pressedC = true;
    } else if (!mousePressed && pressedC) {
      pressedC = false;
    }
  }
}
