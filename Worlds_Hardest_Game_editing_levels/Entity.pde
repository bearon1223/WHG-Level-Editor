class player {
  float x, y, s, sx, sy, sxs, sys, timer = 0;
  player(float x, float y, float s) {
    this.x = x * 25;
    this.y = y * 25;
    this.s = s;
    this.sx = s;
    this.sy = s;
    this.sxs = x;
    this.sys = y;
  }

  void render() {
    stroke(121, 0, 0);
    strokeWeight(3);
    fill(255, 0, 0);
    rect(this.x, this.y, 15, 15);
  }

  //void win() {
  //  setup = false;
  //  scene++;
  //  if (levels > wins) {
  //    wins++;
  //  }
  //  coinsCollectedC = 0;
  //  coinAmountPublic = 0;
  //  coinsCollected = 0;
  //  getMoney(5);
  //  allowd = false;
  //  allowed = false;
  //}

  boolean allowed = false;

  void collision() {
    color a1 = get(int(this.x), int(this.y));
    color a2 = get(int(this.x + 15), int(this.y));
    color a3 = get(int(this.x + 15), int(this.y + 15));
    color a4 = get(int(this.x), int(this.y + 15));
    color a5 = get(int(this.x + (15 / 2)), int(this.y));
    color a6 = get(int(this.x + 15), int(this.y + (15 / 2)));
    color a7 = get(int(this.x + (15 / 2)), int(this.y + 15));
    color a8 = get(int(this.x), int(this.y  + (15 / 2)));

    //if ((a1 == color(0, 0, 255) || a2 == color(0, 0, 255) || a3 == color(0, 0, 255) || a4 == color(0, 0, 255)) || (a5 == color(0, 0, 255) || a6 == color(0, 0, 255) || a7 == color(0, 0, 255) || a8 == color(0, 0, 255))) {
    //  this.x = psx;
    //  this.y = psy;
    //  fail++;
    //  coinsCollected = coinsCollectedC;
    //  if (coinAmountPublic < 1) {
    //    allowd = allowed;
    //  }
    //}

    //if (a3 == color(0, 255, 119) || a2 == color(0, 255, 119) || a4 == color(0, 255, 119) || a1 == color(0, 255, 119)) {
    //  psx = this.x;
    //  psy = this.y;
    //  coinsCollectedC = coinsCollected;
    //  if (allowd) {
    //    allowed = true;
    //  }
    //}
    //if (a3 == color(0, 253, 119) || a2 == color(0, 253, 119) || a1 == color(0, 253, 119) || a4 == color(0, 253, 119)) {
    //  coinsCollectedC = coinsCollected;
    //  if (allowd) {
    //    allowed = true;
    //  }
    //}

    //if (a1 == color(0, 254, 119) || a2 == color(0, 254, 119) || a3 == color(0, 254, 119) || a4 == color(0, 254, 119)) {
    //  win();
    //}

    //if ((a1 == color(255, 255, 0) || a2 == color(255, 255, 0) || a3 == color(255, 255, 0) || a4 == color(255, 255, 0))) {
    //  if (coinAmountPublic <= 0) {
    //    allowd = true;
    //  } else {
    //    coinsCollected++;
    //  }
    //  getMoney(5);
    //}

    if ((a1 == color(0) || a2 == color(0) || a3 == color(0) || a4 == color(0)) && keyCode == LEFT) {
      this.sx = 0;
      this.x += 1;
    } else {
      this.sx = this.s;
    }
    if ((a1 == color(0) || a2 == color(0) || a3 == color(0) || a4 == color(0)) && keyCode == RIGHT) {
      this.sx = 0;
      this.x -= 1;
    } else {
      this.sx = this.s;
    }
    if ((a1 == color(0) || a2 == color(0) || a3 == color(0) || a4 == color(0)) && keyCode == UP) {
      this.sy = 0;
      this.y += 1;
    } else {
      this.sy = this.s;
    }
    if ((a1 == color(0) || a2 == color(0) || a3 == color(0) || a4 == color(0)) && keyCode == DOWN) {
      this.sy = 0;
      this.y -= 1;
    } else {
      this.sy = this.s;
    }
  }

  void movement() {
    if (keyPressed) {
      if (keyCode == UP) {
        this.y -= this.sy;
      }
      if (keyCode == DOWN) {
        this.y += this.sy;
      }
      if (keyCode == LEFT) {
        this.x -= this.sx;
      }
      if (keyCode == RIGHT) {
        this.x += this.sx;
      }
    }
  }
}

class enemys {
  float Sx, y, Dx, speed, x;
  boolean i;
  float s = 2;
  enemys(float x, float y, float x0, boolean i) {
    this.Sx = (x * 25);
    this.y = (y * 25);
    this.Dx =x0 * 25;
    this.i = i;
    this.x = this.Sx;

    this.speed = s;
  }

  enemys(float x, float y, float x0, boolean i, float ss) {
    this.Sx = (x * 25);
    this.y = (y * 25);
    this.Dx =x0 * 25;
    this.i = i;
    this.x = this.Sx;
    s = ss;
    this.speed = ss;
  }
  void move() {
    if (!i) {
      if (this.x < this.Sx) {
        this.speed = s;
      }
      if (this.x > this.Dx) {
        this.speed = -s;
      }
    }
    if (i) {
      if (this.x > this.Sx) {
        this.speed = -s;
      }
      if (this.x < this.Dx) {
        this.speed = s;
      }
    }
    this.x += this.speed;
  }

  void render() {
    fill(0, 0, 255);
    stroke(0, 0, 0);
    noStroke();
    ellipse(this.x, y, 15, 15);
  }
}
