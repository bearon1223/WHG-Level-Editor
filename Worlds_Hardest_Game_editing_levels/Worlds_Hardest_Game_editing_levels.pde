float grid = 25;

void setup() {
  size(800, 600);
  surface.setTitle("Worlds Hardest Game Level Editor");
  text("Loading...", 400, 300);
}

editor edit = new editor();

void draw () {
  background(0, 187, 255);
  for (int j = 0;j<=18; j+=2) {
    for (int i = 0; i<=22; i+=2) {
      checkerboard2x2(4+i, 2+j);
    }
  }
  edit.user();
  edit.render();
}
