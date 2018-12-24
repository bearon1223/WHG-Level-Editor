void checkerboard2x2(float x, float y) {
  float offx = x;
  float offy = y;
  float widths = grid;
  noStroke();
  fill(255, 255, 255);
  rect((25*offx), (25*offy), widths, widths);
  fill(240, 240, 240);
  rect((25*offx), (25*(offy+1)), widths, widths);
  fill(255, 255, 255);
  rect((25*(offx+1)), (25*(offy+1)), widths, widths);
  fill(240, 240, 240);
  rect((25*(offx+1)), (25*offy), widths, widths);
}

void checkpoint(float x, float y, float  sx, float sy) {
  fill(0, 255, 119);
  noStroke();
  rect(x * 25, y * 25, sx * 25, sy * 25);
};
