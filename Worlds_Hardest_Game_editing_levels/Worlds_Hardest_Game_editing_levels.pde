float grid = 25;
float px = 12;
float py = 12;
boolean play = false;

void setup() {
  size(800, 600);
  surface.setTitle("Worlds Hardest Game Level Editor b0.1");
  text("Loading...", 400, 300);
}

editor edit = new editor();
player p = new player(px, py, 1);

void draw () {
  background(0, 187, 255);
  for (int j = 0; j<=18; j+=2) {
    for (int i = 0; i<=22; i+=2) {
      checkerboard2x2(4+i, 2+j);
    }
  }
  if (!play) {
    edit.user();
    edit.render();
    if (key == 'r') {
      play = true;
    }
  } else {
    edit.playLevel();
  }
}
